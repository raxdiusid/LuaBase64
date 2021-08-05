
--[[
A 8 bits sequence for ASCII.
]]--  

function to8bit(chr, _8bit_list) 
	
	--[[
	:param chr: string
	:param _8bit_list: list to be inserted.
	]]-- 
	
	
		decimal_code = string.byte(chr)
		local _8bit_binary = ""
	
		while decimal_code >= 1 do 
		
			local per_binary = decimal_code % 2
			_8bit_binary = _8bit_binary..tostring(per_binary)
		
			decimal_code = math.floor(decimal_code / 2) 
		
		end 
		
		local pushz = ""
		while (#_8bit_binary + #pushz) <= 7 do 
			_8bit_binary = _8bit_binary.."0"
		end 
		_8bit_list[chr] = pushz..string.reverse(_8bit_binary)
	
	end 

local bit = {} -- A table that contain this module.

local _8bit = {} -- 8 bit ascii.
local sub, format = string.sub, string.format 

local ascii = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 
	'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
	'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
	's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
	'4', '5', '6', '7', '8', '9'
} 

for i, chr in pairs(ascii) do 
	to8bit(chr, _8bit)
end 

bit["_8bit"] = _8bit 
bit["ascii"] = ascii -- or Base64 Table.

return bit 