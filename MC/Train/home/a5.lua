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
local DATA_FOLDER = "/home/TrainData/"
local wait = 0.1
local Count1 = 0
local Count2 = 0
local TcpIP = "127.0.0.1"
local TcpSendPort = 1337
local TcpRecvPort = 1337
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
			handle:write("1") --.."\r\n"
			handle:write(data.."\r\n") --.."\r\n"
			print("Sent: "..it1)
			print("Sent iteration: "..Count1)
			Count1 = Count1 + 1
			end
		end
end

function TCPGET()
	handle:write("2")
	index = handle:read(10)
	if index == nil then
	print("fail")
	handle = internet.open(TcpIP,TcpSendPort)
	else
	length = tonumber(index)
	data = handle:read(length)
	if data == nil then
		print("failed to connect")
		handle = internet.open(TcpIP,TcpSendPort)
		else
		if data == "NoData" then
			print("No Data")
			else
				local decoded = json:decode(data)
				if decoded == nil then
				  print("NO DATA")
				  end
				e = serial.serialize(decoded)
				print("Control Data: Received")
				print("Received iteration: "..Count1)
				Count1 = Count1 + 1
				local Confile = io.open("ControlFile.lua","w")
				if Confile then	
					Confile:write(e)
					Confile:close()
					end
			end
		end
		end
end

-- Check File area for correct directory

if (fs.exists(DATA_FOLDER)) then
else
fs.makeDirectory(DATA_FOLDER)
end	
	
-- Main loop --

handle = internet.open(TcpIP,TcpSendPort)

while true do
--term.clear()
os.sleep(0.2)
print("---------------------------------------------------")
if method == "TCP" then
	TCPPOST()
	TCPGET()
	else
	HTTPGET()
	HTTPPOST()
	end
end

