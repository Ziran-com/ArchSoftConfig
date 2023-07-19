local config = require("config")
local x = config.outer_gap

local handle = assert(io.popen("cat ~/.config/lemonbar/.isMax", "r"))
local isMax = tonumber(assert(handle:read('*a')))
handle:close()
if isMax == 0 then
	os.execute("bspc config top_padding " .. config.height + config.outer_gap)
else
	os.execute("bspc config top_padding " .. config.height + config.outer_gap + 5)
end

local function font(names, size)
	local output = ""
  	for font in names:gmatch("([^,]+)") do
    		output = output .. " -f \"" .. font .. "\"-" .. size
  	end
	return output
end

local function actions(action)
	if action == nil then
		return ""
	end

	local output = ""

	if action.lclick ~= nil then
		output = output .. "%{A:" .. action.lclick .. ":}"
	end
	if action.mclick ~= nil then
		output = output .. "%{A2:" .. action.mclick .. ":}"
	end
	if action.rclick ~= nil then
		output = output .. "%{A3:" .. action.rclick .. ":}"
	end
	if action.scrollup ~= nil then
		output = output .. "%{A4:" .. action.scrollup .. ":}"
	end
	if action.scrolldown ~= nil then
		output = output .. "%{A5:" .. action.scrolldown .. ":}"
	end

	return output
end

local function run(widget)
	width = (widget.inner_gap + widget.len) * config.font_size * 0.82
	os.execute("echo " .. x .. " > ~/.config/lemonbar/widgets/" .. widget.name .. "/.x")
   	os.execute("echo " .. math.floor(width) .. " > ~/.config/lemonbar/widgets/" .. widget.name .. "/.width")
	os.execute(
		"while true; do echo \"" ..
		actions(widget.action) ..
		" " ..
		"$(" .. widget.command .. ")" ..
		("%{A}"):rep(widget.action_num) ..
		"\" ; sleep " ..
		widget.interval .. "; done | " ..
		config.lemonbar ..
		font(config.font, config.font_size) ..
		" -F \"#" .. widget.color.foreground .. "\"" ..
		" -B \"#" .. widget.color.background .. "\"" ..
		" -g " ..
		("%d"):format(math.floor(width)) .. "x" .. config.height ..
		"+" .. ("%d"):format(x) .. "+" .. config.outer_gap .. " &"
	)
	x = x + math.floor(width) + config.outer_gap
end

local workspace = require("widgets.workspace.widget")
run(workspace)

local windowname = require("widgets.windowname.widget")
run(windowname)

local memory = require("widgets.memory.widget")
run(memory)

local wifi = require("widgets.wifi.widget")
run(wifi)

local backlight = require("widgets.backlight.widget")
run(backlight)

local volume = require("widgets.volume.widget")
run(volume)

local music = require("widgets.music.widget")
run(music)

local rhythm = require("widgets.rhythm.widget")
run(rhythm)

local datetime = require("widgets.datetime.widget")
run(datetime)

local battery = require("widgets.battery.widget")
run(battery)
