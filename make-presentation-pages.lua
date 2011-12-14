local write = io.write

local tracks = require 'tracks'
local allprs = tracks.all
local presenters = require "presenters"

--Try to use a proper Markdown encoder, but fail somewhat gracefully otherwise.
local htmlenc
local success, lunamark = pcall(require,"lunamark")
if success then
  local parse = lunamark.reader.markdown.new(
    lunamark.writer.html.new{}, {})
  function htmlenc(str)
    return (parse(str))
  end
else
  function htmlenc(str)
    return (string.gsub((string.gsub((string.gsub(str,
      "[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"})),
      "\n\n","\n<br><br>\n")),
      "\n[%-0123456789]","\n<br>%-"))
  end
end

for i=1, #allprs do
  local pr = allprs[i]

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
  io.output('presentations/'..pagename..".html")

  write[[
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset='utf-8'>
    <title>UI 2012</title>
    <link rel="stylesheet" type="text/css" href="/2012/ui2012.css" />
  </head>
  <body>
  ]]

  write[[
  <header>
    <img src="/2012/images/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012</span>
  </header>
  ]]

  --write(elements.nav)
  write[[
  <nav>
    <ul>
      <li>return to:</li>
]]
  write('      <li><a href="/2012/schedule.html#',
    pr.id,'">schedule</a></li>\n')
  write('      <li><a href="/2012/tracks.html#',
    pr.id,'">tracks</a></li>\n')
  write[[
    </ul>
    <ul>
      <li><a href="/">underwater intervention home</a></li>
    </ul>
  </nav>
]]

  write'<div class="content">\n'
    write"<h1>"
    write(htmlenc(pr.title))
    write"</h1>\n"
    write'<p>'

    local starttime = os.time(pr.start)
    local endtime = starttime + pr.length

    write(os.date("%A, %B %d, %Y",starttime))
    write'<br>\n'

    write(string.format("%s - %s (%.0f min)",
      os.date("%I:%M %p",starttime),
      os.date("%I:%M %p",endtime),
      pr.length/60))
    write'<br>\n'

    write("Room ",pr.room," - ",tracks.titles[pr.track],'\n')

    write'</p>\n'
    write"<h2>Presenter</h2>"
    write'<p>'
    write(htmlenc(speaker))
    if lead.org and string.find(lead.org,"%S") then
      write'<br>'
      if lead.homepage then
        write('<a href="',lead.homepage,'">',
          htmlenc(lead.org),'</a>')
      else
        write(htmlenc(lead.org))
      end
    end
    write"</p>\n"
    write'<h2>Abstract</h2>\n'
    write'<p>'
    if pr.presimg then
      write('<img class="presimg" src="',
        '/2012/images/',pr.presimg,'">','\n')
    end
    write(htmlenc(pr.abstract))
    write'</p>\n'
    if lead.bio then
      write'<h2>Presenter Bio</h2>\n'
      write'<p>'
      if lead.headshot then
        write('<img class="headshot" src="',
          '/2012/images/',lead.headshot,'">','\n')
      end
      write(htmlenc(lead.bio))
      write'</p>\n'
    end
  write'</div>'

  write[[
  </body>
  </html>
  ]]
end
