local string = require 'string'
local format = string.format
local gsub = string.gsub
local lower = string.lower
local table = require 'table'
local sort = table.sort

local idset = {}

return function(track, ps)
  for i=1, #ps do
    ps[i].track = track
    local id = ps[i].title
    id = gsub(id,"%u",lower)
    id = gsub(id,"&","and")
    id = gsub(id,"[ /]","-")
    id = gsub(id,"%-+","-")
    id = gsub(id,"[^%w%-]","")
    if idset[id] then
      error("redundant id: "..id)
    else
      idset[id] = true
    end
    ps[i].id = id
  end

  sort(ps,function(m,n)
    local mstart,nstart = os.time(m.start), os.time(n.start)

    if mstart == nstart then
      return m.room < n.room
    else
      return mstart < nstart
    end
  end)

  return ps
end
