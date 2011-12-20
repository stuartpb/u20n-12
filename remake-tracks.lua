local tracks = require "tracks"

for ni=1,#tracks.names do
  local tn = tracks.names[ni]
  local track = tracks[tn]

  local outfile = io.open('new-tracks/'..tn..'.lua','w')

  local function write(...)
    --io.stdout:write(...)
    outfile:write(...)
  end

  local function writef(...)
    return write(string.format(...))
  end

  write'local maketrack = require "maketrack"\n'
  writef('return maketrack(%q, {\n\n',tn)
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
