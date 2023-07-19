local wifi = {
	name = "wifi",
 	color = {
    		foreground = "b7d5dc",
   	 	background = "3f4046"
  	},
  	action = {
    		lclick = "st nmtui"
  	},
	action_num = 1,
  	command = "lua ./widgets/wifi/command.lua",
  	len = 7,
  	interval = 10,
  	inner_gap = 1
}

return wifi
