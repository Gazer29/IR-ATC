--local inspect = require("inspect")
local component = require("component")
local internet = require("internet")
local serial = require("serialization")
local term = require ("term")
local json = require("json")
local http = require("http")
local fs = require("filesystem")
local thread = require("thread")
local gpu = component.gpu
local state = true
local getip = "http://127.0.0.1:8001/v1/train_get"
local postip = "http://127.0.0.1:8001/v1/train_post"
local wait = 0.1
local Count1 = 0
local Count2 = 0
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
function GET()
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


-- Check File area for correct directory

	
-- Main loop --
local getip = "http://127.0.0.1:8001/v1/train_get"
local handle = internet.request(getip)
while true do
--term.clear()

handle = internet.open("127.0.0.1", port)
data = handle:read()
print(data)


--print(handle.finishConnect())

--print("closed")

--GET()
--thread.create(GET)
--POST()
--s.sleep(0.1)	
--GET()
--os.sleep(0.2)

--thread.create(GET)
--os.sleep(wait)

end
handle.close()

  --if not component.isAvailable("internet") then
  --  error("no primary internet card found", 2)
  --end
