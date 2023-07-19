local volume = {
	name = "volume",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046"
  	},
  	action = {
    		lclick = "amixer set Master toggle -q",
    		scrollup = "amixer set Master 5%+ -q",
    		scrolldown = "amixer set Master 5%- -q"
  	},
  	action_num = 3,
  	command = "lua ./widgets/volume/command.lua",
  	len = 7,
  	interval = 0.1,
  	inner_gap = 1,
}

return volume
