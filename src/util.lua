local bit = require("src/bit")
local sub = string.sub 
local util = {} 

function util:to8bit(str) 
	return bit._8bit[str]
end 

function util:to6bit(octet)
	return sub(octet, 1, 6)
end

function util:base64encode(binary, ascii)
	
	local encoded_base64 = "" 
	
	for sextet = 1, #binary, 6 do 
		
		local _6bit = sub(binary, sextet, sextet+5) 
		
		if #_6bit < 6 then 
			--[[ If _6bit are not actually 6 bit we'll push zero to right. ]]--
			
			for j = 1, 6 - #_6bit do 
				_6bit = _6bit.."0"
			end 
		end 
		
		encoded_base64 = encoded_base64..bit.ascii[tonumber(_6bit, 2)+1]
		
	end 
	
	if #ascii % 3 == 0 then return encoded_base64 end 
	
	--[[
	There's some cases when input length is not multiply of 3.
	So, we'll add the remaining octet with padding '='
	]]--
	
	encoded_base64 = #ascii % 3 == 1 and encoded_base64.."==" or encoded_base64.."="
	
	return encoded_base64
	
end 

return util