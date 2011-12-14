local write = io.write

local tracks = require "tracks"
local elements = require "elements"
local presenters = require "presenters"

io.output"schedule.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

--organize by time--

local times = {}
for i=1,#tracks.all do
  local stime = os.time(tracks.all[i].start)
  if #times < 1 or times[#times] < stime then
    times[#times+1] = stime
  end
end

local tlookup = {}
local slots = {}
for i=1,#times do
  tlookup[times[i]]=i
  slots[i]={}
end

for i=1,#tracks.all do
  local pres = tracks.all[i]
  local stime = os.time(pres.start)
  local endtime = stime + pres.length
  local timei = tlookup[stime]

  --add this presentation to each timeslot it occurs within
  while timei <= #times and times[timei] < endtime do
    local sslot = slots[timei]
    sslot[#sslot+1] = pres
    timei = timei + 1
  end
end

for i=1,#times do
  table.sort(slots[i],function(m,n) return m.room < n.room end)
end

--write HTML--

write[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / schedule</title>
  <link rel="stylesheet" type="text/css" href="/2012/ui2012.css" />
</head>
<body>
]]

write[[
<header>
  <img src="/2012/images/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: schedule</span>
</header>
]]

write[[
<nav>
  <ul>
    <li>go to:</li>
    <li><a href="#tue">tuesday</a></li>
    <li><a href="#wed">wednesday</a></li>
    <li><a href="#thu">thursday</a></li>
  </ul>
  <ul>
    <li><a href="/">underwater intervention home</a></li>
    <li><a href="/2012/tracks.html">view presentations by track</a></li>
  </ul>
</nav>
]]

write'<div class="content">\n'

local lastday
for i=1, #times do
  local slottime = times[i]
  --write a new date header if we've crossed a day boundary
  local today = string.lower(os.date("%a",slottime))
  if today ~= lastday then
    write('<h2 id="',today,'" class="schedday">',
      os.date("%A, %B %d, %Y",slottime),'</h2>\n')
    lastday = today
  end

  write('<h3>',os.date("%I:%M %p",slottime),'</h3>\n')

  local slot = slots[i]
  for j=1, #slot do
    local pr = slot[j]
    local prestime = os.time(pr.start)
    local speaker, lead

    --transitional selection
    if type(pr.lead) == "string" then
      speaker = pr.lead
      lead = presenters[speaker]
    else
      lead = pr.lead
      speaker = lead.first .. ' ' .. lead.last
    end

    local pagename = pr.id

    write('<div class = "presdiv presdiv-',pr.track,'" id="',pr.id,'">')
    write("Room ",pr.room,' ')
    if prestime == slottime then
      write(string.format(" (%.0f min)",pr.length/60))
    else
      write(string.format(" (%.0f min, continued from %s)",pr.length/60,
        os.date("%I:%M %p",prestime)))
    end
    write('<span class="prestrack">',tracks.titles[pr.track],"</span>")
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
