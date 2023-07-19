local handle = assert(io.popen("xdotool get_num_desktops", "r"))
local num = assert(handle:read('*a'))
handle:close()

local workspace = {
	name = "workspace",
	color = {
		foreground = "585762",	
		background = "3f4046",
		focus = "b7d5dc",
		occupied = "7b89ac"
	},
	action = {
		lclick = "xdotool set_desktop $(lua ./widgets/workspace/switch.lua)",
		rclick = "xdotool set_desktop_for_window $(xdotool getwindowfocus) $(lua ./widgets/workspace/switch.lua)$"
	},
	action_num = 2,
	command = "lua ./widgets/workspace/command.lua",
	len = num + (num + 1) * 1,
	interval = 0.1,
	inner_gap = 1
}

return workspace
