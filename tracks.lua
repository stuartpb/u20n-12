local div =  require "tracks.div"
local edu =  require "tracks.edu"
local muv =  require "tracks.muv"
local oe =   require "tracks.oe"
local si =   require "tracks.si"
local srov = require "tracks.srov"
local wrov = require "tracks.wrov"
--wrex are not included since that track is in the air atm

local eachtrack = {div,edu,muv,oe,si,srov,wrov}

local all = {}

for ti=1,#eachtrack do
  local track = eachtrack[ti]
  for pi=1,#track do
    all[#all+1]=track[pi]
  end
end

return {
  div = div,
  edu = edu,
  muv = muv,
  oe = oe,
  si = si,
  srov = srov,
  wrov = wrov,
  all = all,
  names = {"div","edu","muv","oe","si","srov","wrov"}
}
