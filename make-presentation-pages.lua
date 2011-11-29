local write = io.write

local presentations = require "presentations"
local elements = require "elements"

local function htmlenc(str)
  return (string.gsub(
    (string.gsub(
      str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"})),
      "\n\n","\n<br><br>\n"))
end

for i=1, #presentations do
  local pr = presentations[i]
  local speaker = pr.speaker
  local pagename = string.lower(string.gsub(speaker,",.*$",""))
  io.output(pagename..".html")

  write[[
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset='utf-8'>
    <title>UI 2012</title>
    <link rel="stylesheet" type="text/css" href="ui2012.css" />
  </head>
  <body>
  ]]

  write[[
  <header>
    <img src="logo.jpg" class="logo"> <span class="page-title">underwater intervention 2012</span>
  </header>
  ]]

  write(elements.nav)

  write'<div class="content">\n'
    write"<h1>"
    write(htmlenc(pr.title))
    write"</h1>\n"
    write"<h2>Presenter</h2>"
    write'<p>'
    write(htmlenc(speaker))
    if pr.speakorg then
      write' ('
      write(htmlenc(pr.speakorg))
      write')'
    end
    write"</p>\n"
    write'<h2>Abstract</h2>\n'
    write'<p>'
    write(htmlenc(pr.abstract))
    write'</p>\n'
    write'<h2>Presenter Bio</h2>\n'
    write'<p>'
    write(htmlenc(pr.bio))
    write'</p>\n'
  write'</div>'

  write[[
  </body>
  </html>
  ]]
end
