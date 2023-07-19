local handle = assert(io.popen("xdotool getmouselocation | cut -d ' ' -f 1 | cut -c 3-", "r"))
local mouse_x = assert(handle:read('*a'))
handle:close()
handle = assert(io.popen("cat ~/.config/lemonbar/widgets/workspace/.x", "r"))
local x = assert(handle:read('*a'))
handle:close()
handle = assert(io.popen("cat ~/.config/lemonbar/widgets/workspace/.width", "r"))
local width = assert(handle:read('*a'))
handle:close()

local clicked = mouse_x - x
if clicked > 10 and clicked <= 41 then
	print(0)
elseif clicked > 41 and clicked <= 65 then
	print(1)
elseif clicked > 65 and clicked <= 90 then
	print(2)
elseif clicked > 90 and clicked <= 115 then
	print(3)
elseif clicked > 115 and clicked <= 137 then
	print(4)
elseif clicked > 137 and clicked <= 161 then
	print(5)
elseif clicked > 161 and clicked <= 184 then
	print(6)
elseif clicked > 184 and clicked <= 209 then
	print(7)
elseif clicked > 209 and clicked <= 235 then
	print(8)
elseif clicked > 235 and clicked <= 272 then
	print(9)
end
