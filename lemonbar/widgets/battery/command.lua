local handle = assert(io.popen("cat \"/sys/class/power_supply/BAT0/status\"", "r"))
local mode = assert(handle:read('*a'))
handle:close()

handle = assert(io.popen("cat \"/sys/class/power_supply/BAT0/capacity\"", "r"))
local percent = assert(handle:read('*a'))
handle:close()

local symbol = ""

if mode == "Discharging" then
	symbol=''
elseif mode == "Charging" then
    	symbol=''
else
    	symbol=''
end

print(symbol .. "" .. string.gsub(percent, "\n", "") .. "%%")

