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
  <title>UI 2012 / presentations / by schedule</title>
  <link rel="stylesheet" type="text/css" href="ui2012.css" />
</head>
<body>
]]

write[[
<header>
  <img src="logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: presentations</span>
</header>
]]

write(elements.nav)

write'<div class="content">\n'

write'<h2>Key</h2>\n'
for i=1, #tracks.names do
  local tr = tracks.names[i]
  write('<div class = "presdiv presdiv-',tr,'">')
  write(tracks.titles[tr])
  write'</div>\n'
end

local lastday, laststart, lastend
for i=1, #tracks.all do
  local pr = tracks.all[i]
  local speaker = pr.lead.first .. ' ' .. pr.lead.last
  local pagename = string.lower(pr.lead.last)
  local stime = os.time(pr.start)
  if pr.start.day ~= lastday then
    write'<h2>'
    write(os.date("%A, %B %d, %Y",stime))
    lastday = pr.start.day
    write'</h2>\n'
  end
  write('<div class = "presdiv presdiv-',pr.track,'">')
  write("Room ",pr.room,' ',os.date("%I:%M %p",stime),' ')
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
