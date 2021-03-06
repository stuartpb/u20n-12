--[=[ Usage:
  This script was used to construct the
  print booklet for the conference.

  Due to a bug in Google Chrome's
  PDF export function that caused certain presentations' pages to
  be mangled when exported as PDF, I hacked in a workaround
  in the eleventh hour to export only pages that were
  broken in the previously exported set of pages.
  These sets are the "bad_phases" arrays, and the "redos" array
  was the phase being re-exported. (The initial phase could be
  exported by setting "local redos = allprs".)
--]=]

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

  io.output('site/booklet-bad3.html')

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

local bad_phases = {
  {
     6, 11, 14, 16,
    17, 18, 22, 23,
    32, 38, 43, 44,
    48, 66, 68, 69,
    --17-21
    74, 76, 79, 80, 81,
    --22, 23, 24
    88, 96, 98,
    99, 101
  },
  {
    14, 18, 43, 48,
    68, 69, 80, 81,
    99, 101
  },
  {
    69, 81, 99, 101
  }
}
local redos = bad_phases[3]

for i=1, #redos do
  local pr = allprs[redos[i]]

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
