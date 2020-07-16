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
local getip = "http://127.0.0.1:8001/v1/train_get"
local postip = "http://127.0.0.1:8001/v1/train_post"
local maxarray = 20
local wait = 0.1

local function cWrite( text, fgc, pIndex )
-- 5=green, 1=yellow, 
	local old_fgc, isPalette = gpu.getForeground()
	pIndex = ( type( pIndex ) == "boolean" ) and pIndex or false
	gpu.setForeground( fgc, pIndex )
	print( text )
	gpu.setForeground( old_fgc, isPalette )
end


function GET()
	print("start")
	local handle = internet.request(getip)
	local result = ""
	print(handle)
	print("end")
	local it2 = 0
	if handle ~= nil then
		for chunk in handle do 
			result = result..chunk 
			it2 = it2 + 1
			print(it2)
			end
			
		--print(result)
		--for k, v in pairs(result) do
			--print(tostring(k)..": "..tostring(v))
			--end
		print("decoding")
		local decoded = json:decode(result)
		--print(decoded)
		e = serial.serialize(decoded)
	
		local Confile = io.open("ControlFile.lua","w")
		if Confile then	
			Confile:write(e)
			Confile:close()
			end
	end
end
print("end get")

posit_array = {}

	
while true do


while state do
--term.clear()

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
local a = {}
local b = {}

io.open("temp.lua","w")
currTime = fs.lastModified("/home/temp.lua")

for q in fs.list("/home/TrainData/") do
	diffTime = currTime - (fs.lastModified("/home/TrainData/"..q)) 
	if diffTime > 60 then
		fs.remove("/home/TrainData/"..q)
		else
		local PosfileRead = fs.open("/home/TrainData/"..q,"r")
		if PosfileRead then	
			prev = PosfileRead:read(10000)
			PosfileRead:close()
			if prev == nil then
			else
				a = serial.unserialize(prev)
				table.insert(b,1,a)	
				it1 = it1 + 1
			end
			end
		end
	end
--print(b)
print("end read")
data = json:encode(b)
print("Sent: "..it1)
--print(data)

--b = json:encode(a)
if it1 > 0 then
	os.sleep(0.1)
	internet.request(postip, data, {}, "POST")
	os.sleep(0.1)
	else
	os.sleep(0.5)
	end

if iteration == 0 then
	iteration = 1
	else 
	iteration = 0
	end
	
GET()	
--if pcall(GET) then
--	term.clear()
	--else
	--cWrite( "No Control", 1,true )
	--end
--print("wait: "..wait)
--os.sleep(wait)
end
end
