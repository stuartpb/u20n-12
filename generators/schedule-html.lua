local write = io.write

local tracks = require "tracks"
local people = require "presenters"

io.output"site/schedule.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

local function with_path(str)
  return (string.gsub(str,"%$root","/mirror/ui2012"))
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
  table.sort(slots[i],function(m,n) return m.loc < n.loc end)
end

--write HTML--

write(with_path[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / schedule</title>
  <link rel="stylesheet" type="text/css" href="$root/ui2012.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
]])

write(with_path[[
<header>
  <img src="$root/images/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012: schedule</span>
</header>
]])

write(with_path[[
<nav>
  <ul>
    <li>go to:</li>
    <li><a href="#tue">tuesday</a></li>
    <li><a href="#wed">wednesday</a></li>
    <li><a href="#thu">thursday</a></li>
  </ul>
  <ul>
    <li><a href="$root/index.html">underwater intervention home</a></li>
    <li><a href="$root/tracks.html">view presentations by track</a></li>
    <li><a href="$root/errata.html">booklet errata</a></li>
  </ul>
</nav>
]])

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

    local speaker = pr.presenters[1]
    local lead = people[speaker]

    assert(lead, "Missing presenter: "..speaker.." ("..pr.id..")")

    local pagename = pr.id

    write('<div class = "presdiv presdiv-',pr.track,'" id="',pr.id,'">')
    write(pr.loc,' ')
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
