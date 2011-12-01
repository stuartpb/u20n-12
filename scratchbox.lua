local tracks = require "tracks"

for ti = 1, #tracks.names do
  local track = tracks[tracks.names[ti]]
  print(tracks.titles[tracks.names[ti]])
  for i=1, #track do
    local pres = track[i]
    local st = os.time(pres.start)
    local name = string.gsub("$first $last","%$(%w*)",pres.lead)
    print(os.date("%m/%d/%y %I:%M %p", st), pres.room, name, pres.title)
  end
  print()
end
