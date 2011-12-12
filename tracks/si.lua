local shared = require "shared"
local maketrack = require "maketrack"
return maketrack("si", {

  {
    title = "Inertial NAV system for small ROV",
    fulltitle = "Using an inertial navigation system for small and micro ROV",
    lead = {
      first = "Maurizio",
      last = "Banfi",
      org = "Studio Ing. Banfi SAS",
      email = "mauriziobanfi@tiscali.it",
    },
    abstract = [==[
In many applications, acoustic navigation systems (such as the commonly used USBL) cannot provide accurate positioning information. Because of multiple sound reflections, for instance, acoustic systems have poor performances in shallow water or highly cluttered areas, such as in a port environment, close to piers and various underwater structures. The users of large and very complex ROV's solve the above problem by outfitting their vehicles with Inertial Navigation Systems (INS) and Doppler Velocity Logs (DVL) that extend the use of their equipment much beyond the capabilities of acoustic systems. Unfortunately, though, this kind of equipment is not available to the users of small ROV, because of size, power demand and price reasons.

The ROV & Diver TRACKER  is a complete navigation system that includes a Fiber Optic Gyro (FOG), a DVL and multiple support sensor, suitable for installation into small and micro ROV's. This paper describes the system and the results obtained onboard a VideoRay micro ROV, where the TRACKER was integrated with both the vehicle and a BlueView SONAR.
]==],
    bio = [==[
Graduated at the Italian Naval Accademy, after a master degree in electronic engineering and a 16 years long career as Italian Navy Officer, Maurizio Banfi funded Studio Ing. Banfi SAS, that developed the "ROV & Diver TRACKER", now commercially available.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 8, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Through-the-sensor Multibeam control of ROVs",
    fulltitle = "Multibeam Imaging Sonar-Track, through-the-sensor control for microROVs",
    lead = {
      first = "Ioseba",
      last = "Tena",
      org = "SeeByte",
      email = "ioseba.tena@seebyte.com",
    },
    abstract = [==[
Multibeam imaging sonars have been available since the early nineties and have served well as a tool to improve situational awareness. Operators can observe targets at distances of tens to hundreds of yards and use the information to navigate underwater vehicles and monitor important subsea regions. The original systems were significant in size and weight and required large electronic pods to beam form and process the raw data. But today’s multibeam imaging sonars are of a size suitable for microROV operation, so much so that they have become a common payload option for many operators. In tandem software solutions enabling close control of unmanned systems using through-the-sensor servoing techniques have evolved to a level of maturity suitable for commercial exploitation. The bringing together of this technology with the microROV will enable a new level of user control to the operational users. A common task such as flying to a target can be a difficult undertaking when faced with currents and tether effects, when time is at a premium this can be frustrating and negatively impact the overall mission needs. This proposed technology enables the microROV to keep station relative to an object or structure identified in the sonar data. The ROV can then maneuver relative to this object and the pilot need only provide simple point-and-click commands on the sonar screen. This talk will illustrate some early results on early prototype work.
]==],
    bio = shared.bios.tena,
    start = { day = 25, month = 1, year = 2012,
      hour = 9, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Mapping, Integration of Inertial and Multibeam on ROVs",
    fulltitle = "",
    lead = {
      first = "Ian",
      last = "Florence",
      org = "Kongsberg Maritime Ltd.",
      email = "ian.florence@kongsberg.com",
    },
    abstract = [==[
The concept of ROV subsea inertial navigation and ROV mounted Multibeam has been around for a number of years. In a recent offshore project the two systems were tightly integrated so the inertial system provided Heading, pitch, roll and position directly to the Multibeam. The paper discusses the integration processes – good parts and bad. In the results errors in the system are shown and how they were resolved. Also demonstrates the 2 way LBL and inertial for ROV navigation. The paper gives real project result from the Gulf of Mexico with some spectacular images.
Ian Florence
Subsea Construction Manager
]==],
    bio = [==[
Ian Florence has worked in the offshore industry since 1981, starting in the seismic industry he moved to OHP Oilfield hydrographic Projects) in 1984 where he was a survey engineer and online surveyor. From 1986 – 1996 he was a contract engineer, surveyor and party chief for all on the major – and a lot of minor survey contactors. He then became a project surveyor for Subsea 7 for a West of Shetland field for 2 years. He joined Kongsberg Maritime where he specializes in acoustic special projects.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 9, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Description of Solutions Using Sonar Imaging",
    fulltitle = "Description of Equipment and Sonar Tools Available for Underwater Inspection and Construction Monitoring",
    lead = {
      first = "Mark",
      last = "Klein",
      org = "S.T. Hudson Engineers, Inc",
      email = "mklein@sthe.com",
    },
    abstract = [==[
Show Scanning, Imaging, and Multi Beam Sonar uses, describe the differences and reasons for using each.
]==],
    bio = [==[

]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Scanning Sonar Surveys",
    fulltitle = "Using the MS 1000 scanning sonar for creating baseline surveys on large scale projects",
    lead = {
      first = "Brian",
      last = "Abbott",
      org = "Nautilus Marine Group International, LLC",
      email = "abbott@nautilusmarinegroup.net",
    },
    abstract = [==[
Using the MS 1000 scanning sonar for creating baseline surveys on large scale projects. These large scale projects can be but not limited to bridges, dams, ports & harbors and canal systems.  Creating these baseline surveys allows for better engineering assessment of structures and site conditions for homeland security issues.  Changing the orientation of the sonar allows one to image in different plans and obtain information necessary to build a three dimensional structure of the site.  All of this information can be tied into a GPSRTK system allowing for one to reacquire information at a later date and time.
]==],
    bio = [==[

]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Realizing True Benefits of Real-Time 3D Sonar",
    fulltitle = "Realizing the True Benefits of Real-Time 3D Imaging Sonar Technology",
    lead = {
      first = "Blair",
      last = "Cunningham",
      org = "Coda Octopus Group, Inc",
      email = "blair.cunningham@codaoctopus.com",
    },
    abstract = [==[
This paper discusses some of the unique benefits of the use of real-time 3D imaging sonar technology as a multi-discipline sensor. This technology can provide exceptional data in real-time monitoring applications as well as mapping and survey applications, saving considerable money in complex and time sensitive operations. With the benefit of fully geo-referenced 3D data sets for every ping, the use of CGI (Computer Generated Imagery) is possible, allowing a fully immersive "augmented reality" environment for operators, engineers and clients all in real-time. In addition to the real-time monitoring benefits, 3D imaging sonar provides huge data redundancy which is available for in-line processing algorithms to improve accuracy, provide automatic noise and clutter removal, and produce incredible image detail over what could be normally achieved by current 2D and multibeam sonar technology.
]==],
    bio = [==[

]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Cathodic Protection Probes - Diver and ROV",
    fulltitle = "Cathodic Protection Probes for Diver & ROV Interface - What's New?",
    lead = {
      first = "Jim",
      last = "Britton",
      org = "Deepwater Corrosion Services Inc.",
      email = "jbritton@stoprust.com",
    },
    abstract = [==[
The presentation will review types of instrument currently avaialble, their application and limitations.  Practical tips to ensure correct equipment function and common pitfalls which lead to inaccuarate surveys will be discussed.  The talk will present various case histories on diver surveys, ROV pipeline surveys and general topside cathodic protections surveys. Various probe types will be discussed along with emerging technologies for AUV surveys.
]==],
    bio = [==[
Jim Britton - As founder and CEO of Deepwater Corrosion services Inc in 1986 he has been responsible for the development of currently used CP measurement systems manufactured by his company.  He has worked offshore on thousands of CP surveys both diver / ROV and topside deployed.  The Polatrak brand is currently the leading leader in this type of equipment.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Case Study of Remote Sensing in Construction",
    fulltitle = "A review of several imaging methods used in a recent construction project to monitor dredging, diving, and progress of a diffuser installation in black water.",
    lead = {
      first = "Mark",
      last = "Klein",
      org = "S.T. Hudson Engineersin Inc",
      email = "mklein@sthe.com",
    },
    abstract = [==[
To follow:

Scanning Sonar
Side scan sonar
hydrographic surveying
multibeam imaging sonar
Tri Tech
Kongsberg
]==],
    bio = [==[
to follow, use same from last year.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Early leak detection",
    fulltitle = "Hydrocarbon Sniffers In Mobile Subsea Flowline Monitoring - A Field Report",
    lead = {
      first = "Daniel",
      last = "Esser",
      org = "Contros Systems & Solutions GmbH",
      email = "d.esser@contros.eu",
    },
    abstract = [==[
Exploration and production activities for oil and gas are steadily increasing in subsea areas. Various methods exist to detect and localize subsea oil and gas emissions but there is still a lack of understanding the processes of subsea leakages, and technologies to detect and localize emissions from subsea installations at an early stage have to be improved. Detecting and localizing subsea oil and gas emissions means dealing with warm multiphase outflow consisting of oil phase, gas bubbles and dissolved gas (mainly Methane), formation water, mixing with cold seawater, and sometimes even the formation of additional solid gas hydrate phases. Recent field observations and hydrodynamic models of Methane-rich fluid transport at natural seeping sites indicate the distinct behavior of Methane-dominated fluids in seawater.
A successful leak detection strategy must focus on the different physicochemical fluid characteristics of Methane as a tracer for subsea oil and gas emissions in general. The feasibility of Hydrocarbon Sniffers for the detection, localization and subsequent validation of subsea oil and gas emissions has been proven in several ROV- and AUV-borne subsea flowline surveys from 2008 until today. Field experience and latest results will be presented for different environmental backgrounds, reaching from arctic areas to extreme shallow waters.
]==],
    bio = [==[
Daniel Esser is Managing Director and co-founder of CONTROS Systems & Solutions GmbH, a company that provides state-of-the-art multi-parameter sensor systems and services for both scientific and commercial hydrocarbon and CO2 leak detection and environmental monitoring projects worldwide. After working as a radio operator on a German Research Submarine, Daniel graduated from the University of North London with a Master in International Business. Since then he was working as a project manager, consultant and as a marketing manager for various international companies in the scientific, as well as in the industrial environment. In 2007, CONTROS has successfully launched the first fully integrated Mobile Leak Detection System for the detection, localization and qualification of early stage subsea oil and gas emissions.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Generating 3D Models from Underwater Video",
    fulltitle = "Generating Photorealistic 3D Models from Underwater Inspection Video",
    lead = {
      first = "Neil",
      last = "Cavan",
      org = "2G Robotics Inc.",
      email = "ncavan@2grobotics.com",
    },
    cos = {
      {
        first = "Jason",
        last = "Gillham",
        org = "2G Robotics Inc.",
        email = "jgillham@2grobotics.com",
      },
    },
    abstract = [==[
Video inspection by a remotely operated vehicle (ROV) is simple, cost effective to deploy, and widely used. However, this inspection method suffers from the limitations of underwater visibility. Since it is only possible to observe a small section of an underwater asset at any one time, long videos are necessary to fully inspect large assets. The information provided by inspection videos is valuable, but it can be time-consuming to assess the state of an underwater asset based on many hours of video.

This presentation demonstrates a software tool developed by 2G Robotics for generating photorealistic 3D models from underwater video. Computer identified feature points in the video are automatically tracked, and are then reconstructed as a digital 3D point cloud of the asset observed in the video. Once the point cloud has been obtained, it can be surfaced and coloured using image data from the video to create a photorealistic 3D model of the entire asset. The algorithms can work with video from any camera, and need only the video itself as input: no special calibration object or motion sequence is used. Since no change to the inspection workflow is required, this technology can create a 3D model from archived inspection video.

Using a photorealistic 3D model as the starting point for underwater asset inspection allows the state of the entire asset to be understood more quickly and intuitively compared to using video alone.  This technology has the potential to alter the post inspection work-flow, saving time and providing greater asset understanding, resulting in reduced project costs and risks.
]==],
    bio = [==[

]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "HD 3D photogrammetric modeling applications",
    fulltitle = "High definition 3D photogrammetric modeling offers unprecedented levels of geometric accuracy for post-incident analysis and repair of damage to subsea components",
    lead = {
      first = "Anthony",
      last = "Hall",
      org = "Welaptega Marine Limited",
      email = "a.hall@welaptega.com",
    },
    cos = {
      {
        first = "Marie",
        last = "McCormick",
        org = "www.Welaptega.com",
        email = "m.mccormick@welaptega.com",
      },
      {
        first = "Alastair",
        last = "Trower",
        org = "Welaptega Marine Limited",
        email = "a.trower@welaptega.com",
      },
    },
    abstract = [==[
The presentation will encompass a step through the basics of digital 3D photogrammetric modeling hardware and techniques, followed by a series of case studies that highlight the flexibility and value of the technology to provide highly accurate geometric information of damaged subsea components that can then be used to conduct structural analyses (e.g. FEAs). design tooling, and and verify design repairs. Case studies will include but not be limited to an impact-damaged well head, a deepwater pipeline damaged by anchor impacts, and heavily corroded mooring components. The presentation will finish with some discussion of the opportunities by this technology in combination with advances in metallic and polymer 3D printing technologies
]==],
    bio = [==[
Anthony Hall is the founder and CEO of Welaptega Marine Limited. His experience with digital image analysis goes back to 1988 and his MSc field work in the measurement of marine growth, first in aquaculture and then offshore platforms. Since establishing Welaptega in 1992 he has kept Welaptega at the leading edge of underwater 3D video and image measurement in support of subsea operations in the offshore industry.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "222",
  },

})
