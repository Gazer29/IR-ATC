local event = require("event")
local term = require ("term")
--local gpu = component.gpu
local serial = require("serialization")
local component = require("component")
--local sides = require("sides")
local fs = require("filesystem")
local keyboard = require("keyboard")
local wait = 3

local x, y, z = component.ir_augment_detector.getPos()
local XX = tostring(x)
local YY = tostring(y)
local ZZ = tostring(z)
local Pos = tostring("SwtX"..XX.."Y"..YY.."Z"..ZZ)
print (Pos)
-- The name of the file which holds information about the switches.
local SWITCH_DEFINITION_FILE = "/home/"..Pos..".tbl"
-- The table of switch information, that is loaded from the above file on startup.
local switches = nil
local state = nil

local RUNNING = true

local OffDelay = 30 -- Seconds
local currOut = false

-- Loads the switch definition from a serialized table.
local function loadSwitchDefinitionFromFile(filename)
  local file = io.open(filename, "r")
  if file == nil then
    io.stderr:write("Could not open file "..filename.." for reading.\n")
    return nil
  end
  local tbl = serial.unserialize(file:read("*a"))
  file:close()
  return tbl
end

-- Gets switch information from the user, and saves it to the file.
local function initSwitchDefinitionFile(filename)
  local switchCount = 1
  local tentative_switches = {}
  for i=1, switchCount do
    local detector_address = 0
    local rs_address = 1
    local switch_to = 0
      tentative_switches[i] = {
        detector_address = detector_address,
        rs_address = rs_address,
        switch_to = switch_to
      }
      i = i - 1
  end
  local f = io.open(filename, "w")
  if f == nil then
    io.stderr:write("Could not open file\n")
    return nil
  end
  f:write(serial.serialize(tentative_switches))
  f:close()
  return tentative_switches
end

-- Gets switch information from the user, and saves it to the file.
local function initSwitchDefinitionFile1(filename)
  local switchCount = 1
  local tentative_switches = {}
  for i=1, switchCount do
    local detector_address = 0
    local rs_address = 1
    local switch_to = 0
      tentative_switches[i] = {
        detector_address = detector_address,
      }
      i = i - 1
  end
  local f = io.open(filename, "w")
  if f == nil then
    io.stderr:write("Could not open file\n")
    return nil
  end
  f:write(serial.serialize(tentative_switches))
  f:close()
  return tentative_switches
end

-- Sets the output of all switches to 0, to reset the system.
local function resetSwitches(switches)
  for index, switch in pairs(switches) do
    component.redstone.setOutput({0, 0, 0, 0, 0, 0})
  end
end	

-- What to do when a train runs over a detector, just before it reaches the switch.
local function checkFile()
  local this_switch = nil
  for index, switch in pairs(switches) do
    if switch.switch_to == 1 then
	  component.redstone.setOutput({15, 15, 15, 15, 15, 15})
	  currOut = true
	  --if state == 0 then
		--initSwitchDefinitionFile1(SWITCH_DEFINITION_FILE)
		--end
	  --state = 1
    else
	  if currOut == true then
		print("Delayed Off")
		os.sleep(OffDelay)
		end
	  component.redstone.setOutput({0, 0, 0, 0, 0, 0})
	  currOut = false
	  --if state == 1 then
		--initSwitchDefinitionFile1(SWITCH_DEFINITION_FILE)
		--end
	  --state = 0
	end
  end
end

-- What to do when the user has typed some keys.
local function onKeyDown(code)
  local key = keyboard.keys[code]
  if (keyboard.isControlDown()) then
    if (key == "r") then
      print("Resetting switches to their default positions.")
      resetSwitches(switches)
    elseif (key == "q") then
      print("Quitting.")
      RUNNING = false
    end
  end
end

-- General purpose event handler that delegates different events to their own functions.
local function handleEvents()
  local event_name, p1, p2, p3, p4, p5 = event.pull()
  if event_name == "ir_train_overhead" then
    local component_address = p1
    local augment_type = p2
    local stock_uuid = p3
  elseif event_name == "key_down" then
    local key_code = p3
    onKeyDown(key_code)
  end
end

-- The main loop of the program.

while RUNNING do
  -- Load the switch definitions from either a file, or from the user if it's the first time.
	if (fs.exists(SWITCH_DEFINITION_FILE)) then
		switches = loadSwitchDefinitionFromFile(SWITCH_DEFINITION_FILE)
		print("Loaded switch definition from file.")
		checkFile()
	else
		switches = initSwitchDefinitionFile(SWITCH_DEFINITION_FILE)
		print("Wrote switch definition to file.")
	end

	if switches == nil then
		io.stderr:write("Fatal error: Could not load switch definition from file or user input.\n")
		return
	end
	
	os.sleep(wait)
end