local write = io.write

local tracks = require "tracks"
local people = require "presenters"

local string = require "string"
local sub = string.sub
local find = string.find

io.output"site/status.html"

local function htmlenc(str)
  return (string.gsub(str,"[<>&]",{["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"}))
end

local function startswith(str,start)
  return sub(str,1,#start) == start
end

local indent = '    '

local function write_present(dat)
  if type(dat) == "string" then
    if find(dat,"%S") then
      write(indent,'<td class="present"></td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  else
    if dat then
      write(indent,'<td class="present"></td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  end
end
local function write_str(dat)
  if type(dat) == "string" then
    if find(dat,"%S") then
      write(indent,'<td class="present">',htmlenc(dat),'</td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  else
    if dat then
      write(indent,'<td class="present"></td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  end
end
local function write_link(dat,lead)
  if type(dat) == "string" then
    if find(dat,"%S") then
      local link
      if startswith(dat,"http://") or startswith(dat,"https://") then
        link = dat
      else
        link = lead .. dat
      end
      write(indent,'<td class="present">','<a href="',link,'">',dat,'</a></td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  else
    if dat then
      write(indent,'<td class="present"></td>\n')
    else
      write(indent,'<td class="missing"></td>\n')
    end
  end
end

write[[
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <title>STATUS FOR UI2012 PRESENTATIONS</title>
  <link rel="stylesheet" type="text/css" href="/2012/ui2012.css" />
  <style type="text/css">
    .present {background-color: #cfc}
    .missing {background-color: #fcc}
    .trackname {font-size: large}
    table, td, th {
      border: 1px solid #000;
      //border-collapse: collapse;
    }
  </style>
</head>
<body>
<p style="font-size: xx-large; color: red;">
  USE DISCRETION WHEN SHARING THIS PAGE
</p>
]]
write[[
<table>
]]
for tri=1,#tracks.names do
  local trn = tracks.names[tri]
  write("  <tr><th colspan=5><h2>",htmlenc(tracks.titles[trn]),"</h2></th></tr>",'\n')
  write[[
  <tr>
    <th>Title</th>
    <th>Full Title</th>
    <th>Abstract</th>
    <th>Image</th>
    <th>Materials</th>
  </tr>
  ]]
  local track = tracks[trn]
  for pri=1, #track do
    local pr = track[pri]
    write('  <tr>\n',
          '    <td><a href="/2012/presentations/',pr.id,'.html">',
          pr.title,'</a></td>\n')
    write_present(pr.fulltitle)
    write_present(pr.abstract)
    write_link(pr.image,'/2012/images/')
    write_link(pr.materials,'/2012/materials/')
  end
end
write[[
</table>
]]

write[[
</body>
</html>
]]
