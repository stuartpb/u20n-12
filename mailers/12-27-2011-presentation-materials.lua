local smtp = require "socket.smtp"
local send = smtp.send
--ugh
local ltn12 = require "ltn12"

local tracks = require "tracks"
local p11s = tracks.all
local people = require "presenters"

local table = require"table"
local insert = table.insert
local sort = table.sort
local concat = table.concat

local string = require "string"
local format = string.format

local function present(str)
  return str and str:find"%S"
end

local function site_complete(pres)
  return present(pres.fulltitle) and present(pres.abstract) and present(pres.image)
end

-- Form messages

local messages = {}
local rcpts = {}

local master_mail = "techwebmaster@underwaterintervention.com"

for i=1, #p11s do
  local pres = p11s[i]
  if not (site_complete(pres) and pres.materials) then
    local headers = {}
    local rcpt = {}
    local body = {}

    local lead = pres.presenters[1]

    headers.subject = format('Materials needed for Underwater Intervention 2012 presentation "%s"',pres.title)

    headers.from = format('"%s" <%s>', master_mail, master_mail)

    headers.to = format('"%s" <%s>', lead, people[lead].email)
    insert(rcpt,format('<%s>', people[lead].email))

    -- Work out additional recipients
    local cc = {}
    if #pres.presenters > 1 then
      for j=2, #pres.presenters do
        local co_name = pres.presenters[j]
        insert(cc,format('"%s" <%s>', co_name, people[co_name].email))
        insert(rcpt,format('<%s>', people[co_name].email))
      end
    end

    local track_chair = tracks.chairs[pres.track]

    if(track_chair ~= lead) then
      insert(cc,format('"%s" <%s>', track_chair, people[track_chair].email))
      insert(rcpt,format('<%s>', people[track_chair].email))
    end

    if #cc > 0 then
      headers.cc = concat(cc,'; ')
    end

    -- Assemble body
    insert(body, [[I am the webmaster for the Technical Sessions at Underwater Intervention.]])

    if not site_complete(pres) then
      insert(body, format(
        [[I need the following information to complete the web page for your presentation (http://underwaterintervention.com/2012/presentations/%s.html):]],
        pres.id))

      do
        local list = {}
        if not present(pres.fulltitle) then
          insert(list,[[- Full Title: A one-line description of your presentation, longer than the short title that we already have.]])
        end
        if not present(pres.abstract) then
          insert(list,[[- Abstract: An in-depth description of your presentation, from 100 to 200 words.]])
        end
        if not present(pres.image) then
          insert(list,[[- Presentation Image: An image to accompany the abstract (not to be confused with the personal presenter headshot that accompanies your bio).]])
        end
        insert(body,concat(list,'\n'))
      end

      insert(body, [==[
It is important to get me this information for two reasons:

1. It is will help attendees at the technical sessions decide whether to attend your session, or one that is in a competing time slot.
2. After this week we will compile the hard-copy on-site program. Materials not received by then will not be in the program.

 Examples of sessions with complete information (so you can see how this is used):

- http://underwaterintervention.com/2012/presentations/missing-cave-diver-search.html
- http://underwaterintervention.com/2012/presentations/uscg-review-of-narco-subs.html
- http://underwaterintervention.com/2012/presentations/new-autonomous-survey-capabilities-for-rovs.html]==])
    end

    if not site_complete(pres) and not pres.materials then
      insert(body,"ALSO")
    end

    if not pres.materials then
      insert(body,[==[
We need your presentation materials. For most people this is a PowerPoint presentation file (.ppt), a Portable Document Format (.pdf), or a word document (.doc). These must be sent to brian.luzzi@videoray.com. If he does not receive them by the end of the year, they will not make it in the proceedings DVD, and your slot may be cancelled or moved.]==])
    end

    insert(body,[==[
If you think there is an error in the missing data record, please e-mail me immediately.

Thanks for your assistance in these matters.

Stuart P. Bentley, Underwater Intervention 2012 Technical Program Webmaster
]==])

    -- Stash data
    insert(messages,{headers = headers, body = table.concat(body,'\n\n')})
    insert(rcpts,rcpt)
  end
end

-- Output messages

---- Mail server data
local server = "sub4.mail.dreamhost.com"
local port = 587
local user = "test@testtrack4.com"
local password

print(string.format("%i messages ready to send",#messages))
io.write"Enter mail password (or leave blank to test run messages): "
password = io.read'*l'
if password ~= "" then
  for i=84, #messages do
    assert(send{
      from = master_mail,
      rcpt = rcpts[i],
      source = smtp.message(messages[i]),
      server = server,
      port = port,
      user = user,
      password = password
    })
    print(i)
  end
else
  for i=1, #messages do
    local source = smtp.message(messages[i])
    local content = source()
    while content do
      io.write(content)
      content = source()
    end
    print"\n---\n"
  end
end
