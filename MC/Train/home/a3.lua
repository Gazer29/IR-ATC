--local inspect = require("inspect")
local component = require("component")
local internet = require("internet")
local serial = require("serialization")
local term = require ("term")
local json = require("json")
local fs = require("filesystem")
local thread = require("thread")
local gpu = component.gpu
local state = true
local getip = "http://127.0.0.1:8001/v1/train_get"
local postip = "http://127.0.0.1:8001/v1/train_post"
local wait = 0.1
local Count1 = 0
local Count2 = 0
local TcpIP = "127.0.0.1"
local TcpSendPort = 1337
local TcpRecvPort = 1338
local method = "TCP" -- TCP or HTTP
posit_array = {}


local function cWrite( text, fgc, pIndex )
-- 5=green, 1=yellow, 
	local old_fgc, isPalette = gpu.getForeground()
	pIndex = ( type( pIndex ) == "boolean" ) and pIndex or false
	gpu.setForeground( fgc, pIndex )
	print( text )
	gpu.setForeground( old_fgc, isPalette )
end

-- Get control data from web server, decode data to table and place put in a Control File --
function HTTPGET()
	local handle = internet.request(getip)
	local result = ""
	if handle == nil then
		print("failed to connect")
		else
		local mt = getmetatable(handle)
		local code, message, headers = mt.__index.response()
		if code == 200 then
			l = json:encode(headers)
			n = "Code: "..(tostring(code))..", message: "..(tostring(message))..", headers: "..l
			local Confile = io.open("ErrorLog.lua","w")
			if Confile then	
				Confile:write(n)
				Confile:close()
				end
			for k, v in pairs(headers) do
				if k == "Keep-Alive" then
					for u, o in pairs(v) do
					if o == "timeout=60, max=199" then -- this is the only way I have determined that the chunk data is valid to handle, else program hangs --
						for chunk in handle do result = result .. chunk end
						print("Control Data: Received")
						print("Received iteration: "..Count2)

						Count2 = Count2 + 1
						else
						local Confile = io.open("Fail.lua","w")
						if Confile then	
							Confile:write(n)
							Confile:close()
							end
						
						end
						end
					end
					
				end
			local decoded = json:decode(result)
			e = serial.serialize(decoded)
			local Confile = io.open("ControlFile.lua","w")
			if Confile then	
				Confile:write(e)
				Confile:close()
				end
		end
	end
end

-- Read all Traindata files in directory into a table --
local function HTTPPOST()
	q = io.open("temp.lua","w")
	currTime = fs.lastModified("/home/temp.lua") -- This is done to compare other files, there is no other method to get the current timestamp in the same format.
	local prev = ""
	local it1 = 0
	local a = {}
	local b = {}
	for q in fs.list("/home/TrainData/") do
		diffTime = currTime - (fs.lastModified("/home/TrainData/"..q))
		if diffTime > 10000 then
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
	q:close()
	fs.remove("temp.lua")

	-- JSON encode the table into a string, send string to POST --
	if b == "" then
		local data = ""
		else
		data = json:encode(b)
		if data == "" then
			else
			internet.request(postip, data, {}, "POST")
			print("Sent: "..it1)
			print("Sent iteration: "..Count1)
			Count1 = Count1 + 1
			end
		end
end

local function TCPPOST()
while true do	
	os.sleep(0.5)
	q = io.open("temp.lua","w")
	currTime = fs.lastModified("/home/temp.lua") -- This is done to compare other files, there is no other method to get the current timestamp in the same format.
	local prev = ""
	local it1 = 0
	local a = {}
	local b = {}
	for q in fs.list("/home/TrainData/") do
		diffTime = currTime - (fs.lastModified("/home/TrainData/"..q))
		if diffTime > 10000 then
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
	q:close()
	fs.remove("temp.lua")

	-- JSON encode the table into a string, send string to POST --
	if b == "" then
		local data = ""
		else
		data = json:encode(b)
		if data == "" then
			else
			--handlePost = internet.open(TcpIP,TcpSendPort)
			handlePost:write(data.."\r\n")
			--handle:close()
			print("Sent: "..it1)
			print("Sent iteration: "..Count1)
			Count1 = Count1 + 1
			end
		end
end
end

function TCPGET()
while true do
	--local handleGet = internet.open(TcpIP,TcpRecvPort)
	data = handleGet:read()
	--handleGet:close()
	--print(data)
	if data == nil then
		print("failed to connect")
		os.sleep(0.1)
		handlePost:close()
		handleGet:close()
		else
			local decoded = json:decode(data)
			if decoded == nil then
			  print("NO DATA")
			  end
			e = serial.serialize(decoded)
			--print(data)
			print("Control Data: Received")
			print("Received iteration: "..Count1)
			Count1 = Count1 + 1
			local Confile = io.open("ControlFile.lua","w")
			if Confile then	
				Confile:write(e)
				--Confile:close()
				end
		end
	
end
end

-- Check File area for correct directory
local filearea = false
for q in fs.list("/home/") do
	if q == "TrainData/" then
		filearea = true
		break
		end
end
if filearea == false then
	fs.makeDirectory("/home/TrainData/")
	end
	
-- Main loop --

function test()
	while true do
	os.sleep(0.1)
	print("test")
	end
end
--thread.create(test)
		
function testA(send)
	if send then
		while true do
			os.sleep(0.1)
			handlePost:write(send)
			print(handlePost:read())
			end
	end
end	


handleGet = internet.open(TcpIP,TcpRecvPort)
handlePost = internet.open(TcpIP,TcpSendPort)

thread.create(TCPGET)
thread.create(TCPPOST)

while true do
--term.clear()
os.sleep(0.1)
print("---------------------------------------------------")
if method == "TCP" then
	--TCPGET()
	--TCPPOST()
	else
	HTTPGET()
	HTTPPOST()
	end


end

