local tracks = require "tracks"

local outfile = io.open('presentations.lua','w')

local function write(...)
  --io.stdout:write(...)
  outfile:write(...)
end

local function writef(...)
  return write(string.format(...))
end

write[==[
local string = require 'string'
local format = string.format
local gsub = string.gsub
local lower = string.lower
local table = require 'table'
local sort = table.sort
local os = require 'os'
local time = os.time

local idset = {}

local function pressort(m,n)
  local mstart,nstart = time(m.start), time(n.start)

  if mstart == nstart then
    return m.room < n.room
  else
    return mstart < nstart
  end
end

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
  chairs = {
    div = "Steve Struble",
    edu = "Jill Zande",
    muv = "Will Kohnen",
    oe = "Steve Barrow",
    si = "Mike Chapman",
    srov = "Rachael Miller",
    wrex = "Rachael Miller",
    wrov = "Steve Barrow",
  },
}

local function maketrack(track, ps)
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
    all[#all+1] = ps[i]
  end

  sort(ps,pressort)

  tracks[track] = ps
end
]==]

for ni=1,#tracks.names do
  local tn = tracks.names[ni]
  local track = tracks[tn]

  writef('maketrack(%q, { --%s\n\n',tn,tracks.titles[tn])
  for pi=1, #track do
    local p = track[pi]
    write("  {\n")
    writef("    title = %q,\n",p.title)
    if p.fulltitle then writef("    fulltitle = %q,\n",p.fulltitle) end
    local psts = p.presenters
    if not p.presenters then
      psts = {p.lead}
      p.presenters = psts
      if p.cos then
        -- p.leads = 1 --don't add implicit lead counts
        for i=1, #p.cos do
          psts[i+1]=p.cos[i]
        end
      end
    end
    write("    presenters = { ")
    for i=1, #psts do
      writef("%q, ",psts[i])
    end
    write"},\n"

    if p.leads then
      writef("    leads = %i,\n",p.leads)
    end

    if p.abstract then
      write("    abstract = [==[\n")
      write(p.abstract)
      write("]==],\n")
    end

    if p.image then writef("    image = %q,\n",p.image) end
    if p.materials then write("    materials = true,\n")
      else write("    materials = false,\n") end

    writef("    start = { day = %i, month = %i, year = %i,\n",
      p.start.day, p.start.month, p.start.year)
    writef("      hour = %02i, min = %02i },\n",
      p.start.hour, p.start.min)
    writef("    length = %i,\n",p.length)
    writef("    room = %q,\n",p.room)

    write'  },\n'
    write"\n"
  end
  write'})\n'
end

write[==[

sort(all,pressort)

return tracks
]==]

