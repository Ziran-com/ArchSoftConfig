local functions = {}
function functions.stringWidthByte(inputstr)
    	-- 计算字符串字符宽度
	
	local lenInByte = #inputstr
   	local width = 0
   	local i = 1
   	while (i<=lenInByte) do
        	local curByte = string.byte(inputstr, i)
        	local byteCount = 1;
        	if curByte>0 and curByte<=127 then
            		byteCount = 1                               --1字节字符
        	elseif curByte>=192 and curByte<223 then
            		byteCount = 2                               --双字节字符
        	elseif curByte>=224 and curByte<239 then
            		byteCount = 3                               --汉字
        	elseif curByte>=240 and curByte<=247 then
            		byteCount = 4                               --4字节字符
        	end

        	local char = string.sub(inputstr, i, i+byteCount-1)                                             
        	i = i + byteCount                                 -- 重置下一字节的索引
        	width = width + byteCount                                 -- 字符的个数（长度）
    	end
    	return width
end

function functions.stringWidthShow(inputstr)
    	-- 计算字符串显示宽度
	
	local lenInByte = #inputstr
   	local width = 0
   	local i = 1
   	while (i<=lenInByte) do
        	local curByte = string.byte(inputstr, i)
        	local byteCount = 1;
        	if curByte>0 and curByte<=127 then
            		byteCount = 1                               --1字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	elseif curByte>=192 and curByte<223 then
            		byteCount = 2                               --双字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	elseif curByte>=224 and curByte<239 then
            		byteCount = 3                               --汉字
        		width = width + 2		            -- 字符的个数（长度）
        	elseif curByte>=240 and curByte<=247 then
            		byteCount = 4                               --4字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	end

        	local char = string.sub(inputstr, i, i+byteCount-1)                                             
        	i = i + byteCount                                 -- 重置下一字节的索引
    	end
    	return width
end

function functions.stringWidthNum(inputstr)
    	-- 计算字符串显示宽度
	
	local lenInByte = #inputstr
   	local width = 0
   	local i = 1
   	while (i<=lenInByte) do
        	local curByte = string.byte(inputstr, i)
        	local byteCount = 1;
        	if curByte>0 and curByte<=127 then
            		byteCount = 1                               --1字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	elseif curByte>=192 and curByte<223 then
            		byteCount = 2                               --双字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	elseif curByte>=224 and curByte<239 then
            		byteCount = 3                               --汉字
        		width = width + 1		            -- 字符的个数（长度）
        	elseif curByte>=240 and curByte<=247 then
            		byteCount = 4                               --4字节字符
        		width = width + 1                           -- 字符的个数（长度）
        	end

        	local char = string.sub(inputstr, i, i+byteCount-1)                                             
        	i = i + byteCount                                 -- 重置下一字节的索引
    	end
    	return width
end

return functions
