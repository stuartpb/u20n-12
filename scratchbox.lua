local tracks = require "tracks"

for ti = 1, #tracks.names do
  local track = tracks[tracks.names[ti]]
  print(tracks.titles[tracks.names[ti]])
  local lastday
  local lastend
  for i=1, #track do
    local pres = track[i]
    local st = os.time(pres.start)
    local name = string.gsub("$first $last","%$(%w*)",pres.lead)

    if st ~= lastend then print() end
    lastend = st + pres.length
    if pres.start.day ~= lastday then
    print(os.date("%A, %B %d, %Y",st))
    lastday = pres.start.day
    end

    print(os.date("%I:%M %p", st), name, pres.title)
  end
  print()
end
