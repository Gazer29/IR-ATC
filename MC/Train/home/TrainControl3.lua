--local inspect = require("inspect")
local component = require("component")
local serial = require("serialization")
local term = require ("term")
local json = require("json")
local fs = require("filesystem")
local gpu = component.gpu
local iteration = 0
local state = true
local UUID = ""
local tablelength = 15
local maxarray = 15
local posit_array = {}
local DATA_FOLDER = "/home/TrainData/"

function setThrottle(x)
  if x == -2 then
    else
    component.ir_remote_control.setThrottle(x)
    end
end

function setBrake(x)
  if x == -2 then
    else
    component.ir_remote_control.setBrake(x)
    end
end

function setHorn(x)
   if x == 1 then
    component.ir_remote_control.horn()
  end
end

local function cWrite( text, fgc, pIndex )
-- 5=green, 1=yellow, 
	local old_fgc, isPalette = gpu.getForeground()
	pIndex = ( type( pIndex ) == "boolean" ) and pIndex or false
	gpu.setForeground( fgc, pIndex )
	print( text )
	gpu.setForeground( old_fgc, isPalette )
end

function foo()
	local q = component.ir_remote_control.getLinkUUID()
	--print(q)
	end
	
function updateTable()
	UUID = component.ir_remote_control.getLinkUUID()
	x, y, z = component.ir_remote_control.getPos()
	x = math.floor(x * 1000)/1000
	y = math.floor(y * 1000)/1000
	z = math.floor(z * 1000)/1000
	--print(UUID)
	end

-- Checks for folder, creates if not --	
if fs.exists(DATA_FOLDER) then
	fs.makeDirectory(DATA_FOLDER)
	end

	
-- Main loop --	
	
while true do

if pcall(foo) then
	--print("no error")
	state = true
	else
	--print("Chunk not loaded")
	cWrite( "Chunk not loaded", 2,true )
	os.sleep(5)
	state = false
	end
	
while state do

local throttle = -2
local brake = -2
local horn = -2
local wait = 0.5

if pcall(updateTable) then
	state = true
	else
	state = false
	print("pcall updateTable")
	end

if pcall(foo) then
	--print("no error")
	state = true
	else
	--print("Chunk not loaded")
	state = false
	end
	
-- Adds position to array start, removes over max --
c = {["x"] = x, ["y"] = y, ["z"] = z}
table.insert(posit_array, 1, c)
i1 = true
while i1 do
	if #posit_array > maxarray then
		table.remove(posit_array, (maxarray+1))
	else
	i1 = false
	end
end
--print("size:", #posit_array)

-- Adds all parts to table, serialses and writes to file --
a = {}
a["uuid"] = UUID
a["int"] = iteration
a["posit_array"] = posit_array
b = serial.serialize(a)
local Posfile = io.open("TrainData/".."pos"..UUID..".lua","w")
if Posfile then	
	Posfile:write(b)
	Posfile:close()
	if iteration == 0 then
		iteration = 1
	else 
		iteration = 0
	end
	else
	print("Couldn't open file")
	end
	
-- Reads Control file, runs each component --
local Confile = io.open("ControlFile.lua","r")
if Confile then
	local text=Confile:read("*a")
	Confile:close()
	decoded = serial.unserialize(text)	
	if decoded ~= nil then
		for k, v in pairs(decoded) do
			--print(tostring(k)..": "..tostring(v))
			for f, g in pairs(v) do
				if g == UUID then
					print("Control ON")
					name = v["5"]
					mode = v["6"]
					dest = v["7"]
					throttle = v["1"]
					brake = v["2"]
					horn = v["3"]
					wait = v["4"]
					end
				end
			end
		end
	print(UUID)
	if name then
		print("Name:    ", name)
	else
		print("Name: ")
	end
	if mode then
		print("Mode:    ", mode)
	end
	if dest then
		print("Destination: ", dest)
	end
	
	if throttle then
		if pcall(setThrottle, throttle) then
			state = true
			print("throttle set: ", throttle)
			else
			state = false
			print("pcall throttle")
			end
	else
		print("throttle failed")
	end
	
	if brake then
		if pcall(setBrake, brake) then
			state = true
			print("brake set: ", brake)
			else
			state = false
			print("pcall brake")
			end	
	end
	
	if horn then
		if pcall(setHorn, horn) then
			state = true
			print("horn set: ", horn)
			else
			state = false
			print("pcall horn")
			end	
	end
	
	if wait then
		print("wait set: ", wait)
	end
	print("iteration: "..iteration)

	else
	cWrite( "No Control", 1,true )
	end
if wait == nil or 0 then
	os.sleep(0.5)
	else
	os.sleep(wait)
	end
term.clear()
end
end