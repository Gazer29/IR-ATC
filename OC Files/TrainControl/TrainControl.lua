--local inspect = require("inspect")
local component = require("component")
local serial = require("serialization")
local term = require ("term")
local gpu = component.gpu
local table = {}
local iteration = 0
local state = true
local UUID = ""

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
	print(UUID)
	end

function keep( filename, starting_line, num_lines )
    local fp = io.open( filename, "r" )
    if fp == nil then return nil end
 
    content = {}
    i = 1;
    for line in fp:lines() do
        if i >= starting_line and i <= starting_line + num_lines then
	    content[#content+1] = line
	end
	i = i + 1
    end
 
    --if i > starting_line and i < starting_line + num_lines then
	--print( "Warning: Tried to remove lines after EOF." )
    --end
 
    fp:close()
    fp = io.open( filename, "w" )
 
    for i = 1, #content do
	fp:write( string.format( "%s\n", content[i] ) )
    end
 
    fp:close()
end	
	
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
local wait = 2

if pcall(updateTable) then
	state = true
	else
	state = false
	print("pcall updateTable")
	end

local PosfileRead = io.open("pos"..UUID..".lua","r")

if PosfileRead then	
	prev = PosfileRead:read("*all")
	PosfileRead:close()
	local Posfile = io.open("pos"..UUID..".lua","w")
	if prev == nil then
		Posfile:write("int:"..iteration..",x:"..x..",y:"..y..",z:"..z..",\n")
		else
		Posfile:write("int:"..iteration..",x:"..x..",y:"..y..",z:"..z..",\n"..prev)	
		end
		
	Posfile:close()
	keep("pos"..UUID..".lua", 1, 20)
	if iteration == 0 then
		iteration = 1
		print("int1")
	else 
		iteration = 0
		print("int0")
	end
	else
	print("Couldn't open file")
	h = io.open("pos"..UUID..".lua","w")
	h:close()
	end
	
local Confile = io.open("con"..UUID..".lua","r")
if Confile then
	local text=Confile:read("*a")
	Confile:close()
	wait = tonumber(string.match(text,"wait=([+-]?%d*%.?%d+)"))
	throttle = tonumber(string.match(text,"throttle=([+-]?%d*%.?%d+)"))
	brake = tonumber(string.match(text,"brake=([+-]?%d*%.?%d+)"))
	horn = tonumber(string.match(text,"horn=([+-]?%d*%.?%d+)"))
	name = (string.match(text,"name=(%P+)"))
	mode = (string.match(text,"mode=(%P+)"))
	dest = (string.match(text,"dest=(%P+)"))
	
	term.clear()
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
	
	else
	cWrite( "No Control", 1,true )
	end
os.sleep(wait)
end
end