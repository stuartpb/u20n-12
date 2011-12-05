local write = io.write

local tracks = require "tracks"
local elements = require "elements"

io.output"schedule.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

write[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / schedule</title>
  <link rel="stylesheet" type="text/css" href="ui2012.css" />
</head>
<body>
]]

write[[
<header>
  <img src="logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: schedule</span>
</header>
]]

--write(elements.nav)
write[[
<nav><ul>
  <li>go to:</li>
  <li><a href="#tue">tuesday</a></li>
  <li><a href="#wed">wednesday</a></li>
  <li><a href="#thu">thursday</a></li>
</ul></nav>
]]

write'<div class="content">\n'

local lastday, laststart, lastend
for i=1, #tracks.all do
  local pr = tracks.all[i]
  local speaker = pr.lead.first .. ' ' .. pr.lead.last
  local pagename = pr.id
  local stime = os.time(pr.start)
  if pr.start.day ~= lastday then
    write('<h2 id="',string.lower(os.date("%a",stime)),'" class="schedday">',
      os.date("%A, %B %d, %Y",stime),'</h2>\n')
    lastday = pr.start.day
  end
  if stime ~= laststart then
    write('<h3>',os.date("%I:%M %p",stime),'</h3>\n')
    laststart = stime
  end

  write('<div class = "presdiv presdiv-',pr.track,'">')
  write("Room ",pr.room,' ')
  write('<span class="prestrack">',tracks.titles[pr.track],"</span>")
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
  write(pagename,".html")
  write'" class="session-title">'
  write(htmlenc(pr.title))
  write'</a>'
  write"<br>\n"

  write'<span class="session-fulltitle">'
  write(htmlenc(pr.fulltitle))
  write'</span>'
  write'</div>\n'
end
write'</div>'

write[[
</body>
</html>
]]
