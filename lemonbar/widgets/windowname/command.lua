local config = require("config")

local handle = assert(io.popen("echo $(xdotool getwindowfocus | xargs xdotool getwindowname | sd 'qutebrowser' 'qutebrowser' | cut -c 1-21) ...", "r"))
local command = assert(handle:read('*a'))
handle:close()

local handle = assert(io.popen("cat ~/.config/lemonbar/.isMax", "r"))
local isMax = assert(handle:read('*a'))
handle:close()

if isMax == 0 then
	command = "%{A:bspc config bottom_padding " .. config.height + config.outer_gap .. " && trayer --edge bottom --distancefrom bottom --distance -5 --widthtype pixel --width 1910 --heighttype pixel --height 40 --transparent 1 --tint 0xFF3f4046 --alpha 20 &:}%{A3:bspc config bottom_padding 0 && killall trayer:} %{A}%{A}" .. command
else
	command = "%{A:bspc config bottom_padding " .. config.height + config.outer_gap + 5 .. " && trayer --edge bottom --distancefrom bottom --distance -5 --widthtype pixel --width 1910 --heighttype pixel --height 40 --transparent 1 --tint 0xFF3f4046 --alpha 20 &:}%{A3:bspc config bottom_padding 0 && killall trayer:} %{A}%{A}" .. command
end

print(command)
