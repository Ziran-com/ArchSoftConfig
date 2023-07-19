local memory = {
	name = "memory",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046"
  	},
  	action = {
    		lclick = "st htop",
  	},
	action_num = 1,
  	command = "echo  $(free -h --mega | awk '/^Mem:/ {print $3 \"/\" $2}')",
  	len = 11,
  	interval = 1,
  	inner_gap = 1,
}

return memory
