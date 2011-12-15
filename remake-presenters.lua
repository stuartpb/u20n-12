local ps = require "presenters"
local homepages = require "homepages"

local outfile = io.open('new-presenters.lua','w')

local function write(...)
  io.stdout:write(...)
  outfile:write(...)
end

local function writef(...)
  return write(string.format(...))
end

local names = {}
for name, data in pairs(ps) do
  names[#names+1]=name
  if data.org and string.find(data.org,"%S") then
    data.homepage = homepages[data.org]
  end
end

table.sort(names,function(m,n) return ps[m].last < ps[n].last end)

local fields = {
  "prefix",
  "first",
  "middle",
  "last",
  "suffix",
  "org",
  "homepage",
  "email",
  "headshot",
}

write'return {\n\n'
for i=1, #names do
  local name = names[i]
  local p = ps[name]
  writef("  [%q] = {\n",name)
  for j=1, #fields do
    local field = fields[j]
    if p[field] then
      writef("    %s = %q,\n",field,p[field])
    end
  end
  if p.bio then
    write("    bio = [==[\n")
    write(p.bio)
    write("]==],\n")
  end
  write'  },\n'
  write"\n"
end
write'}\n'

