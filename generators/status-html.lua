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

local function prsr_id(name)
  return string.lower(string.gsub(string.gsub(name,"%W","%-"
  ),"%-+","-"))
end

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
        link = "/mirror/ui2012" .. lead .. dat
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
  <link rel="stylesheet" type="text/css" href="/mirror/ui2012/ui2012.css" />
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
  write("  <tr><th colspan=6><h2>",htmlenc(tracks.titles[trn]),"</h2></th></tr>",'\n')
  write[[
  <tr>
    <th>Title</th>
    <th>Presenter(s)</th>
    <th>Full Title</th>
    <th>Abstract</th>
    <th>Image</th>
    <th>Materials</th>
  </tr>
  ]]
  local track = tracks[trn]
  for pri=1, #track do
    local pr = track[pri]
    local prsrs = pr.presenters
    write('  <tr>\n',
          '    <td><a href="/mirror/ui2012/presentations/',pr.id,'.html">',
          htmlenc(pr.title),'</a></td>\n')
    write"    <td>\n"
    for i=1, #prsrs do
      local prsr = prsrs[i]
      write('      <a href="#',prsr_id(prsr),'">',prsr,"</a>")
      if i ~= #prsrs then write"<br>\n" end
    end
    write"    </td>\n"
    write_present(pr.fulltitle)
    write_present(pr.abstract)
    write_link(pr.image,'/images/')
    write_link(pr.materials,'/materials/')
  end
end
write[[
</table>
]]

local names = {}
for name in pairs(people) do
  names[#names+1]=name
end
table.sort(names)

write"<h1>Presenters</h1>\n"
write"<table>"
write[[
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Organization</th>
    <th>Bio</th>
    <th>Headshot</th>
  </tr>
]]
for ni=1, #names do
  local name = names[ni]
  local pr = people[name]
  write('  <tr id="',prsr_id(name),'">\n')
  write('    <td>',htmlenc(name),'</td>\n')
  write('    <td>',htmlenc(pr.email),'</td>\n')
  if pr.org and pr.homepage and find(pr.org,"%S") then
    write(indent,'<td class="present"><a href="',pr.homepage,'">',htmlenc(pr.org),'</a></td>\n')
  else
    write(indent,'<td class="missing"></td>\n')
  end
  write_present(pr.bio)
  write_link(pr.headshot,'/images/')
  write'  </tr>\n'
end
write'</table>\n'

write[[
</body>
</html>
]]
