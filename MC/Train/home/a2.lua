--local inspect = require("inspect")
local component = require("component")
local internet = require("internet")
local serial = require("serialization")
local term = require ("term")
local json = require("json")
local fs = require("filesystem")
local gpu = component.gpu
local iteration = 0
local state = true
local UUID = ""
local tablelength = 20
local getip = "http://127.0.0.1:8001/v1/train_get?uuid="
local postip = "http://127.0.0.1:8001/v1/train_post"
local maxarray = 20
local wait = 0.5

local function cWrite( text, fgc, pIndex )
-- 5=green, 1=yellow, 
	local old_fgc, isPalette = gpu.getForeground()
	pIndex = ( type( pIndex ) == "boolean" ) and pIndex or false
	gpu.setForeground( fgc, pIndex )
	print( text )
	gpu.setForeground( old_fgc, isPalette )
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


while state do

local filearea = false
for q in fs.list("/home/") do
	if q == "TrainData/" then
		filearea = true
		break
		end
end
print(tostring(filearea))

if filearea == false then
	fs.makeDirectory("/home/TrainData/")
	end

local data = ""
local prev = ""
local it1 = 0
for q in fs.list("/home/TrainData/") do
	local PosfileRead = fs.open("/home/TrainData/"..q,"r")
	if PosfileRead then	
		prev = PosfileRead:read(10000)
		if prev ~= nil then
			it1 = it1 + 1
			if data == "" then
				data = "["..prev
			else
				data = data ..",".. prev
			end
		PosfileRead:close()
		end
		end
	end
	
data = data.."]"
print(it1)

--b = json:encode(a)

internet.request(postip, data, {}, "POST")

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
