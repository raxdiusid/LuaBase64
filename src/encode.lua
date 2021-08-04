
local util = require("src/util")
local sub = string.sub 

local pkg = {} 

function pkg:encode(str) 
	
	--[[
	Encoding / Converting str to Base64. 
	:param str: A type string to be converted.
	]]--
	
	local binary = "" 
	
	for i = 1, #str do 
		
		_8bit = util:to8bit(sub(str, i, i)) -- Convert char to 8 bit
		binary = binary..tostring(_8bit)
		
	end
	
	-- [[ Processing Base64 after got 8bit binary. ]] --
	
	local encoded = util:base64encode(binary, str) 
	
	return encoded 
	
end 

return pkg