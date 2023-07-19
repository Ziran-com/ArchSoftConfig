local windowname = {
	name = "windowname",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046"
  	},
	action_num = 0,
	command = "lua ./widgets/windowname/command.lua",
  	--command = "echo $(xdotool getwindowfocus | xargs xdotool getwindowname | sd 'qutebrowser' 'qutebrowser' | cut -c 1-23 ) ...",
  	len = 26.3,
  	interval = 0.1,
  	inner_gap = 1
}

return windowname
