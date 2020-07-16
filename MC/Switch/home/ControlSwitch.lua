local event = require("event")
local term = require ("term")
local serial = require("serialization")
local component = require("component")
local fs = require("filesystem")
local wait = 3
local x, y, z = component.ir_augment_detector.getPos()
local XX = tostring(x)
local YY = tostring(y)
local ZZ = tostring(z)
local Pos = tostring("x"..XX.."y"..YY.."z"..ZZ)
print (Pos)
local DATA_FOLDER = "/home/SwitchData/"
local CONTROL_FILE = "/home/SwitchControl.tbl"
-- The name of the file which holds information about the switches.
local SWITCH_DEFINITION_FILE = "/home/SwitchData/"..Pos..".tbl"
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
  local data = serial.unserialize(file:read("*a"))
  file:close()
  local check = false
  if data == nil then
	print("Could not read file")
	else
	  for k, v in pairs(data) do
		--print("k"..k)
		for u, o in pairs(v) do
			--print("u: "..u..", o: "..(tostring(o)))
			if o == Pos then
				print("Control ON")
				tbl = v
				check = true
			end
		end
	  end
	if check then
		return tbl
	else
		print("Control OFF")
		return nil
	end
  end
end

-- Gets switch information from the user, and saves it to the file.
local function initSwitchDefinitionFile(filename)
  local switchCount = 1
  local tentative_switches = {}
  for i=1, switchCount do
    local switch = 0
	  tentative_switches = {
      --tentative_switches[i] = {
        pos = Pos,
        switch = switch
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

-- What to do when a train runs over a detector, just before it reaches the switch.
local function checkFile()
    if switches.switch == true then
	  component.redstone.setOutput({15, 15, 15, 15, 15, 15})
	  currOut = true
    else
	  if currOut == true then
		print("Delayed Off")
		os.sleep(OffDelay)
		end
	  component.redstone.setOutput({0, 0, 0, 0, 0, 0})
	  currOut = false
	end
end


-- The main loop of the program.

while RUNNING do
  -- Load the switch definitions from either a file, or from the user if it's the first time.
  
	if (fs.exists(DATA_FOLDER)) then
	else
	fs.makeDirectory(DATA_FOLDER)
	end
	
	-- Write data to file in folder
	if (fs.exists(SWITCH_DEFINITION_FILE)) then
	else
		initSwitchDefinitionFile(SWITCH_DEFINITION_FILE)
		print("Wrote switch definition to file.")
	end
	
	-- Reads control file --
	if (fs.exists(CONTROL_FILE)) then
		print(Pos)
		switches = loadSwitchDefinitionFromFile(CONTROL_FILE)
		--print("Loaded switch definition from file.")
		if switches ~= nil then
			checkFile()
			end
	else

	end
	
	if switches == nil then
		print("No Control data")
	end
	
	os.sleep(wait)
end