local tracks = require "tracks"

local template = [[
<html>
<head>
<meta http-equiv="Refresh" content="0; url=@" />
</head>
<body>
<p>Moved to <a href="@">@</a></p>
</body>
</html>
]]

for tr_i=1, #tracks.names do
  local trn = tracks.names[tr_i]
  local track = tracks[trn]
  for i=1, #track do
    local oldpage = string.format("pres-redirs/%s%i.html",trn,i)
    local newpage = string.format("/2012/presentations/%s.html",track[i].id)
    io.output(oldpage)
    io.write((string.gsub(template,'@',newpage)))
  end
end
