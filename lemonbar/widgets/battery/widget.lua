local battery = {
	name = "battery",
  	color = {
    		foreground = "b7d5dc",
    		background = "3f4046"
  	},
  	action = {
    		lclick = "powerprofilesctl set power-saver && dunstify -h string\\:x-dunst-stack-tag\\:power-mode 省电模式",
    		rclick = "powerprofilesctl set balanced && dunstify -h string\\:x-dunst-stack-tag\\:power-mode 平衡模式",
    		--rclick = "powerprofilesctl set performance && dunstify -h string\\:x-dunst-stack-tag\\:power-mode 性能模式"
  	},
	action_num = 2,
  	command = "lua ./widgets/battery/command.lua",
  	len = 6,
  	interval = 10,
  	inner_gap = 1
}

return battery
