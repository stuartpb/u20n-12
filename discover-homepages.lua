local tracks = require 'tracks'

local http=require"socket.http"
--ugh
local ltn12=require"ltn12"

local outfile = io.open('homepages.lua','w')

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
for i=1,#tracks.all do
  local org = tracks.all[i].lead.org
  if org and string.find(org,"%S") and not set[org] then
    set[org] = true
    local searchurl = string.format("http://www.google.com/search?&q=%s&btnI",urlencode(org))
    local what, code, tab, str = http.request{url=searchurl,method="HEAD",redirect=false}

    if code ~= 302 then
      write(string.format("  --%s: %s\n",org,str))
    else
      write(string.format("  [%q] = %q,\n",org,tab.location))
    end
  end
end
write'}\n'
