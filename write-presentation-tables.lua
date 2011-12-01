-- Convert from CSV string to table
local function fromCSV (s)
  s = s .. ','        -- ending comma
  local t = {}        -- table to collect fields
  local row = {}
  local fieldstart = 1
  local _
  local char
  repeat
    -- next field is quoted? (start with '"'?)
    if string.find(s, '^"', fieldstart) then
      local a, c
      local i  = fieldstart
      repeat
        -- find closing quote
        a, i, c = string.find(s, '"("?)', i+1)
      until c ~= '"'    -- quote not followed by quote?
      if not i then error('unmatched "') end
      local f = string.sub(s, fieldstart+1, i-1)
      row[#row+1] = (string.gsub(f, '""', '"'))
      fieldstart, _, char = string.find(s, '([,\n])', i)
      fieldstart = fieldstart + 1
    else                -- unquoted; find next comma
      local nexti
      nexti, _, char = string.find(s, '([,\n])', fieldstart)
      row[#row+1] = string.sub(s, fieldstart, nexti-1)
      fieldstart = nexti + 1
    end
    if char == '\n' then
      t[#t+1] = row
      row = {}
    end
  until fieldstart > string.len(s)
  return t
end

local function pivot(sheet)
  local t = {}
  local row1 = sheet[1]
  for i = 2, #sheet do
    local obj = {}
    for j = 1, #row1 do
      obj[row1[j]] = sheet[i][j]
    end
    t[i-1] = obj
  end
  return t
end

local function csv_import(filename)
  local file = io.open(filename)
  local csv_content = file:read"*a"
  file:close()
  return pivot(fromCSV(csv_content))
end

local abs_export = csv_import "abstracts.csv"
local aut_export = csv_import "authors.csv"

--make good data for lookup
local aut_lookup = {}

for i, author_t in pairs(aut_export) do
  local function pos_info(name)
    if author_t[name.."_Email"]
    and string.find(author_t[name.."_Email"],"%S") then
      return {
        last = author_t[name.."_Last"],
        first = author_t[name.."_First"],
        org = author_t[name.."_Org"],
        email = author_t[name.."_Email"],
      }
    else
      return nil
    end
  end

  local lead = pos_info"Lead"

  local cos = {}
  for coi = 1, 5 do
    cos[coi] = pos_info(string.format("Co%i",coi))
  end

  local auttab = {lead = lead}
  if #cos > 0 then auttab.cos = cos end

  aut_lookup[author_t.ShortTitle] = auttab
end

--grab the existing entered presentations
local tracks = require "tracks"

local nameset = {}

for ni = 1, #tracks.all do
  nameset[tracks.all[ni].title] = true
end

--open up a file to save this into
io.output "presentations.lua"

local write = io.write
--write indented line
local function wind(depth,...)
  write(string.rep('  ',depth),...)
  write'\n'
end

--name-quote pair string
local function nqps(name,str)
  return string.format("%s = %q,",name,str)
end

--print / pickle
local person_fields = {"first","last","org","email"}
local function write_person(depth, person)
  for i=1, #person_fields do
    wind(depth, nqps(person_fields[i],person[person_fields[i]]))
  end
end

write"--encoding: utf-8\n"
write"return {\n\n"

for i=1,#abs_export do
  local ab = abs_export[i]
  local shortt = ab["Short Title:"]
  local people = aut_lookup[shortt]
  if not nameset[shortt] then
    wind(1,'{')
    wind(2,nqps("title",shortt))
    wind(2,nqps("fulltitle",ab["Full Title:"]))
    --we could compare the author information here
    --from what's in the exported Abstracts to what's in
    --the exported Authors, but why bother?
    wind(2,"lead = {")
    write_person(3,people.lead)
    wind(2,"},")
    if people.cos then
      wind(2,"cos = {")
        for coi=1,#people.cos do
          wind(3,"{")
          write_person(4,people.cos[coi])
          wind(3,"},")
        end
      wind(2,"},")
    end
    wind(2,"abstract = [==[")
    write(ab["Full Abstract Text:"])
    --append a newline at the end just because it's classy
    write"\n"
    write"]==],\n"
    wind(2,"bio = [==[")
    write(ab.Bio)
    --append a newline at the end just because it's classy
    write"\n"
    write"]==],\n"
    wind(2,nqps("track",ab.Track))
    wind(2,"start = { day = 24, month = 1, year = 2012, --TODO: DATE")
    wind(3,"hour = 8, min = 30 }, --TODO: TIME")
    wind(2,"length = 1800, --TODO: LENGTH")
    wind(2,'room = "221", --TODO: ROOM')
    wind(1,'},\n')
  end
end

write"}\n"
