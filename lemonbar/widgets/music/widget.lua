local music = {
	name = "music",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046",
    		control = "b7d5dc",
    		bar = "585762"
  	},
  	action = {
    		scrollup = "playerctl position 5+",
    		scrolldown = "playerctl position 5-"
  	},
	action_num = 2,
  	command = "lua ./widgets/music/command.lua",
  	len = 20.2,
  	interval = 0.1,
  	inner_gap = 0
}

return music
