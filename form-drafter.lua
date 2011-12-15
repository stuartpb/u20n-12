local tracks = require "tracks"
local p11s = tracks.all
local people = require "presenters"

local table = require"table"
local insert = table.insert
local sort = table.sort
local concat = table.concat

local string = require "string"
local format = string.format

local missingpeople = {}
local namelist = {}

local function present(str)
  return str and str:find"%S"
end

for name, prof in pairs(people) do
  local missing_data = {}
  if not present(prof.bio) then
    insert(missing_data,"Bio")
  end
  if not present(prof.org) then
    insert(missing_data,"Organization")
  end
  if not present(prof.headshot) then
    insert(missing_data,"Headshot")
  end

  missingpeople[name] = {
    profile = missing_data,
    p11s = {}
  }
  namelist[#namelist+1] = name
end

sort(namelist,function(m,n) return people[m].last < people[n].last end)

for i=1,#p11s do
  local pres = p11s[i]
  local person = pres.lead

  local missing_data = {}

  if not present(pres.fulltitle) then
    insert(missing_data,"Full title")
  end
  if not present(pres.abstract) then
    insert(missing_data,"Abstract")
  end
  if not present(pres.presimg) then
    insert(missing_data,"Presentation Image")
  end

  --so the presentation can be referred back to in the message
  --(its title, what time, etc)
  missing_data.pres = pres

  insert(missingpeople[person].p11s, missing_data)
  if pres.cos then
    local mp_cos = missingpeople[person].cos or {}
    local mp_coset = missingpeople[person].coset or {}
    for j=1,#pres.cos do
      local co = pres.cos[j]
      if not mp_coset[co] then
        mp_cos[#mp_cos+1] = co
        mp_coset[co] = #mp_cos
      end
    end
    missingpeople[person].cos = mp_cos
    missingpeople[person].coset = mp_coset
  end
end

local descriptions = {
  --Presenter Info
  ['Bio'] = [[A description of you.]],
  ['Organization'] = [[The organization you wish to be identified with (your employer).]],
  ['Headshot'] = [[A picture of you.]],
  --Presentation Info
  ['Full title'] = [[A one-line description of your presentation, longer than the title. For instance, a presentation entitled "Hydraulic Fluid Performance at Depth" could have a full title of "The effect of Depth and Pressure on Hydraulic and Dielectric Fluids".]],
  ['Abstract'] = [[An in-depth description of your presentation, from one to three paragraphs. See http://underwaterintervention.com/2012/presentations/hydraulic-fluid-performance-at-depth.html#abstract for an example.]],
  ['Presentation Image'] = [[An image that represents your presentation (not to be confused with your personal headshot).]],
}

local messages = {}

for name_i = 1, #namelist do
  local name = namelist[name_i]
  local prof = people[name]
  local miss = missingpeople[name]
  if #miss.p11s > 0 then -- only draft messages to presentation leads
    local message = {}
    local headers = {format('To: "%s" <%s>', name, prof.email)}
    if miss.cos then
      local co_addrs = {}
      for co_i = 1, #miss.cos do
        local co_name = miss.cos[co_i]
        local co_prof = people[co_name]
        co_addrs[co_i] = format('"%s" <%s>', co_name, co_prof.email)
      end
      insert(headers, 'Cc: ' .. concat(co_addrs,'; '))
    end
    insert(headers, "Subject: Underwater Intervention 2012 information")

    insert(message,concat(headers,'\n'))

    insert(message, [[Hi, I'm Stuart P. Bentley, organizer for the Underwater Intervention 2012 website.]])

    if #miss.profile > 0 then
      insert(message,'I need the following information for your presenter profile:')
      local list = {}
      for prl_i = 1, #miss.profile do
        local datum = miss.profile[prl_i]
        list[prl_i] = format('- %s: %s',datum,descriptions[datum])
      end
      insert(message,concat(list,'\n'))
    end

    for p11_i = 1, #miss.p11s do
      local presmiss = miss.p11s[p11_i]
      local pres = presmiss.pres
      local starttime = os.time(pres.start)
      if #presmiss > 0 then
        insert(message,format(
          'I need the following information for your presentation "%s" (scheduled for %s to %s, %s):',
          pres.title,
          os.date("%I:%M %p",starttime),
          os.date("%I:%M %p",starttime+pres.length),
          os.date("%A, %B %d, %Y",starttime)))
        local list = {}
        for prl_i = 1, #presmiss do
          local datum = presmiss[prl_i]
          list[prl_i] = format('- %s: %s',datum,descriptions[datum])
        end
        insert(message,concat(list,'\n'))
      end
      insert(message,format(
        'Please visit http://underwaterintervention.com/2012/presentations/%s.html to verify that the information we have on file is accurate.',
        pres.id))
    end

    if miss.cos then
      insert(message,"Your co-presenters, copied on this message, can submit this information as well.")
    end

    insert(messages,concat(message,'\n\n'))
  end
end

for i=1, #messages do
  print(messages[i])
  print"\n---\n"
end

print(#messages)

