local maketrack = require "maketrack"
return maketrack("wrex", {
  {
    title = "Ram Bala",
    fulltitle = "A Comprehensive Procedure for Survey and Artifact Identification Using Iver2 - A Case Study",
    lead = {
      first = "Ramprasad",
      last = "Balasubramanian",
      org = "University of Massachusetts Dartmouth",
      email = "r.bala@umassd.edu",
    },
    abstract = [==[
In this talk we present a comprehensive survey procedure developed in-house and deployed on a recent survey mission in Mount Hope Bay to locate two ship wreckages using an Iver2. The vehicles were equipped with a Klein Side Scan Sonar, an Imagenex Delta-T multi-beam sensor and a Sontec Doppler Velocity Log (DVL) sensor. We present details on the in water compass calibration procedure that was developed using an Extended Kalman Filtering approach.   In addition, details on mission specification, localization including slant range correction and logging of multi-beam and side-scan sonar data are also presented. The multi-beam and side-scan data are prost-processed for automatic as well as manual artifact identification. Some sample results are also presented. We envision this comprehensive approach to be adopted for  multiple applications such as SLAM, hydrographic survey and underwater inspection missions.
]==],
    bio = [==[
Dr. Balasubramanian is an Associate Professor of Computer Science in the Department of Computer and Information Science at the University Of Massachusetts Dartmouth (UMass Dartmouth). He works with the Advanced Technology Manufacturing Center (ATMC) of UMass Dartmouth as well as OceanServer Technologies, Fall River, MA. His research interests include multi-sensor data fusion, multi-auv collaboration and coordination. He continues to work on several projects related to the US Navy and the Office of Naval Research.
]==],
    track = "Exploration, Research, and Presentations on Shipwrecks",
    start = { day = 24, month = 1, year = 2012, --TODO: DATE
      hour = 8, min = 30}, --TODO: TIME
    length = 1800, --TODO: LENGTH
    room = "221", --TODO: ROOM
  },

  {
    title = "Inside the Lusitania",
    fulltitle = "Inside the Wreck of the Lusitania",
    lead = {
      first = "Brian",
      last = "Luzzi",
      org = "VideoRay LLC",
      email = "brian.luzzi@videoray.com",
    },
    cos = {
      {
        first = "Steve",
        last = "Van Meter",
        org = "Van Meter Consulting",
        email = "svm123@mindspring.com",
      },
    },
    abstract = [==[
Documenting the 2011 National Geographic project where VideoRay, the leading manufacturer of Inspection Class Remotely Operated Vehicles, was invited to explore both interior and exterior sections of the famous World War I shipwreck off the coast of Ireland.
]==],
    bio = [==[

]==],
    track = "Exploration, Research, and Presentations on Shipwrecks",
    start = { day = 24, month = 1, year = 2012, --TODO: DATE
      hour = 8, min = 30}, --TODO: TIME
    length = 1800, --TODO: LENGTH
    room = "221", --TODO: ROOM
  },
})
