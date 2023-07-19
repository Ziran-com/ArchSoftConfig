local maxlen = 10
local functions = require("functions")

local handle = assert(io.popen("playerctl -s status", "r"))
local status = assert(handle:read('*a')):sub(1, -2)
handle:close()
if status == "" then
	print(" %{A:cd ~ && st cmus:}放点音乐 o.O?%{A}")
else
	handle = assert(io.popen("playerctl metadata --player=cmus --format '{{ mpris:length }}'", "r"))
	local length = assert(handle:read('*a'))
	handle:close()

  	--handle = assert(io.popen("playerctl --player=cmus position | cut -d '.' -f 1", "r"))
  	--local position = assert(handle:read('*a'))
  	--handle:close()

	if tonumber(length) == nil then
		print(" %{A:cd ~ && st cmus:}放点音乐 o.O?%{A}")
	else
  		--local percent = (tonumber(position) * 1000)/ tonumber(length)

  		local color = require("widgets.music.widget").color

  		local icon = ""
  		local action = ""
  		if status == "Playing" then
    			icon = " "
    			action = "pause"
  		else
    			icon = " "
    			action = "play"
  		end
  		local control = "%{F#" ..
      		color.control .. "}" .. "%{A:playerctl --player=cmus -s previous:} %{A}%{A:playerctl --player=cmus -s " .. action .. ":}" ..
      		icon .. "%{A}%{A:playerctl --player=cmus -s next:} %{A}%{F-}"
  		handle = assert(io.popen("playerctl --player=cmus metadata --format '{{ title }}'", "r"))
  		local title = assert(handle:read('*l'))
  		handle:close()
  		local content = ""
		local numLen = functions.stringWidthNum(title)
		local showLen = functions.stringWidthShow(title)
		local byteLen = functions.stringWidthByte(title)

		local multiple1 = 1
		local multiple2 = 2
		if numLen ~= byteLen then
			multiple1 = 3
			multiple2 = 1
		end

  		if showLen <= maxlen then
    			content = title .. (" "):rep(maxlen  - showLen)
  		else
    			content = title:sub(1, 3 * multiple2 * multiple1) .. "... "
  		end
  		print(" " .. content .. control)

	end
end
