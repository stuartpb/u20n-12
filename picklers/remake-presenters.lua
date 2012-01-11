local ps = require "presenters"

local outfile = io.open('presenters.lua','w')

local function write(...)
  --io.stdout:write(...)
  outfile:write(...)
end

local function writef(...)
  return write(string.format(...))
end

local names = {}
for name, data in pairs(ps) do
  names[#names+1]=name
end

table.sort(names,function(m,n)
  local mlast = ps[m].last
  local nlast = ps[n].last
  if mlast == nlast then return m < n
  else return mlast < nlast end end)

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

write'--encoding: utf-8\nreturn {\n\n'
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

