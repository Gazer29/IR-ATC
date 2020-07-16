--local inspect = require("inspect")
local component = require("component")
local internet = require("internet")
local serial = require("serialization")
local term = require ("term")
local json = require("json")
local gpu = component.gpu
local iteration = 0
local state = true
local UUID = ""
local tablelength = 20
local getip = "http://127.0.0.1:8001/v1/train_get?uuid="
local postip = "http://127.0.0.1:8001/v1/train_post"
local maxarray = 20


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

function GET()
	local handle = internet.request(getip..UUID)
	local result = ""
	for chunk in handle do result = result..chunk end
	--print(result)
	local decoded = json:decode(result)
	for k, v in pairs(decoded) do
		--print(tostring(k)..": "..tostring(v))
		end
	name = decoded.name
	mode = decoded.mode
	dest = decoded.dest
	throttle = decoded.throttle
	brake = decoded.brake
	horn = decoded.horn
	wait = decoded.wait
	print(wait)
end

posit_array = {}

	
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

throttle = -2
brake = -2
horn = -2
wait = 2

if pcall(updateTable) then
	else
	state = false
	print("pcall updateTable")
	end

if pcall(foo) then
	--print("no error")
	else
	--print("Chunk not loaded")
	state = false
	end


c = {["x"] = x, ["y"] = y, ["z"] = z}
table.insert(posit_array, 1, c)
i1 = true
while i1 do
	if #posit_array > maxarray then
		table.remove(posit_array, 11)
	else
	i1 = false
	end
end
--print("size:", #posit_array)

a = {}
a["uuid"] = UUID
a["int"] = iteration
a["posit_array"] = posit_array

b = json:encode(a)

internet.request(postip, b, {}, "POST")

if iteration == 0 then
	iteration = 1
	else 
	iteration = 0
	end
	
if pcall(GET) then
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
			print("brake set: ", brake)
			else
			state = false
			print("pcall brake")
			end	
		end	
	if horn then
		if pcall(setHorn, horn) then
			print("horn set: ", horn)
			else
			state = false
			print("pcall horn")
			end	
		end	
	if wait then
		print("wait set: ", wait)
		end
	print("iteration:", iteration)		
	else
	cWrite( "No Control", 1,true )
	end
os.sleep(wait)

end
end