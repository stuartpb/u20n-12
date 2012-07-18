--[=[ Usage:
  This script was used after moving pages from a tentative
  naming scheme to the one finally used for the presentation
  page names, so that old links would redirect to the new locations.

  The original naming scheme was dependent on the order of the presentations
  in their track. When it became apparent that presentations were going
  to be moved in the runup to the conference, the scheme was changed to be
  dependant on the presentation's title, so that changing one presentation's
  time slot wouldn't change any URLs.

  This was a one-time operation on presentations that hadn't
  themselves changed since the old scheme, so it reads from the
  same set of data to generate the URLs for both schemes.

  This was only made for this one set of redirects - future changes
  that would affect a presentation's URL were not redirected.
--]=]

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
    local newpage = string.format("/mirror/ui2012/presentations/%s.html",track[i].id)
    io.output(oldpage)
    io.write((string.gsub(template,'@',newpage)))
  end
end
