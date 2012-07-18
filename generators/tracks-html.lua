local write = io.write

local tracks = require "tracks"
local people = require "presenters"

io.output"site/tracks.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

local function with_path(str)
  return string.gsub(str,"%$root","/mirror/ui2012")
end

write(with_path[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / tracks</title>
  <link rel="stylesheet" type="text/css" href="$root/ui2012.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
]])

write(with_path[[
<header>
  <img src="$root/images/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: tracks</span>
</header>
]])

write[[
<nav>
  <ul>
    <li>go to:</li>
]]

for i=1, #tracks.names do
  local tn = tracks.names[i]
  write('    <li><a href="#',tn,'">',tracks.titles[tn],'</a></li>\n')
end

write(with_path[[
  </ul>
  <ul>
    <li><a href="$root/index.html">underwater intervention home</a></li>
    <li><a href="$root/schedule.html">view presentations by time</a></li>
    <li><a href="$root/errata.html">booklet errata</a></li>
  </ul>
</nav>
]])

write'<div class="content">\n'

for ni=1, #tracks.names do
  local tname = tracks.names[ni]
  local track = tracks[tname]
  local lastday
  write('<h2 class="schedtrack" id="',tname,'">',tracks.titles[tname],'</h2>\n')
  for i=1, #track do
    local pr = track[i]

    local speaker = pr.presenters[1]
    local lead = people[speaker]

    local pagename = pr.id
    local stime = os.time(pr.start)
    if pr.start.day ~= lastday then
      write('<h3>', os.date("%A, %B %d, %Y",stime),'</h3>\n')
      lastday = pr.start.day
    end

    write('<div class="presdiv presdiv-',pr.track,'" id="',pr.id,'">')
    write(os.date("%I:%M %p",stime),
      string.format(" (%.0f min)",pr.length/60),
      ' <span class="trackroom">',pr.loc,"</span>")
    write"<br>\n"
    write'<span class="speaker">'
    write(htmlenc(speaker))
    write'</span>'
    if lead.org and string.find(lead.org,"%S") then
      write' <span class="speakorg">('
      write(htmlenc(lead.org))
      write')</span>'
    end
    write" - "
    write'<a href="'
    write(with_path'$root/presentations/',pagename,".html")
    write'" class="session-title">'
    write(htmlenc(pr.title))
    write'</a>'
    write"<br>\n"

    write'<span class="session-fulltitle">'
    write(htmlenc(pr.fulltitle or ""))
    write'</span>'
    write'</div>\n'
  end
end
write'</div>'

write[[
</body>
</html>
]]
