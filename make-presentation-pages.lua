local write = io.write

local tracks = require 'tracks'
local presentations = tracks.all
local elements = require "elements"

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
      "\n%-","\n<br>%-"))
  end
end

for i=1, #presentations do
  local pr = presentations[i]
  local speaker = pr.lead.first .. ' ' .. pr.lead.last
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
    write"<h2>Presenter</h2>"
    write'<p>'
    write(htmlenc(speaker))
    if pr.lead.org and string.find(pr.lead.org,"%S") then
      write'<br>'
      write(htmlenc(pr.lead.org))
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
    write'<h2>Presenter Bio</h2>\n'
    write'<p>'
    if pr.headshot then
      write('<img class="headshot" src="',
        '/2012/images/',pr.headshot,'">','\n')
    end
    write(htmlenc(pr.bio))
    write'</p>\n'
  write'</div>'

  write[[
  </body>
  </html>
  ]]
end
