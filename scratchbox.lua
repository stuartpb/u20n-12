local tracks = require "tracks"
print(#tracks.all)

local function startswith(str,start)
  return string.sub(str,1,#start) == start
end

print(startswith("http://duh.com","http://"))
