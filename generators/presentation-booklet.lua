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

  io.output('site/booklet.html')

  write[[
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset='utf-8'>
    <title>UI 2012</title>
    <link rel="stylesheet" type="text/css" href="ui2012.css" />
    <style type="text/css">
      .content {
        margin: 0 !important;
        page-break-before: always;
      }

      .content:first-child {page-break-before:auto}

      body {
        font-size: 50%;
        margin: 0 !important;
      }
    </style>
  </head>
  <body>
  ]]

for i=1, #allprs do
  local pr = allprs[i]

  local pagename = pr.id

  write'<div class="content">\n'
    write"<h1>"
    write(htmlenc(pr.title))
    write"</h1>\n"

    if pr.image then
      write('<img class="presimg" src="',
        'images/',pr.image,'">','\n')
    end

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
      write'<div style="width: 100%;">'
      write(htmlenc(pr.abstract))
      write'</div>\n'
    end

    local presenters = pr.presenters

    write'<h2 id="presenters"'
    --if pr.abstract then write' style="page-break-before:always"' end
    write'>'
    if #presenters > 1 then
    write "Presenters"
    else
    write "Presenter"
    end
    write'</h2>'

    for i=1, #presenters do
      local name = pr.presenters[i]
      local lead = people[name]

      if lead.headshot then
        write('<img class="headshot" src="',
          'images/',lead.headshot,'">','\n')
      end

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
        write'<div style="width: 100%;">'
        write(htmlenc(lead.bio))
        write'</div>\n'
      end
    end
  write'<br style="clear: both;">\n'
  write'</div>'

  write[[
  </body>
  </html>
  ]]
end
