local base64 = require("src/encode") 

local myString = "Helloworld"

local encoded = base64:encode(myString) 

print(encoded)