local backlight = {
	name = "backlight",
  	color = {
    		foreground = "b7d5dc",
   	 	background = "3f4046"
  	},
  	action = {
    		lclick = "xbacklight -set 50",
    		scrollup = "xbacklight -inc 5",
    		scrolldown = "xbacklight -dec 5"
  	},
	action_num = 3,
  	command = "echo  $(xbacklight -get | cut -d . -f 1)%%",
  	len = 7,
  	interval = 0.1,
  	inner_gap = 1
}

return backlight
