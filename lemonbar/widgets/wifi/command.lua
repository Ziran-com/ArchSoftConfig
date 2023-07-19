local handle = assert(io.popen("nmcli n c", "r"))
local status = assert(handle:read('*l'))
handle:close()

if status == "full" then
	print(" " .. status)
elseif status == "limited" then
	print(" " .. "limi")
elseif status == "portal" then
	print(" " .. "port")
elseif status == "none" then
	print(" " .. status)
elseif status == "unknown" then
	print(" " .. "unkn")
end
