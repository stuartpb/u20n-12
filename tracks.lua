local names = {"oe","wrov","srov","muv","edu","div","si","wrex"}
local all = {}

local tracks = {
  names = names,
  all = all,
  titles = {
    div = "Commercial Diving",
    edu = "Education and Academia",
    muv = "Manned Underwater Vehicles",
    oe = "Ocean Engineering",
    si = "Sensors and Instruments",
    srov = "Small ROVs",
    wrex = "Shipwrecks",
    wrov = "Work-Class ROVs",
  },
}

for i=1, #names do
  local name = names[i]
  local track = require("tracks."..name)
  for j=1, #track do
    all[#all+1]=track[j]
  end
  tracks[name] = track
end

table.sort(tracks.all,function(m,n)
  local mstart,nstart = os.time(m.start), os.time(n.start)

  if mstart == nstart then
    return m.room < n.room
  else
    return mstart < nstart
  end
end)

return tracks
