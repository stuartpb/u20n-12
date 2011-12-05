local write = io.write

local tracks = require "tracks"
local elements = require "elements"

io.output"tracks.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

write[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / tracks</title>
  <link rel="stylesheet" type="text/css" href="ui2012.css" />
</head>
<body>
]]

write[[
<header>
  <img src="/2012/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: tracks</span>
</header>
]]

--write(elements.nav)
write[[
<nav><ul>
  <li>go to:</li>
]]
for i=1, #tracks.names do
  local tn = tracks.names[i]
  write('  <li><a href="#',tn,'">',tracks.titles[tn],'</a></li>')
end
write[[
</ul></nav>
]]

write'<div class="content">\n'

for ni=1, #tracks.names do
  local tname = tracks.names[ni]
  local track = tracks[tname]
  local lastday
  write('<h2 class="schedtrack" id="',tname,'">',tracks.titles[tname],'</h2>\n')
  for i=1, #track do
    local pr = track[i]
    local speaker = pr.lead.first .. ' ' .. pr.lead.last
    local pagename = pr.id
    local stime = os.time(pr.start)
    if pr.start.day ~= lastday then
      write('<h3>', os.date("%A, %B %d, %Y",stime),'</h3>\n')
      lastday = pr.start.day
    end

    write('<div class="presdiv presdiv-',pr.track,'" id="',pr.id,'">')
    write(os.date("%I:%M %p",stime),' <span class="trackroom">Room ',pr.room,"</span>")
    write"<br>\n"
    write'<span class="speaker">'
    write(htmlenc(speaker))
    write'</span>'
    if pr.lead.org and string.find(pr.lead.org,"%S") then
      write' <span class="speakorg">('
      write(htmlenc(pr.lead.org))
      write')</span>'
    end
    write" - "
    write'<a href="'
    write('/2012/presentations/',pagename,".html")
    write'" class="session-title">'
    write(htmlenc(pr.title))
    write'</a>'
    write"<br>\n"

    write'<span class="session-fulltitle">'
    write(htmlenc(pr.fulltitle))
    write'</span>'
    write'</div>\n'
  end
end
write'</div>'

write[[
</body>
</html>
]]