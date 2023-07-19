local datetime = {
	name = "datetime",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046"
  	},
  	action = {
    		lclick = "kitty tty-clock -s -c -C 5 -D",
  	},
	action_num = 1,
  	command = "echo \" $(date \"+%H:%M\")\"",
  	len = 8,
  	interval = 1,
  	inner_gap = 1,
}

return datetime
