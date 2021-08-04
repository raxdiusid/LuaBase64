
--[[
A 8 bits sequence for ASCII.
]]--  

function to8bit(ascii_list, decimal, _8bit_list) 
	
	--[[
	:param ascii_list: Array of ascii.
	:param decimal: their starting decimal code. (Defined in ascii table)
	:param _8bit_list: list to be inserted.
	]]-- 
	
	for i, v in pairs(ascii_list) do 
	
		temp = decimal 
		local _8bit_binary = ""
	
		while temp >= 1 do 
		
			local per_binary = temp % 2
			_8bit_binary = _8bit_binary..tostring(per_binary)
		
			temp = math.floor(temp / 2)
		
		end 
		
		decimal = decimal + 1
		
		--_8bit_list[tostring(v)] = "0"..string.reverse(_8bit_binary)
		local pushz = ""
		while (#_8bit_binary + #pushz) <= 7 do 
			_8bit_binary = _8bit_binary.."0"
		end 
		_8bit_list[v] = pushz..string.reverse(_8bit_binary)
	
	end 
end

function ascii_add(ascii_sequence, ascii_base) 
	-- just a helper function.
	for _, v in pairs(ascii_sequence) do 
		for __, value in pairs(v) do 
			table.insert(ascii_base, value)
		end 
	end 
end 

local bit = {}
local _8bit = {} 

local sub, format = string.sub, string.format 

local ascii = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 
	'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
	'U', 'V', 'W', 'X', 'Y', 'Z'} 
local ascii_lowercase = {} 
local number = {}
for j = 0, 9 do table.insert(number, tostring(j)) end 
for _, v in pairs(ascii) do table.insert(ascii_lowercase, v:lower()) end

ascii_add({ascii_lowercase, number}, ascii)

local decimal = {65, 97, 48} 

for i, table in pairs({ascii, ascii_lowercase, number}) do 
	to8bit(table, decimal[i], _8bit)
end 

bit["_8bit"] = _8bit 
bit["ascii"] = ascii -- or Base64 Table.

return bit 