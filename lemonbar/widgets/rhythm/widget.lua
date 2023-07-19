os.execute("killall cava")
os.execute("rm -rf /tmp/cava.fifo && cava -p ~/.config/lemonbar/widgets/rhythm/cava.conf &")

local rhythm = {
	name = "rhythm",
	color = {
		foreground = "b7d5dc",
    		background = "3f4046"
  	},
	action_num = 0,
  	command = "lua ./widgets/rhythm/command.lua",
  	len = 20,
  	interval = 0,
  	inner_gap = 1
}

return rhythm
