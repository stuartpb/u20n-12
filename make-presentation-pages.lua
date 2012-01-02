local write = io.write

local tracks = require 'tracks'
local allprs = tracks.all
local people = require "presenters"

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

    if pr.abstract then
      write'<h2 id="abstract">Abstract</h2>\n'
      write'<p>'
      if pr.image then
        write('<img class="presimg" src="',
          '/2012/images/',pr.image,'">','\n')
      end
      write(htmlenc(pr.abstract))
      write'</p>\n'
    end

    local presenters = pr.presenters

    write'<h2 id="presenters">'
    if #presenters > 1 then
    write "Presenters"
    else
    write "Presenter"
    end
    write'</h2>'

    for i=1, #presenters do
      local name = pr.presenters[i]
      local lead = people[name]

      write'<p>'
      write(htmlenc(name))
      if lead.org and string.find(lead.org,"%S") then
        write'<br>'
        write(htmlenc(lead.org))
      end
      if lead.homepage then
        write'<br>'
        write('<a class="orglink" href="',lead.homepage,'">',
          htmlenc(lead.homepage),'</a>')
      end
      write"</p>\n"

      if lead.bio then
        write'<p>'
        if lead.headshot then
          write('<img class="headshot" src="',
            '/2012/images/',lead.headshot,'">','\n')
        end
        write(htmlenc(lead.bio))
        write'</p>\n'
      end
    end
  write'<br style="clear: both;">\n'
  write'</div>'

  write[[
  </body>
  </html>
  ]]
end
