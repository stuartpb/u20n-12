local write = io.write

local presentations = require "presentations"
local elements = require "elements"

io.output"presentations.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

write[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>UI 2012 / presentations</title>
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
for i=1, #presentations do
  local pr = presentations[i]
  local speaker = pr.speaker
  local pagename = string.lower(string.gsub(speaker,",.*$",""))
  write"<p>"
  write'<span class="speaker">'
  write(htmlenc(speaker))
  write'</span>'
  if pr.speakorg then
    write" - "
    write'<span class="speakorg">'
    write(htmlenc(pr.speakorg))
    write'</span>'
  end
  write"<br>"
  write'<span class="session-title">'
  write(htmlenc(pr.title))
  write'</span>'
  write"<br>"
  write'<span class="session-fulltitle">'
  write(htmlenc(pr.fulltitle))
  write'</span>'
  write'</p>\n'
end
write'</div>'

write[[
</body>
</html>
]]
