# Base64 
Base64 implementation in Lua. <br />
More docs about Base64 here:
> https://datatracker.ietf.org/doc/html/rfc3548.html#ref-4

# Installation
```
- git https://github.com/uClaster/LuaBase64.git
- locate the modules. 
```

# Example usage 

```lua 
local base64 = require("path-to-encode.lua") 
print(base64:encode("Helloworld")) -- SGVsbG93b3JsZA==
```