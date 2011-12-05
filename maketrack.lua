local string = require 'string'
local format = string.format
local table = require 'table'
local sort = table.sort

return function(track, ps)
  for i=1, #ps do
    ps[i].track=track
    ps[i].id=format("%s%i",track,i)
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
