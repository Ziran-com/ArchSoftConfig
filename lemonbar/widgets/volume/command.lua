local handle = assert(io.popen("amixer sget Master | grep \'Right:\' | awk -F\'[][]\' \'{ print $2 }\' | cut -d % -f 1", "r"))
local volume = assert(handle:read('*a'))
handle:close()

handle = assert(io.popen("amixer sget Master | grep off", "r"))
local muted = assert(handle:read('*a'))
handle:close()

if muted ~= "" or isOff ~= nil then
	print('muted')
else
	if tonumber(volume) == 0 then
		print(' ' .. tonumber(volume) .. '%%')
	elseif tonumber(volume) <= 50 then
		print(' ' .. tonumber(volume) .. '%%')
	else
		print(' ' .. tonumber(volume) .. '%%')
	end
end

