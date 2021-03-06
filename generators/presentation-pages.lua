local write = io.write

local tracks = require 'tracks'
local allprs = tracks.all
local people = require 'presenters'

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

local function with_path(str)
  return (string.gsub(str,"%$root","/mirror/ui2012"))
end

for i=1, #allprs do
  local pr = allprs[i]

  local pagename = pr.id
  io.output('site/presentations/'..pagename..".html")

  write(with_path[[
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset='utf-8'>
    <title>UI 2012</title>
    <link rel="stylesheet" type="text/css" href="$root/ui2012.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <body>
  ]])

  write(with_path[[
  <header>
    <img src="$root/images/logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012</span>
  </header>
  ]])

  --write(elements.nav)
  write[[
  <nav>
    <ul>
      <li>return to:</li>
]]
  write(with_path'      <li><a href="$root/schedule.html#',
    pr.id,'">schedule</a></li>\n')
  write(with_path'      <li><a href="$root/tracks.html#',
    pr.id,'">tracks</a></li>\n')
  write(with_path[[
    </ul>
    <ul>
      <li><a href="$root/index.html">underwater intervention home</a></li>
    </ul>
  </nav>
]])

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

    write(pr.loc," - ",tracks.titles[pr.track],'\n')
    write'</p>\n'

    if pr.abstract then
      write'<h2 id="abstract">Abstract</h2>\n'
      write'<p>'
      if pr.image then
        write('<img class="presimg" src="',
          with_path'$root/images/',pr.image,'">','\n')
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
    write'</h2>\n'

    for i=1, #presenters do
      local name = pr.presenters[i]
      local person = people[name]
      if not person then error("Missing entry for "..name) end

      write'<div class="presenter-info">'
      if person.headshot then
        write('<img class="headshot" src="',
          with_path'$root/images/',person.headshot,'">','\n')
      end

      write'<p>'
      write('<span class="presenter-name">',htmlenc(name),'</span>')
      if person.org and string.find(person.org,"%S") then
        write'<br>\n'
        write('<span class="presenter-org">',htmlenc(person.org),'</span>')
      end

      if person.homepage then
        write'<br>\n'
        write('<a class="orglink" href="',person.homepage,'">',
          htmlenc(person.homepage),'</a>')
      end
      write"\n</p>\n"

      if person.bio then
        write'<p>'
        write(htmlenc(person.bio))
        write'</p>\n'
      end
    write'</div>\n'
    end
  write'</div>\n'

  write[[
  </body>
  </html>
  ]]
end
