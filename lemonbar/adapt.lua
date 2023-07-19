local config = require("config")
local handle = assert(io.popen("cat ~/.config/lemonbar/.top", "r"))
local top = tonumber(assert(handle:read('*a')))
handle:close()
handle = assert(io.popen("cat ~/.config/lemonbar/.isMax", "r"))
local isMax = tonumber(assert(handle:read('*a')))
handle:close()

if top == 0 then
	top = 5
	isMax = 1
else
	top = 0
	isMax = 0
end
os.execute("echo " .. top .. " > ~/.config/lemonbar/.top")
os.execute("echo " .. isMax .. " > ~/.config/lemonbar/.isMax")
os.execute("bspc config top_padding " .. config.height + config.outer_gap + top)
