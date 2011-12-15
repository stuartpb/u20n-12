local people = require 'presenters'

local http=require"socket.http"
--ugh
local ltn12=require"ltn12"

--get the old ones
local homepages = require "homepages"

local outfile = io.open('new-homepages.lua','w')

local function write(...)
  io.stdout:write(...)
  outfile:write(...)
end

--URL encode a string.
local function urlencode(str)

  --Ensure all newlines are in CRLF form
  str = string.gsub (str, "\r?\n", "\r\n")

  --Percent-encode all non-unreserved characters
  --as per RFC 3986, Section 2.3
  --(except for space, which gets plus-encoded)
  str = string.gsub (str, "([^%w%-%.%_%~ ])",
    function (c) return string.format ("%%%02X", string.byte(c)) end)

  --Convert spaces to plus signs
  str = string.gsub (str, " ", "+")

  return str
end

local set={}

write'return {\n'
for name, lead in pairs(people) do
  local org = lead.org
  if org and string.find(org,"%S") and not set[org] then
    set[org] = true
    local homepage
    if homepages[org] then
      homepage = homepages[org]
    else
      local searchurl = string.format("http://www.google.com/search?&q=%s&btnI",urlencode(org))
      local what, code, tab, str = http.request{url=searchurl,method="HEAD",redirect=false}

      if code ~= 302 then
        homepage = ""
      else
        homepage = tab.location
      end
    end
    write(string.format("  [%q] = %q,\n",org,homepage))
  end
end
write'}\n'
