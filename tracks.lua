--encoding: utf-8

local string = require 'string'
local format = string.format
local gsub = string.gsub
local lower = string.lower
local table = require 'table'
local sort = table.sort
local os = require 'os'
local time = os.time

local idset = {}

local function pressort(m,n)
  local mstart,nstart = time(m.start), time(n.start)

  if mstart == nstart then
    return m.room < n.room
  else
    return mstart < nstart
  end
end

local names = {"oe","wrov","srov","muv","edu","div","si","wrex"}
local all = {}

local tracks = {
  names = names,
  all = all,
  titles = {
    div = "Commercial Diving",
    edu = "Education and Academia",
    muv = "Manned Underwater Vehicles",
    oe = "Ocean Engineering",
    si = "Sensors and Instruments",
    srov = "Small ROVs",
    wrex = "Shipwrecks",
    wrov = "Work-Class ROVs",
  },
  chairs = {
    div = "Steve Struble",
    edu = "Jill Zande",
    muv = "Will Kohnen",
    oe = "Steve Barrow",
    si = "Mike Chapman",
    srov = "Rachael Miller",
    wrex = "Rachael Miller",
    wrov = "Steve Barrow",
  },
}

local function maketrack(track, ps)
  for i=1, #ps do
    ps[i].track = track
    local id = ps[i].title
    id = gsub(id,"%u",lower)
    id = gsub(id,"&","and")
    id = gsub(id,"[ /]","-")
    id = gsub(id,"%-+","-")
    id = gsub(id,"[^%w%-]","")
    if idset[id] then
      error("redundant id: "..id)
    else
      idset[id] = true
    end
    ps[i].id = id
    all[#all+1] = ps[i]
  end

  sort(ps,pressort)

  tracks[track] = ps
end
maketrack("oe", { --Ocean Engineering

  {
    title = "Navy Unmanned Systems Experimentation Lab",
    fulltitle = "Bringing Technology to Customers & Markets Faster Through Experimentation",
    presenters = { "John Klose", },
    abstract = [==[
Technical innovations are occurring at an ever-increasing rate and create new challenges for both government and industry engineers to take advantage and transition new technology to meet their operational and business needs. Finding rapid technology transition and product development processes that can keep pace with technological innovations is key to bringing the best technology to our customers. To this end, the Naval Surface Warfare Center's Panama City Division has created a special laboratory for unmanned systems experimentation, prototyping and technology transition that is seeking to rapidly develop innovative applications of new and existing technology in modular forms in order to bring new operational concepts to life in much shorter timeframes than normal system development processes.

This presentation will cover the initial efforts of this laboratory to develop new innovative Operational Concepts for Explosive Ordnance Disposal forces, Anti-Terrorism/Force Protection (AT/FP) forces, and Maritime Critical Infrastructure Protection using modular, Micro Unmanned Surface Vessel (USV) technology. The presentation will focus on processes for creating modular hardware and software architectures, conducting important experiments in the operational environment, and finding or developing new technologies that open up new possibilities for innovative changes to operational concepts or market segments.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Plastic Parts for Undersea Applications",
    fulltitle = "Plastic Parts for Difficult Undersea Applications",
    presenters = { "Robert Underwood", },
    abstract = [==[
Metal parts hate water, especially salt water. Add the effects of depth pressure and the rough operating conditions often experienced in the field and the marine parts designer faces unique and difficult challenges.  Frequently plastic is the answer.  Advances in plastic materials and manufacturing processes make that increasingly the case.  Plastic neither rusts nor corrodes, can be as tough as metal, is lightweight, has no magnetic signature, and can be formed into a wide variety of shapes.  Plastic parts can be designed to withstand extreme depth pressures, to minimize or eliminate leak paths, not to outgas, and for specific underwater signal reflection, transmission, or attenuation characteristics.  Plastic can be used to encapsulate delicate electronics, GPS modules, antennae, and power connectors.  This presentation provides an overview of the present state of the art in plastics materials and manufacturing processes for undersea applications and highlights particularly difficult missions where plastic parts have been critical to success.  Highlighted missions include:

- AUVs discovering Air France 447 wreckage 2 ½ miles down in the Atlantic
- Combat divers mapping a harbor minefield
- Navy SEALS conducting  underwater special ops
- In-situ instruments monitoring ocean conditions for weather forecasting and climate modeling
- ROVs working on the floor of the Gulf of Mexico

For over thirty years, Polymer Corporation has been a leading producer of high-performance plastic parts and assemblies for undersea use.
]==],
    image = "oe2presimg.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Environmentally Safe Lubricants",
    fulltitle = "Innovations in Biodegradable, Environmentally Safe Lubricants",
    presenters = { "Mark Miller", },
    abstract = [==[
There is increasing pressure from government, industry and the public to protect the environment. Many underwater projects require the use of environmentally preferable, biodegradable products to bid for contracts. While initially more expensive, these fluids can save money and time when properly utilized. They can improve equipment performance, while protecting the user from costly fines and clean up in the event of a leak or spill.

Environmentally safe lubricants will be presented from a 'hands-on' perspective. The paper will review spills and response regulations. It will also cover major organizational and commercial initiatives that are the major driving forces behind their use.

The paper will explore the types of biodegradable products and how they interact with underwater equipment. Included will be their compatibility with hydraulics, pumps, sealing materials, hoses, and other important components. Water infiltration, high pressure, wide temperature range usage as well as ways to manage these challenges will also be discussed.

There will be a discussion of specific maintenance practices that are required to maintain long useful life of these fluids as well as long equipment life. This will include real world experience gained by several successful long term field demonstrations with commercial and military divers and ROVs. Data that will be used covers oil analysis, equipment inspections, operating conditions, and overall cost savings.
]==],
    image = "lubes.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "High-level Organization of UUVs",
    fulltitle = "High-level Organization of Unmanned Underwater Systems",
    presenters = { "Peter Sapaty", "Bob Nugent", },
    abstract = [==[
The world ocean remains the last unexplored space on earth. Underwater robots, when massively deployed, can bring huge benefit. Their use, however, is much more complicated than aerial or ground ones, due to communication problems. That is why enhancing intelligence of individual robots for increasing autonomy and reducing communications is the primary goal. In this paper we are offering a high-level distributed control technology that can dynamically integrate any underwater units into operable teams with a sort of global consciousness and pursuing global goals. It is based on universal knowledge processing and control modules easily installed in units and communicating with each other via any available channels. Ad hoc networks of these modules spatially, in parallel, interpret global mission descriptions in a special high-level Distributed Scenario Language (DSL) reflecting top semantics of what to be done in a distributed maritime space, while leaving system structuring and task-oriented C2 entirely to automatic language interpretation.  Extremely  short, created on the fly, DSL scenarios are injected into the robotic swarm from any unit, subsequently covering the whole system and setting the needed behavior, with communications between vehicles much shorter than with any other approaches (thus suitable for low speed channels). Implementation details of the technology will be revealed, and exemplary scenarios in DSL related to underwater environments, like collective distributed search of a large territory for specific objects or patrolling coastline will be shown. Cooperation with surface and aerial vehicles, also with higher-level manned systems within the same organizational model, are discussed too.
]==],
    image = "uuv-org.png",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Environmental Monitoring with AUVs",
    fulltitle = "Environmental Monitoring with AUVs - New sensors and techniques for detection and assessment of hydrocarbons in deep water",
    presenters = { "Chris Hancock", },
    abstract = [==[
AUVs are ideal platforms for carrying an array of sensors for monitoring the environment around offshore installations. Combined with subsea docking technology, AUVs equipped with environmental sensors provide a persistent early warning capability against oil and gas leaks from drilling operations and pipelines, or other environmental contaminants. Acoustics is emerging as an alternative method of indirectly (or directly) detecting hydrocarbons in the water column. Kongsberg sonars are at the forefront of this developing technology which has also been adapted for AUV application. Its fisheries echo sounders have been used extensively in recent years for detecting and tracking oil plumes resulting from subsea leaks.

Kongsberg's AUVs combine the latest in sonar technology, hydrocarbon sensors ("sniffers") and other chemical sensors to provide a full suite of environmental sensors on a long endurance, autonomous and low-logistics subsea platform. Our host of in-house AUV technologies enables a reliable and capable environmental monitoring and warning tool and includes subsea docking, through-moonpool launch and recovery, platform hovering and adaptive behaviors. Kongsberg AUVs are also fully modular in design, allowing operators to configure a vehicle to suit the task at hand.

This paper provides a technology update on Kongsberg's AUVs for environmental monitoring and presents recent test results for key technologies, including detecting hydrocarbons with acoustical sensors.
]==],
    image = "env-mon.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Data Loggers For Surface Or Subsea",
    fulltitle = "How to aid your operations in reducing failures",
    presenters = { "Richard Davidson", "Eric Milne", },
    abstract = [==[
The Surface or Subsea Data Logger is intended to give operators the ability to monitor key pressures and provide information in real-time.

The Surface Data Logger is specifically designed to capture pressure (P) vs. a set time (T) on a chart recorder or data-logger at high resolution. The test equipment is connected between a hydraulic supply and the equipment to be tested. While operating the equipment, pressure vs. time is recorded on a suitably scaled chart recorder or data-logger. The newly captured chart is compared against known good data. The performance curves are then interpreted to determine if the equipment is operating within an acceptable range. With the Data Logger information, one can determine if the equipment is operating as designed.

The Subsea Data Logger, equipment to record pressures and other data on the BOP Stack while subsea is independent of existing control pods and the data is accessible on the surface. The Subsea Data Logger units can be daisy-chained and placed on the Lower Marine Riser Package (LMRP) and/or lower stack. The Data Logger's battery power source is good for long durations without a recharge. These batteries can be recharged subsea via ROV.  The data is multi-plexed onto a single mode fiber. The on board computer records data from up to 8 analog channels concurrently at a high data rate (up to 250,000 X 8 samples per second). ROV interface is provided for separate communications path to the unit.

Typical use for the Data Logger for Surface and/or Subsea:

- Factory acceptance testing of RAM BOPs, annulars, connectors, valves, BOP stacks and trees
- On-hire acceptance testing of production and offshore drilling rigs
- Pre-deployment testing of trees and BOP stacks following repairs and maintenance
- Before and after maintenance
- To justify an extended maintenance period
]==],
    image = "loggers.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Advancements in Pipeline Inspection with AUVs",
    fulltitle = "Advancements in Pipeline Inspection with AUVs - results from field trials of the HUGIN AUV and the HISAS Synthetic Aperture Sonar",
    presenters = { "Chris Hancock", },
    abstract = [==[
HUGIN and REMUS AUVs use advanced feature recognition algorithms, developed originally for mine-detection, to track subsea pipelines directly in sonar data in real time. This, combined with sensors such as multibeam echo sounder and high-resolution still camera, enables inspection of pipelines at a considerably higher speed, and thus lower cost, than traditional methods, while producing higher quality data. Kongsberg Maritime’s unique way of performing pipeline inspection with AUV involves two fully-autonomous passes along a pipeline. The first pass is run off to the side, and by using either high-resolution interferometric synthetic aperture sonar (HISAS) or conventional side scan sonar (SSS), a wide swath around the pipeline is mapped as the AUV automatically tracks the pipeline directly from the sonar data. This way, the pipeline’s actual position is determined and knowledge is gained about surrounding threats like anchors and trawling activity in a wide swath of up more than 200 meters.

The second pass is run directly over the pipeline at a low altitude, and accurate inspection data is collected with multibeam echo sounder and camera. By using high-resolution still camera and mosaic techniques, one avoids the massive over-sampling resulting from use of video-cameras, which makes data management easier. The still camera pictures are automatically and accurately geo-referenced in the AUV, removing the need for the time-consuming task of matching up video with ROV positioning data. Another significant cost reduction stems from the elimination of the support vessel normally used in traditional pipeline inspection with ROV.

In cases where a priori data about the pipeline’s position is poor, and where the pipeline may be partially buried, this concept exploits the wide swath afforded by the HISAS by increasing tracking robustness and reducing the need for lateral search patterns to reacquire partially buried pipelines.

In the fall of 2011, Kongsberg Maritime has integrated automatic tracking of pipelines directly from the multibeam echo sounder data, thereby adding an important capability in the toolbox available to the AUV operator. In cases where it is appropriate, this can remove the need for the first survey pass, and gives the operator more flexibility in how to design the inspection mission. This paper highlights recent test results from industry-funded technology demonstration trials conducted along pipelines in the North Sea.
]==],
    image = "pipeline.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Fiber Optics and ROVs",
    fulltitle = "Practical Considerations for Increased Performance",
    presenters = { "Brennan Phillips", },
    abstract = [==[
The Institute for Exploration is a non-profit oceanographic research organization that operates a 4000-meter work-class ROV. Like many deep diving vehicles, the system utilizes fiber optics to transmit vehicle telemetry to the surface. Increased demand for fiber optic performance and capability has led our engineering team to re-examine current technology and maintenance equipment. This presentation will review our application of fiber optics to the ROV, and present common problems and solutions that should prove useful to anyone utilizing fiber optics in their operations.
]==],
    image = "nautilus-1.jpg",
    materials = "nautilus.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "217",
  },

})
maketrack("wrov", { --Work-Class ROVs

  {
    title = "Hydraulic Fluid Performance at Depth",
    fulltitle = "The effect of Depth and Pressure on Hydraulic and Dielectric Fluids",
    presenters = { "Mark Miller", },
    abstract = [==[
Offshore drilling has been in existence a little over 100 years. Drilling and production depths have accelerated greatly over the past several years and depths over 3000 meters (10,000 feet) are not uncommon.
This move into deeper and deeper waters has presented many technical and environmental challenges for ROVs and related equipment.
One of these challenges is that at the depths and significantly increased pressures that ROVs can see, the physical characteristics of hydraulic and dielectric fluids change. This paper explores the various factors that effect fluid characteristics including; pressure, temperature, viscosity, and type of fluid. It compares and contracts petroleum oils, environmentally safe oils and synthetics. It also includes a comparison of these fluids at atmospheric conditions to isolate any changes solely due to fluid type.
]==],
    image = "lubes.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Certification of ROV Personnel",
    fulltitle = "A New Competency Certification Scheme for ROV Operating Personnel",
    presenters = { "David Parkes", },
    abstract = [==[
Since 2003, the Diver Certification Board of Canada (DCBC) has offered certification to commercial diving personnel who can demonstrate that they have sufficient training and experience to enable them to meet the competency requirements of the appropriate section of the Canadian Standards Association (CSA) Competency Standard for Diving Operations (CSA Standard Z275.4). The DCBC also accredits commercial diver training organizations which train to the competency levels of Z275.4.

For the past two years the DCBC has been working with schools, industry and other organisations to develop a certification scheme for ROV operating personnel.

The purpose of certifying the competence of ROV personnel (Pilot/Technicians and Supervisors) is to help ensure the safety of personnel, equipment, assets and the environment and includes the protection of divers who often work in the same underwater work site as a ROV.

In general the levels of certification and the competencies required to obtain certification are designed to meet the requirements of ROV Contractors and ROV end users.
]==],
    materials = "parkes-rov-cert.ppt",
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Hard rock coring on steep terrain",
    fulltitle = "Hard-Rock Coring at Steep Terrain Seafloor with a Flipper-Type Crawler ROV",
    presenters = { "Tomoya Inoue", "Akira Asada", "Tokuihiro Katsui", "Masashi Mochizuki", "Hiroyuki Osawa", "Ken Takagi", },
    abstract = [==[
Coring at flat even seafloor have been conducted. However, there are of slight difficulty for a conventional ROV to conduct at steep or irregular terrain seafloor because the ROV needs a function or mechanism to keep its attitude tenaciously being subjected to a reaction force.

One of advantageous ROVs for its operation is a flipper type crawler ROV which JAMSTEC has developed. Flipper type crawler system which can rotate a crawler itself provides not only an advantage mobility but also an high performance to hold on.

The authors conducted the running experiment of the flipper type crawler ROVs on sand, cobble, or rock reef seafloor. The authors also conducted an initial hard-rock coring experiment at steep and irregular terrain seafloor off Okinawa.

This paper presents the advantageous mobility of the flipper type crawler ROV which has been confirmed at sea trial and the possibility of hard-rock coring at steep or irregular terrain seafloor with it.
]==],
    image = "coring.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Repair in less than 60 Minutes",
    fulltitle = "ROV Repair and Return to Work in 60 Minutes or Less",
    presenters = { "Andy Porterfield", },
    abstract = [==[
In response to the complexity of the missions they are asked to perform, ROVs continue to become more powerful and complicated in design.  When a component fails, repair tasks can take multiple hours and have a significant economic impact on ROV operators and their customers.  In all instances of major ROV subsystem repairs, the component that needs to be replaced or repaired is located in the second or third tier of the design; gaining access to and repairing the failed component can require multiple hours of work.  For example, a HPU replacement on a conventional ROV can typically take 8 hours.  With an average pipelay vessel day rate of $180,000, the vessel downtime cost of such a task can easily mount to $60,000 or more.

An assessment of this issue showed that it was not feasible to achieve step-change improvements in repair tasks without revisiting the overall system design philosophy and placing a significant focus on the primary challenges of time to repair and ability to perform the repair correctly the first time.  As a result, Schilling Robotics has invested in developing ROV technology that can be repaired within 60 minutes, providing a significant increase in ROV system uptime and customer profitability.

This presentation will review features important in reducing downtime including: modular subsystem design, component accessibility, ease of replacement, and removal of the potential for installation errors during the maintenance process.  Major ROV subsystem examples will be discussed, including the HPU and the electrical power distribution system.
]==],
    image = "rov-rts.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Dredging Using Advanced Techniques",
    fulltitle = "ROV Dredging Using Advanced Techniques",
    presenters = { "Hans Kros", },
    abstract = [==[
Trends in underwater salvage and excavation markets indicate improved access
to remote areas and complex dredging methods are more available to subsea
operators than previously.

Deepwater and ultra-deepwater decommissioning and salvage efforts have
forged alternatives to standard vertical access and mass excavation
techniques. For structural removal, horizontal penetration is possible
beyond normal vertical dredge pumping. Hydraulically driven dredge pumps
placed on the sea bed and connected with long-length hydraulic hoses deliver
power from host vessels on the surface.

Advanced imaging equipment can penetrate fixed structures in zero visibility
conditions. This allows more precise ROV manipulation of excavation tooling.
Combined with real-time ROV positioning, these imaging tools enable the ROV
to navigate with"acoustic" cameras.

Modern subsea field developments have tighter templates with more densely
located subsea assets. When excavating these templates, horizontal
transportation of the spoils prevents other asset areas from potential
burial.

Drill cuttings often deposit around wellheads during drilling operations.
ROVs equipped with dredging hardware can disperse the drill cuttings to
desirable areas in the adjacent vicinity, keeping wellheads clear and even
with the natural sea bottom.
]==],
    image = "dredge.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Integrating Equipment to Work Class ROVs",
    fulltitle = "Considerations When Integrating Equipment or Tooling to a Work Class ROV",
    presenters = { "Steve Barrow", },
    abstract = [==[
Remotely Operated Vehicles (ROVs) serve as the primary platform for a variety of operations in deep water. ROVs must often be reconfigured with different tools or sensors to accomplish these missions. However, integrating new sensors, equipment or tooling to a work-class ROV can be a difficult and time consuming experience.

The lack of standardization between different models of ROVs also makes preplanning the equipment integration difficult. Taking the time to understand and address the basic considerations and the options available will help to prevent last minute emergencies.

This presentation will provide an overview of the primary concerns when integrating new equipment. Considerations include the size and weight of the equipment, ROV-specific mechanical attachment points, hydraulic connections, and electrical power and communication requirements.
]==],
    image = "sim-services.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Cutting Tools",
    fulltitle = "ROV deployed tools for cutting ropes, umbilicals, cables and pipelines",
    presenters = { "Keith Elliot", },
    abstract = [==[
ROV deployed cutting tools are an important part of the subsea toolbox, and are essential equipment for the installation  and decommissioning of subsea tiebacks and other subsea installations.

An overview of the available technologies will be discussed, with particular focus given to the correct selection of the tool to suit the application.  Guidance will be given regarding the safe deployment, use, retrieval and storage of subsea cutting tools, with particular focus on those deployed by ROV to deep water.

Improvements in the strength of wire rope technology and the increasing use of aramid based soft lines pose particular challenges to current cutting technology.  This will be discussed along with improvements that can be made to ensure modern cutting tools are capable of producing the cutting forces required whilst still maintaining a low enough weight and size for ROV deployment.
]==],
    image = "webtool.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Hydraulic Intensifiers",
    fulltitle = "Hydraulic Intensifers are a Boost for ROV Tooling Requirements",
    presenters = { "Bill Niblock", "Thyge Bollmann", },
    abstract = [==[
The presentation will focus on recent and anticipated trends for high pressure hydraulics in subsea applications, predominately in the oil production industry and how compact hydraulic intensifiers can be a cost effective and reliable solution.

Deeper Drilling-Higher Pressures.  Exploration in deeper water combined with higher safety margins are driving the need for higher hydraulic pressures.  We will review how some subsea procedures, such as seal testing, are requiring higher pressures, and how hydraulic intensifiers are responding to the need.

Reliability and Flexibility.  Being able to perform at depth and at a range of flows and pressures, is challenged when additional hydraulic fluids and process solutions are used.  Discussion will consider how recent design considerations with hydraulic intensifiers improve both reliability and flexibility.

Beyond ROV.  Some of the intervention applications that are served by ROVs, also need upgrading, such as BOP accumulator charging.  Discussion will cover how compact hydraulic intensifiers can be a cost effective solution.
]==],
    image = "tooling.png",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Waterjet Applications Subsea",
    fulltitle = "Waterjet Technology and Applications Deepwater Subsea",
    presenters = { "Bruce Kivisto", },
    abstract = [==[
Waterjet technology has been developed for application in deepwater (3,000m+) environments. It offers several important advantages over existing technologies and presents new opportunities for continued refinement of subsea maintenance, repair, salvage, and emergency response techniques.

Advances in waterjet intensifier pump technology allow it to be applied subsea as a cutting tool in emergency response situations, or simply as an ultra-high pressure stream of water for coating or marine growth removal in applications such as isolation of welds for inspection. It may also be used as a tool to provide turbulence in a stream of methanol for tasks such as hydrate remediation and is effective at cutting steel up to 250 mm thick. The tool in a waterjet system cannot bind in the cut to jeopardize asset integrity, and it eliminates the hazard of igniting trapped pockets of gas during cutting.

Waterjet technology has been extended into the deepwater subsea space during the past year. Inclusion of an intensifier style subsea waterjet system in the collection of emergency response assets will give another option for cutting, salvage, and conduct of rapid de-mobilization operations.
]==],
    image = "waterjet.jpg",
    materials = "waterjet.pptx",
    start = { day = 25, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Automation",
    fulltitle = "Navigation, Object Tracking and Data Monitoring in Real-Time for ROV Automation",
    presenters = { "Dr. Mahesh Menon", "Ioseba Tena", },
    abstract = [==[
The last five years has seen the advent of commercial-off-the-shelf (COTS) Remotely Operated Vehicle (ROV) automation solutions. The challenges posed by a rapidly expanding ROV pilot workforce, dynamic working environments and increasing demands on quality and performance have been the main drivers for this technology. A good example of its application is the 2008 Doc Ricketts vehicle. This was a Workclass ROV (WROV) equipped with the basic autonomy building blocks to enable station keeping, waypoint following and object tracking. The Doc Ricketts WROV is still in active service with MBARI. This basic capability paved the way for commercial applications and now station keeping is a standard option. More recently, Jan De Nul Fall Pipe ROV is an example that uses COTS sophisticated cruise and mission planning modules. This world's first enables precise positioning of the ROV over a pipeline as it swings from side to side and places rocks over the product. Available capabilities today include real-time monitoring and control of multiple ROVs relative to chart data, mid-water DP using INS and tracking sonar, pre-lay survey flight modes and hands-off touchdown monitoring using sonar. The combination of data from optical cameras with 3D sonar imaging will further enhance the mapping of the subsea environment to facilitate various activities such as mission planning and training.

The purpose of this talk is to provide an insight into this technology and a glimpse of what to expect in the immediate future.
]==],
    image = "rockdump.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Fiber Optic Connectivity",
    fulltitle = "Considerations for Successful Optical Fiber Connectivity in Subsea Applications",
    presenters = { "Steve Bell", },
    abstract = [==[
Fiber optic connectors deliver massive bandwidth in a minute footprint, and thus are becoming increasingly popular for ROV and manned submersibles for everything from vehicle control and HD cameras to tracking and fiber based sensors. However, there are numerous complex engineering considerations for such systems, given the rigorous demands of subsea applications. Thus, it's key to make informed decisions about how fiber optics should be integrated into a design from its inception to achieve the maximum advantage of the technology.

This report explores the theory of fiber optics, both operation and concepts of use, strategies for design, pros and cons, especially as they affect the trade-offs between single mode and multimode fiber for specific applications.
Further, it examines to the future of the technology and how it can shape the deep ocean industry, from low back reflectance connectors to bend-insensitive, high numerical aperture fiber options, which will allow even greater versatility and performance in robust connector shell designs.
]==],
    image = "fiberoptic-connect.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "MTS ROV Committee Meeting",
    fulltitle = "Marine Technology Society Remotely Operated Vehicle Committee Meeting",
    presenters = { "Drew Michel", },
    abstract = [==[
The agenda for the MTS ROV Committee meeting:

- Review the current work and programs of the committee
  - Underwater intervention
  - MATE ROV Competition
  - MATE ROV in-a-bag
  - Scholarships
- Discuss future leadership of the committee and vote for officers
- Continue the technical discussion on the future of ROV and AUV technology and how these two technologies are becoming more similar
]==],
    materials = true,
    start = { day = 26, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 5400,
    room = "217",
  },

})
maketrack("srov", { --Small ROVs

  {
    title = "Missing Cave Diver Search",
    fulltitle = "1,300 ROV Penetration at Vortex Springs Florida",
    presenters = { "Sam Lapinsky", },
    abstract = [==[
Our agency was contacted by the Holmes County Sheriff's Office after all other efforts failed to locate the remains of a cave diver who reportedly failed to return to the surface after a deep cave penetration dive into Vortex Springs.

Before we left to assist with our Pro 4 ROV we were told that the missing diver was believed to be deep in the cave (approx 1,400 feet), in an area where the diameter of the tube where the diver was thought to be was equal to the size of the diver. Before our arrival experienced cave divers had searched the inside of the cave, and penetrated approx 1,200 feet into the cave. It was hoped that the ROV could reach an additional 200 feet, which was the limit of the mapped system. This area of the cave was not much larger that the ROV itself, and the ROV, or any diver reaching this point would not be able to turn around to exit the cave.

Unfortunately we were not able to locate the lost diver, but this presentation will review the challenges we encountered using an ROV in these most difficult circumstances, in a rarely attempted type of search and recovery mission. I will also talk about the equipment used during this attempted recovery, the support supplied by Video Ray, and the lessons learned during the mission.
]==],
    image = "mcdavsfc.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Under Ice Operations Using a Micro-ROV",
    fulltitle = "Under Ice Operations Using a Micro-ROV",
    presenters = { "Thomas Wrasse", },
    abstract = [==[
While underwater operations provide a host of significant anxieties, when a sheet of ice is added to the picture the pressure increases similar to a diver descending down the water column.  Past practice - putting human life in jeopardy by traversing unsafe ice conditions or by placing divers into a confined space is no longer advisable.  Micro-ROV technology allows first responders to locate, inspect, and retrieve rapidly, efficiently, safely, and cost-effectively.  The requirement of cutting large holes for under ice diving creates future public hazards until solid freeze up occurs.   The extremely small hole required of the Micro-ROV minimizes vulnerability and can easily be made safe upon completion of the task.
The Micro-ROV is easily deployed, with minimal risk, into a potential human trap eliminating travel to the unknown.  The Micro-ROV can without difficulty, assess hazards, survey the scene, locate and identify targets, recover evidence and provide a safe lane of travel for a diver.  It doesn’t matter if it is an object that has fallen through or a survey that needs to be done; the employment of Micro-ROV under ice operation is a safe first alternative.
This presentation will show the experiences of several small ROV projects successfully employed in under-ice operations, along with lessons learned from the agencies involved.  Projects include locating vehicles fallen through the ice, drowning victims and ice rescue training.
]==],
    image = "under-ice.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "Marine debris and underwater tech",
    fulltitle = "Integrating a micro-ROV, imaging, sonar, and positioning to find and remove debris along the New England Coast",
    presenters = { "Rachael Miller", },
    abstract = [==[
The mission of Rozalia Project for a Clean Ocean is to find and remove marine debris from our oceans, bays and rivers. Marine debris takes many forms, and occurs in all marine environments, presenting myriad challenges in removing it from the water. Rachael Miller of Rozalia Project uses a VideoRay with BlueView sonar, Lyyn image enhancement, and Smart Tether positioning system along with the Tritech Starfish side scan sonar, to scour the bottom of a variety of venues looking for and retrieving marine debris - from small pieces of plastic to large masses of derelict fishing gear - and everything in-between. This presentation will show specific examples of how the equipment is integrated and used in concert to locate and recover a variety of objects of differing size and material, and how different benthic environments and conditions affect mission planning and execution. The presentation will conclude with a discussion of lessons learned and the strategies Rachael used to handle specific challenges related to debris search and recovery.
]==],
    image = "debris.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Using micro-ROV's in the aftermath of Japan's Tsunami",
    fulltitle = "Investigating and mapping obstacles and debris washed into the ocean by the tsunami",
    presenters = { "Masanobu Shibuya", },
    abstract = [==[
Shibuya Diving Industry (http://www.shibuya-diving.co.jp) is one of Japan’s most innovative, high technology companies.  Founder Mr. Masanobu Shibuya, has lead Japan’s diving evolution in many ways – particularly in protecting the environment, and underwater backhoe work in constructing port facilities.  In addition to leading the company, Mr. Shibuya is an expert underwater photographer and videographer, who is more often in the water  than topside when on site.

Since the Tsunami of March 11th, Shibuya Diving Industry has worked tirelessly to clear and reconstruct port facilities that have been devastated by buildings, cars, people – entire villages washed into the sea.  While every available diver worked around the clock, any technology that could help was needed.

After attending multiple Underwater Intervention conferences – and paying close attention to the technical presentations on small ROVs – Mr. Shibuya placed an order for a VideoRay Pro 4 system with multibeam sonar, non-acoustic positioning, and radiation sensor along with other accessories.  In addition to the hardware, Shibuya Diving Industry purchased factory training, with VideoRay trainers spending a week in Japan explaining, demonstrating, and teaching Shibuya’s staff how microROVs can be used along with divers to make projects saver, faster, and more efficient.

This presentation by Mr. Shibuya himself will explain the results he experienced with the equipment and the lessons he has learned since acquiring it.
]==],
    image = "tsunami.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 3600,
    room = "218",
  },

  {
    title = "ROV's for Disaster Recovery",
    fulltitle = "The Use of Remotely Operated Vehicles for Disaster Recovery in the Tsunami stricken areas of Minamisanriku and Rikuzentakata Japan.",
    presenters = { "Eric Steimle", "Robin Murphy", "Jesse Rodocker", },
    abstract = [==[
Remotely Operated Vehicles were used during two trips to the Tsunami damaged areas in the Iwate Prefecture of Japan. In April 2011 four ROV’s were used to inspect infrastructure and to assist with victim search and recovery.  The ROV’s successfully allowed a fishing port to be reopened and were used to search for victims in debris to dangerous for manual search with divers. During this trip a SeaBotix SARbot, a SeaBotix LBV-300-5, a SeaMor ROV and an AC-ROV were used. A second trip in October 2011 saw a return to the city of Minamisanriku Cho. The city had requested an expanded search for debris in the ports and open areas of the bay where fishing nets were to be redeployed. Based on lessons learned in April a SeaBotix SARbot was chosen.  This paper will present data and lessons learned from the two trips.
]==],
    materials = "steimle-rov-disaster.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Extending the Capabilities of Your Small ROV",
    fulltitle = "Tips and Techniques for Mounting Commercial or Home-Made Accessories",
    presenters = { "Tom Glebas", },
    abstract = [==[
To extend the range of applications of small ROVs beyond that of a swimming camera, manufacturers develop accessory integration schemes to allow the addition of sophisticated systems including sonar, positioning, intervention and various other sensors  Understanding the technical aspects of your small ROV can help you improve the use of these commercial accessories or design and build your own.  This presentation will address related topics including ballast and trim, power, communications and total systems integration.
]==],
    image = "accessories.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "New autonomous survey capabilities for ROVs",
    fulltitle = "New autonomous survey capabilities for microROVs",
    presenters = { "Ioseba Tena", },
    abstract = [==[
The low-logistics associated with microROVs make it an ideal platform for rapid deployment. With microROVs, first respondents are able to rapidly mobilize to an area, run a survey and interact with the subsea environment if required. The time it takes to run a search and the confidence to report that the area has been cleared is often time-crucial for the success of the mission. Recent advances in technology have seen the introduction of software solutions to automate and simplify the piloting of the ROV by analyzing data gathered from navigation and sonar sensors.  Over the last few years technology developments have reduced the size of these sensors and it is now possible to introduce some of the technologies in use with observation-class and work-class ROVs. This talk explores a solution that integrates a phased array Doppler Velocity Log with a microROV and enables a true survey capability that, to date, would normally only be found with Autonomous Underwater Vehicles. The Survey-Control software simplifies the piloting of ROVs, improves the situational awareness of the operator and increases the pace of operations.  With this tool, first respondents will be able to fly the ROV with significantly less training and guide the ROV precisely around the environment.
]==],
    image = "autonomous.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "Tether-based positioning system technology",
    fulltitle = "",
    presenters = { "Matt Cowen", },
    abstract = [==[
Smart Tether, a complete underwater navigation system, offers you unmatched operation with your ROV system or tethered diver. The Smart Tether system, which includes tether, control box and software, is designed to meet multiple missions and tested to survive extreme environments. No matter what your mission, the Smart Tether system makes it smarter, faster, safer, and easier
]==],
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Bluefin AUVs & ROVs",
    fulltitle = "ROVs and AUVs: Complementary Technologies for Underwater Intervention Tasks",
    presenters = { "Joshua Elvander", },
    abstract = [==[
Autonomous Underwater Vehicles (AUVs) and Remotely Operated Vehicles (ROVs) fill different niches within the underwater intervention task spectrum.  AUVs provide the capability for subsea inspection and survey on a variety of range scales and with multiple sensors, including sidescan and synthetic aperture sonar, sub-bottom profiling, multi-beam echosounding and still and video photography.  Small ROVs can provide inspection, repair and maintenance capabilities to assist the oil and gas industries in deep water environments.
Bluefin Robotics recently acquired the assets of Hawkes Remotes, Inc. (HRI), a spinoff from Hawkes Ocean Technologies (HOT) that develops advanced ROVs.  The HRI designs offer scalable, modular solutions including a thin, armored fiber-optic tether and on-board high-energy-density batteries that will reduce the total cost of ownership/operating costs while simultaneously outperforming existing ROV technology.  Bluefin will leverage their autonomy and subsea experience to add hybrid capabilities to the ROVs and offer them as an extension of their current product line to the oil and gas industry.  The presentation will show how the Bluefin/Hawkes capabilities in the AUV and ROV space provide complementary technologies that will enable a wide variety of underwater intervention tasks with a cost-effective footprint and low infrastructure support.
]==],
    image = "bluefin-pres.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Student innovations transforming commercial ROV technologies",
    fulltitle = "Evaluation of Quality indicators for observation class ROVs",
    presenters = { "Dmitry Lyakhov", "Sergey Ogay", "Jill Zande", },
    abstract = [==[
The Institute of Marine Technology Problems (IMPT) is a unit of the Far Eastern Branch of the Russian Academy of Sciences. It was formed as the Navigation and Control Systems Lab in 1972 and in 1988 grown into the IMPT with an emphasis on research, development and engineering of AUVs. In an almost 40 years of establishment, the IMPT has been successful in developing dozens of unmanned underwater vehicles (prototypes and initial production).

Although the Institute  is not an educational establishment there are several students from local colleges and universities who are pursuing their Bachelor's, Master's and PhD degrees.

Since 2008, teams of students from IMPT have participated in the MATE ROV Competition. In 2010 they won. This paper will present how the student ROV innovations were transformed into commercial product and why students involved in MATE are in demand in the underwater engineering workplace. Theoretical approaches in developing underwater vehicles, practical construction work and sea trials will be described in this presentation giving useful insight to students, teachers, and underwater technology professionals.
]==],
    image = "student-inno.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "Navy Hull Inspections",
    fulltitle = "Leveraging divers and ROVs to collect  data on Navy ships",
    presenters = { "Joseph Curran", },
    abstract = [==[
In order to quantify the effect of biofouling on ship performance, an accurate measure must be made of the fouling on the ship. This biofouling is very dependent on timing and ship service. Inspections must be carried out immediately after a ship’s return, and before a deployment. Not only are multiple, repeatable points to be inspected on the ship, but the ability must exist to do so anywhere in the world and on short notice. Both divers and ROVs were utilized to accomplish this mission.
By utilizing both divers and ROVs, NSWC Carderock Division has been able to provide a consistent, high-quality survey of Navy ship hulls to meet the goals of the experiment. The lessons learned from over 60 hull inspections in two years will be shared. These include comments on rapid response, ship tagouts, ruggedization for air shipment of systems, and a novel CONOP for small-footprint operation on a pier. Divers and ROVs need not be competitors. By playing to the strengths of both, a much better product can be produced, and vital data can be gathered that would otherwise be missed.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Bathymetry and Biotope Surveys in the Red Sea",
    fulltitle = "Using micro-ROVs to Conduct 200+ Km's of Bathymetry and Biotope Transect Surveys in the Red Sea",
    presenters = { "Craig Thorngren", },
    abstract = [==[
During the summer of 2011, King Fahd University of Petroleum and Minerals was contracted by Saudi ARAMCO to conduct  an extensive surveys in the Red Sea where they wanted to conduct test drills for oil.  The survey was needed to complete a baseline assessment and to see if there were any critical habitat areas in or near the proposed well sights.
This presentation will cover the highlights and triumphs of a very ambitious expedition.
Some of the requirements for the tasking were an extremely tight work schedule, limited support facilities, accurate positioning for data collection and very specific data gathering.  Additionally, all of the work had to be conducted off of a 25’ Boston Whaler.
Due to these stringent requirements a VideoRay Pro4 ROV, KCF Technologies Smart Tether, LYYN Video Enhancement System and a YSI 600XL Sonde Gauge were chosen to complete the survey.
]==],
    image = "bathys.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "Micro ROV Support To Offshore O&G",
    fulltitle = "Micro ROV Support to the Offshore Oil & Gas Industry - Case Studies",
    presenters = { "Steven Van Meter", },
    abstract = [==[
The use of VideoRays in the Offshore Oil & Gas Industry is growing rapidly, as recent results of inspections of facilities and vessels around the world show that this is compelling technology. Inspections can often be done more rapidly, efficiently, safely, and at lower cost than other traditional methods. In many cases there are critical areas and mechanisms that cannot be inspected safely by ANY other method. The extreme portability, small size, low power consumption of modern micro ROVs combined with their depth, current handling, and tether pulling capabilities combine to provide completely new tactics, techniques, and procedures.

This presentation covers case studies where Van Meter Consulting has used Micro ROVs to support offshore oil and gas projects. From Russia's Siberian LNG, to an FPSO in the South China Sea, to the Gulf of Mexico, photos and video clips will demonstrate how this maturing technology is being used in the offshore environment. Van Meter will explain how he won the jobs, planned for the mission, adjusted and compensated when things were not working, and successfully completed the mission each time.
]==],
    image = "oilrig.jpg",
    materials = "vanmeter-og-rov.pptx",
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Tracking through Multibeam",
    fulltitle = "Multibeam Imaging Sonar-Track, through-the-sensor control for microROVs",
    presenters = { "Ioseba Tena", },
    abstract = [==[
Multibeam imaging sonars have been available since the early nineties and have served well as a tool to improve situational awareness. Operators can observe targets at distances of tens to hundreds of yards and use the information to navigate underwater vehicles and monitor important subsea regions. The original systems were significant in size and weight and required large electronic pods to beam form and process the raw data. But today’s multibeam imaging sonars are of a size suitable for microROV operation, so much so that they have become a common payload option for many operators. In tandem software solutions enabling close control of unmanned systems using through-the-sensor servoing techniques have evolved to a level of maturity suitable for commercial exploitation. The bringing together of this technology with the microROV will enable a new level of user control to the operational users. A common task such as flying to a target can be a difficult undertaking when faced with currents and tether effects, when time is at a premium this can be frustrating and negatively impact the overall mission needs. This proposed technology enables the microROV to keep station relative to an object or structure identified in the sonar data. The ROV can then maneuver relative to this object and the pilot need only provide simple point-and-click commands on the sonar screen. This talk will illustrate some early results on early prototype work.
]==],
    image = "tracking.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Remote image enhancement technology",
    fulltitle = "Image processing of IP-network subsea video",
    presenters = { "Anders Holm", },
    abstract = [==[
The key to successful underwater vision is to get rid of the water! This cliché is as old as underwater photography itself, but it's still true today. Depth, distance, lighting, turbidity of the water, salinity, and pollution all contribute to the visibility, and the perception of size, shape, and color of underwater objects.

The LYYN products optimize the contrast and color of each frame to increase the visibility of a scene. Even the smallest fragments of color and object shape can be extracted from the camera sensor to restore the scene as much as possible. And all this is done in real-time. The result is an image that constantly self-adjusts to the environment and the diver or ROV pilot can focus on mission objectives.

Until now, this technology has only been available for analog video. In the near future, it will be available also for HD-SDI video streams and for IP cameras. During the presentation we will demonstrate how we eliminate both the disturbances from water as well as the distance to the camera by connecting an iPad to several IP cameras live from around the world, and enhancing the video in real-time. We will also show some recorded, and lyynified HD footage.
]==],
    image = "lyyn-sshot.png",
    materials = "http://www.lyyn.com/UI2012",
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "High performance hydraulic manipulator",
    fulltitle = "Excavating and retrieving ancient artefacts from the seabed using a small but high performance hydraulic manipulator",
    presenters = { "Chris Lokuciewski", },
    abstract = [==[
Excavating and recovering ancient artefacts from the seabed demands precise and highly reliable equipment.  Florida-based RPM Nautical Foundation (RPMNF) has pushed the boundaries of maritime archaeology by performing the careful and precise work necessary for professional archaeology at depths beyond effective diver range.

To accomplish these goals, RPMNF uses an ROV fitted with two Hydro-lek multifunctional manipulator arms, most recently in the Egadi Islands off Sicily where they discovered warship rams that date back to the 3rd century BC.

This paper will provide an overview of how these Hydro-Lek manipulators were utilized in the recovery of not just these important archaeological artefacts but also in many other deep sea salvage operations.  It will also explain the design and operation of the hydraulic manipulator technology and how smaller ROV's can be empowered by the use of high performance subsea tooling.
]==],
    image = "manip.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "ROV Training for PSD & Port Security",
    fulltitle = "Micro ROVs in Public Safety Diving and Port Security: The Need for Standards and Training",
    presenters = { "Mark Feulner", "Michael Zinszer", },
    abstract = [==[
Florida State University Panama City (FSUPC) completed an evaluation study in 2010 that examined the techniques and tools available for the execution of the search and inspection activities that public safety divers are routinely called upon to perform.  The test teams were drawn from major ports across the country and were selected for their experience and skill in conducting port security operations as well as routine public safety dive functions.  The teams included Seattle Police Department Harbor Patrol, NYPD Scuba Team, Jacksonville Sheriff Office Dive Team, and the FBI’s USERT team out of Los Angeles. A team from FSUPC’s Underwater Crime Scene Investigation was utilized to augment the dataset.  The findings indicated that traditional and technology-augmented search techniques were all very successful methods, particularly in the specific contexts for which they were developed.  However, broader implications to ROV training and use were suggested by the results.  While these observations were beyond the scope of the study, they provide valuable insights that are shared in this paper.
]==],
    image = "nypd-rov.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "Small ROV Fleet Management",
    fulltitle = "Developing and Implementing Standard Practices for Managing Fleets of Small ROVs",
    presenters = { "Tom Glebas", },
    abstract = [==[
Small ROVs have reached a point in their adoption curve where organizations may own more than one and acquisitions may involve multiple systems, but are these organizations managing these assets like a fleet, or are they still leaving that in the hands of the lead operator of each system?  This presentation will address the tools, techniques and best practices that owners or managers of multiple small ROVs should consider to ensure that they are getting the most value from their investments in equipment and people.  While the fleet size addressed in this presentation is 10 systems or more, there will be valuable information presented for any level of ownership, including just one system.
]==],
    image = "fleet-mgmt.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "218",
  },

  {
    title = "Non-traditional uses of micro-ROV",
    fulltitle = "Non-traditional uses of micro-ROV",
    presenters = { "Andrew Goldstein", },
    abstract = [==[
Remotely operated vehicles have become a commonplace undersea tool.  However there are still people pushing the boundaries of technological development and finding new ways to repurpose current technology to new tasks.
The micro-ROV lends itself to non-traditional use more so than its bigger brethren.  The lower cost, lower complexity, and ease of transportation and operational insertion promote novel uses and experimentation.  The micro-ROV also packs many capabilities into a systems package: imaging and navigation sensors, propulsion, illumination, pressure vessel, power, communications, etc.
This talk will discuss some examples of such non-traditional uses by VideoRay customers and ways in which manufactures can foster and leverage this type of end-user application.
]==],
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "A high performance mini-ROV for fishery bi-catch studies",
    fulltitle = "",
    presenters = { "Darren Moss", },
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "218",
  },

  {
    title = "ROV Maintenance Program",
    fulltitle = "Ensuring Maximum Up-Time and Extending the Service Life of Small ROVs",
    presenters = { "Dean Nafziger", },
    abstract = [==[
Knowing how to change a flat tire doesn't ensure that your car is maintained in optimal operating condition.  Likewise, knowing how to change a propeller or camera dome doesn't ensure that your small ROV will be properly maintained.  This presentation will look beyond the basic repair techniques and describe key elements in developing and implementing a small ROV maintenance program designed to keep your systems running and extend their service life.  Topics addressed include what items require the most frequent maintenance, how to avoid the most costly repairs, keeping track of service records, how to handle emergencies and many other best practices.
]==],
    image = "vital.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "218",
  },

})
maketrack("muv", { --Manned Underwater Vehicles

  {
    title = "MTS MUV 2011 Overview",
    fulltitle = "MTS Overview of Manned Sub Activity in 2011",
    presenters = { "Will Kohnen", },
    abstract = [==[
The presentation will provide a yearly review of the state of the Manned Submersible industry in 2011. The overview will look at developments in all branches of activity, including international research, tourism activity, leisure and security developments. This will include a summary of submersibles under Classification, operating and in construction, review of the industry trends and regulatory highlights for the year.
]==],
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 3600,
    room = "219",
  },

  {
    title = "USCG Review of NARCO Subs",
    fulltitle = "Narco Subsea:  Implications for Submersible Owners and Operators",
    presenters = { "William Thompson", },
    abstract = [==[
This presentation will be divided in two parts.  The first part will be a brief history of the use of semi-submersible vessels for drug trafficking, beginning with the 2006 seizure of the first confirmed semi-submersible and concluding with the seizures of two fully submersible vessels in 2010.  I will provide technical specifications of those seized as well as the drug trafficking organization requirements for a submersible to be a viable method of delivery.

The second part of the presentation will be the implications of the suspected use of submersibles by drug traffickers for the submersible community.  This will include the perception of submersibles by the law enforcement community, the potential of misidentification of a legally operated submersible as a threat, and the necessity of standard operating procedures by legitimate submersible operators to help avoid this misidentification.

I will use examples of both submersible and surface vessel operations, as well as other examples from various transportation sectors.  These examples will clarify how other industries help to separate legitimate from illegitimate operators to ensure both their economic and physical survival.
]==],
    image = "narco-subs.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "RHOV Personnel Sphere Update",
    fulltitle = "RHOV Personnel Sphere Update - The End is in Sight",
    presenters = { "Jerry Henkener", },
    abstract = [==[
Southwest Research Institute (SwRI) is under contract to WHOI to design, fabricate and test the titanium personnel sphere that will be installed in the upgraded ALVIN submersible. SwRI is nearing completion of the fabrication and testing phases for the new personnel sphere. The personnel sphere will be tested in the Annapolis Test Chambers for a 6500 MSW maximum operating depth. The fabrication and testing had been expected to be completed but the decision to have the personnel sphere dual certified by both ABS and NAVSEA has resulted in schedule delays. All major weldments and the final machining of all components have been completed without experiencing any appreciable distortion or change in out-of-sphericity. Component assembly and structural validation tests are in progress. Stud welding procedures for the viewport windows and the hatch have been developed and are being employed.  A strain gauge location plan is being developed based upon an as-built dimensional FEA model and analysis. A comprehensive hydrostatic test procedure is being developed and going through the dual approval process leading up to the hydro test in the Spring of 2012.  SwRI will deliver the sphere and documentation to WHOI after the hydro test to complete our contract. The status and activities since last year and activities to complete the personnel sphere in 2012 will be discussed.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "RHOV Project - ALVIN Update",
    fulltitle = "ALVIN Submerible Upgrade Program",
    presenters = { "Kurt Uetz", },
    abstract = [==[
Woods Hole Oceanographic Institution (WHOI) is developing a new deeper diving submersible by upgrading the present ALVIN in stages. The upgraded ALVIN will ultimately have an increased operating depth from 4500 MSW to 6500 MSW. The project at WHOI is being accomplished in two phases. .  .    .
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Titanic at 100",
    fulltitle = "Legal Implications to Visitors, Researchers and Salvors",
    presenters = { "Laura Gongaware", },
    abstract = [==[
Titanic is now 100 and on April 15, 2012 Titanic will be subject to the 2001 UNESCO Convention on the Protection of Underwater Cultural Heritage (UCH) as well other U.S. domestic laws.   This presentation will discuss these laws and the unique use of the law of salvage to protect Titanic from looting and keep the collection of salvaged as an intact collection for the public benefit.    Finally, the presentation will discuss the potential implications of all of these laws to those planning visits to the wrecksite in commemorating the 100th Anniversary, including on manned submersibles.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "MUV exploration 1/2 Mile Down",
    fulltitle = "MUV exploration to 1/2 mile depths for pennies on the dollar, 4,000 hours later",
    presenters = { "Karl Stanley", },
    abstract = [==[
This presentation will trace the development and use of two manned submersibles on budgets that are a fraction of other vehicles with similar capabilities.  The first one of these was began in 1989 and named C-BUG (Controlled by Buoyancy Underwater Glider). It was one of the first winged subs ever made and enjoyed a successful career spanning over 550 dives in three countries. The next vehicle was named Idabel, and despite an initial budget of under 100k it has made over 900 dives to depths of up to half a mile.   In addition to keeping manufacturing costs low, operating costs have been kept low as well by a location choice that offers immediate access to deep water without the need for a support craft of any sort. A third aspect to the low operating costs has been the engineering of Idabel for minimum displacement. This craft carries two passengers and a pilot and weighs in at just over 9,000 pounds, making it not only less expensive to build and operate, but giving it a distinct advantage for photography. This formula has resulted in dive rates that start at just $400 per person for a 1000 foot dive, and a day rate of $2,000 for up to 6 hour-long dives.
]==],
    image = "muv-photo.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "Antipodes LRT Update",
    fulltitle = "Developing a Launch, Retrieval, and Transport System for Ocean Exploration",
    presenters = { "Stockton Rush", "Guillermo Sohnlein", },
    abstract = [==[
Since OceanGate acquired the Antipodes manned submersible (former PC-1501) two years ago, we have been deploying her on different missions in support of ocean exploration, marine research, filmmaking, and education and community outreach.  To expand our range of operations while simultaneously controlling costs, we have been developing a towable Launch, Retrieval, and Transport (LRT) system that will allow us to access more near-shore dive sites without the need for expensive support vessels.  We tested our first prototype in Southern California last fall, and we are currently developing the next version out of our headquarters in Seattle.  We plan to field-test this next system in Florida during early 2012, so this presentation will provide an update on our efforts and our future plans.
]==],
    image = "antipodes.jpg",
    materials = "antipodes.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "NUYTCO Overview of Submersible Operations in 2011",
    fulltitle = "",
    presenters = { "Phil Nuytten", },
    abstract = [==[
The presentation provides an overview of the submersible activity at Nuytco for 2011. The review will include:

1. Completion of year 5 of Canadian Space Agency and NASA mission analogs as part of the Pavilion Lake Research Program.
2. Newtsuit and Dual DeepWorker dives to support filming and research operations on the wreck of the RMS Lusitania.
3. Deployment of the ‘Dual DeepWorker’ submersible to perform fisheries research on natural and manmade habitats off the coast of California.
4. Deployment of 2 Deep Worker submersibles to support the NASA Extreme Environment Mission Operations #15 (NEEMO 15). Deep Workers were used as vehicle Analogs for NASA’s proposed Multi Mission Space Exploration Vehicle (MMSEV).
5. Completion of the Shaft 19 remediation project for the NYDEP in Valhalla NY. Nuytco Research deployed two Newtsuits to support construction efforts to complete the uptake and downtake shaft repairs on the worlds’ largest UV Water Purification facility.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Forward Looking Sonar Technology for UW Vehicles",
    fulltitle = "Modern sonar performance as enabling technology for new UW Vehicles productivity frontiers",
    presenters = { "Peter K. Eriksen", },
    abstract = [==[
The presentation will review the basics of forward looking sonar technologies, its evolution over the years and the present state-of-the-art in multibeam capabilities. This includes discussion and examples of object detection in the water column as well as on the seabed, such as underwater structures, pipelines, marine mammals and hydrocarbon (oil & gas) detection. The adaptation and optimization of these technologies to underwater vehicles is an important aspect of the technology and its future developments. The presentation will address Interface and Power considerations, flexibility of installation and real-time signal processing tradeoffs. These devices provide essential long range viewing capability to help high speed unmanned vehicles as well as manned vehicles under low visibility conditions.
]==],
    image = "sealion.jpg",
    materials = "eriksen.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "Improved Oxygen Calculations and Their Benefits to MUVs",
    presenters = { "Phil Ziegler", },
    abstract = [==[
This presentation discusses an improved method of performing oxygen supply calculations and describes how its significantly greater accuracy can improve safety and reduce operating costs.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 16, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "PSUBS Overview and Update",
    fulltitle = "An overview and update of activities within the Personal Submersibles Organization",
    presenters = { "Jon Wallace", },
    abstract = [==[
This presentation will provide an update of PSUBS (Personal Submersibles Organization) activities for the past year including various submarine projects under development, organization roadmap and interaction with other industry organizations, and a review of the re-building of the K-600 Kittredge submersible.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Overview of ABS Rule Change Proposals and Open Industry Discussion",
    fulltitle = "Overview of ABS Rule Change Proposals for 2012 (Annual ABS - Industry Meeting)",
    presenters = { "Roy Thomas", },
    abstract = [==[
Open meeting of the American Bureau of Shipping (ABS) with the subsea industry to review proposed rule changes to the ABS Rules for Building and Classing Underwater Vehicles, Systems and Hyperbaric Facilities. The meeting facilitates an open dialogue with the industry on current issues that work well or do not work. All active designers, fabricators, owners and operators are invited to attend and provide feedback.
]==],
    image = "abs-rule-change-proposals.jpg",
    materials = "abs-rules.ppt",
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 3600,
    room = "219",
  },

  {
    title = "Alternative CO2 Scrubber",
    fulltitle = "An Alternative Method to Remove Carbon Dioxide From Submersible Environments",
    presenters = { "Marshall Nuckols", "Serpil Awdry", "Stam Kolaczkowski", "Chien Le", "Tony Smith", "Dave Thomas", },
    abstract = [==[
A major obstacle in the development of manned submersibles involves the removal of metabolically-produced carbon dioxide from the cabin environment, particularly during long-duration, cold water operations.  Traditional CO2 absorption methods utilized in underwater life support systems use alkali metal hydroxide chemical beds—mostly calcium hydroxide—which have been shown to have poor absorption efficiencies in cold environments.  Experimental evidence suggests that seawater, a readily accessible medium during submersible operations, could be a highly effective alternative scrubbing medium to remove metabolically-produced carbon dioxide.  Laboratory CO2 absorption trials are currently being conducted in a joint research effort between Duke University and the University of Bath in the United Kingdom, under sponsorship by the Office of Naval Research.  An overview of these absorption trials will be presented and the physical principles governing this absorption technique will be explained.   Alternative concept designs will be introduced and the suitability of these concepts for open and closed-circuit breathing systems will be discussed.
]==],
    image = "co2scrubber.jpg",
    materials = "nuckols-scrubber.pptx",
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Ocean-Going Diesel-Electric Submarine",
    fulltitle = "Development of a commercial, Ocean-going, diesel electric submarine for extended operations at sea.",
    presenters = { "Brett Phaneuf", },
    abstract = [==[
Since 1986 MSUBS has been producing small, diesel-electric submersibles; coupled with recent rapid prototyping projects, in concert with Submergence Group, that produced manned and unmanned vehicles ranging from 25-65 tons, MSUBS and Submergence Group have embarked on a project to produce the world's first privately owned and operated ocean-going diesel-electric submarine for research purposes.  The submarine, as yet unnamed, will be approximately 30 meters in length with a beam of nearly 4 meters and be capable of diving to 300msw and transiting vast ocean distances while snorkeling.  The presentation will provide an overview of the submarine design and production plans.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "Hawaii Undersea Research Lab (HURL) 2011 Update",
    fulltitle = "A University of Hawaii research facility operating under the auspices of NOAA's National Undersea Research Program",
    presenters = { "Colin Wollerman", },
    abstract = [==[
Operating two manned submersibles with a crew of five specialists at close to 100% success rate for over ten years is unique in the industry. The presentation will provide an update on the operation of the PISCES IV and V along with a review of the technical updates made to the equipment and expansion of personnel at HURL. This includes the two submersibles, ROV, multibeam sonar and the support ship R/V Ka`imiaki-o-Kanaloa.

The 2011 pre-season "test & trial" produced a number of Marine Heritage site dives. These historical wrecks were discovered while the HURL team multi-tasked its way through its operational, training, and safety protocols conducted prior to each dive season. In September HURL took part in a National Geographic production Alien Deep using the Pisces IV and V outfitted with 3D HD camera gear and LED lights from Woods Hole Advanced Imaging and Visualization Lab (AIVL). HURL also enjoyed a successful series of dives in the North West Hawaiian Island National Monument. The Pisces IV is coming apart for a special survey and the Pisces V is in stand-by for emergency deployment.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "SubSea Lithium Battery Certification",
    fulltitle = "Subsea Lithium Battery Certification Considerations at ABS, LR and DNV",
    presenters = { "Matt Koenig", "Brent Perry", },
    abstract = [==[
Manned submersibles, as well as Remotely Operated Vehicles (ROVs), are two of the most significant platforms for Marine Technology research and operations.  Long lived and powerful on board energy storage is a major roadblock to fully exploiting their operational effectiveness. Lithium based storage has the potential to provide this much needed capacity and scalability.  Lack of Type certification for a technology can terminate the process of its implementation in the MarTech sector, and for many operators, is equally as terminal to obtaining government approvals and funding.

Corvus Energy has obtained class certification for its lithium battery technology from Lloyds Registry and is completing its classification with ABS and DNV.  The path which it travelled to obtain these informs Corvus’ process for submerged type approval, as well as the process for others seeking to pursue these certifications in this sector. The presentation will review the certification process and discuss the future trends and possibilities for use of these batteries in underwater vehicles.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Pressure Tolerant Batteries for Subsea use",
    fulltitle = "Modular Pressure-Tolerant Batteries for Subsea Applications",
    presenters = { "Dr. Richard Wilson", },
    abstract = [==[
Subsea power has long been identified as a challenging component of designing and operating underwater equipment. There is a continuous demand for reliable energy sources that allows equipment to run for longer, operate at deeper depths, and offer enhanced performance.

This presentation will outline the challenges of subsea power and describe the benefits of modular pressure-tolerant batteries. It will also highlight how this type of battery can effectively be used to supply power for a multitude of subsea applications such as AUVs, ROVs, benthic instrumentation and actuation of subsea equipment.

The talk will describe the characteristics of the underlying technology, the design methodology and historical development and the characteristics of pressure-tolerant batteries ranging from small replaceable units (1.5kWh / 30V) to larger units (29.6kWh / 240V). Field data of the battery performance in AUVs and possibly other platforms will also be presented.

Additionally, a new method of achieving safer performance of lithium-based battery packs will be presented. The method essentially prevents the propagation of fire among cells within a pack effectively yielding a safer energy supply. Recent research was conducted that included testing of fundamentally safer cells that shut down following an unsafe event. Results from this research will be shared.
]==],
    image = "bluefin.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "Li-Ion Battery System for MUVs",
    fulltitle = "Operation, Maintenance, & Safety Of A Modular Li-Ion Battery System For Manned Underwater Vehicles",
    presenters = { "David White", },
    abstract = [==[
This presentation provides an overview of a modularly constructed 240 Volt 58 KWh Li-Polymer battery system for a manned deep submergence vehicle.  Architecture, operation, maintenance, and safety features of the battery system are provided. An innovative method for rapid module replacement with immediate system availability is described. Two new means for detection of battery module State Of Health is described and an automatic means for detection of cell internal shorts is described. A means to extend battery life and safety using module charge control is described.  Packaging of the pressure equalized battery modules and battery system is described.

Large, modularly constructed Li-Ion and Li-Polymer battery systems are now being constructed for manned under water vehicles. A significant advantage of modular construction of large battery systems is the maintainability of the battery system and the economic edge gained by repairing a large battery system using a single, relatively inexpensive, replacement battery module. Battery system modularity also provides an easy path to improved reliability and safety via redundancy.

The presentation will describe the architecture of a 240 Volt, 58 KWh battery system constructed using 64 identical, autonomous battery modules that provide as much as 8X redundancy. A list of continuously available normal and fault status for a module is described. A console display of this operational status for all 64 modules and of the overall system is provided.

Both standard and state-of-the-art advances for operation, maintenance, and safety of the battery system will be described. Significant among the state-of-the-art advances are:

1. A fast, safe, & automatic, module balancing method for supporting module replacement that is typically 100X faster than conventional methods;
2. Two means for determining module State Of Health;
3. An innovative means for timely detection of internal shorts within any cell in the battery system; and
4. Ability to extend battery life and improve safety by automatically adjusting the charge level of all the modules within the battery system.

The presentation will also describe a means of packaging the 64 modules that allow for pressure equalization of the modules, for mounting the battery external to the manned compartment, and that subdivide the battery system into sections that can be jettisoned.
]==],
    image = "ten-series.jpg",
    materials = "david-white.pdf",
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "New Developments in Acrylics",
    fulltitle = "New Developments in Pressure Vessel Applications of Acrylics",
    presenters = { "Bart Kemper", },
    abstract = [==[
Acrylics are a proven, reliable material for submersible viewports.  The current codes and standards reflect a first-generation development of defining a nonmetallic for pressure vessel application. Kemper Engineering Services, Blanson Ltd., Atlantis Submarines, and Hydrospace Group are building on decades of in-service data to potentially expand the application of acrylics.
]==],
    image = "viewports.jpg",
    materials = "kemper.pdf",
    start = { day = 26, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Naval CADD Software",
    fulltitle = "Naval Architecture Software Tools for Underwater Vehicle Design",
    presenters = { "Tobin McNatt", },
    abstract = [==[
Traditionally, naval architecture has been more craft than science. Determining what is 'right' in a particular situation in the absence of definitive supporting analysis encompasses the art of naval architecture to this day.  With the advent of computers, naval architects began to move their work from 'the drawing board' into the computer and its display.  This presentation describes the evolution of computer-based naval architecture tools from the early stages circa 1980 through the present, from the point of view of a team that pioneered tools which gained a diverse user community over that time frame.  This team's story reflects progress and successes as well as continuing opportunities for advancement. Technical domains such as hull form design, hydrostatics and stability, structures, and weights and moments will be included, with applications to underwater vehicles discussed.  Technology developments related to software architecture and development processes will be highlighted, as well as a view toward future opportunities to further integrate and extend the scope of marine vehicle design tools.
]==],
    materials = false,
    start = { day = 26, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "219",
  },

  {
    title = "Review of Power to Thrust Conversion for Modern Underwater Thrusters",
    fulltitle = "",
    presenters = { "Will Kohnen", },
    abstract = [==[

]==],
    materials = true,
    start = { day = 26, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "219",
  },

  {
    title = "Modern Buoyancy Foams for Underwater Vehicles",
    fulltitle = "Modern Buoyancy Foams for Underwater Vehicles - Technical Discussion Panel",
    presenters = { "Roy Thomas", "Robert Kelly", "Thomas J Murray", "Jim Teague", },
    abstract = [==[
Deep sea buoyancy has evolved significantly since the pre-1960’s days in which paraffin was primary source to today’s use of designed cellular materials.  Material design and quality control of the buoyancy material must be at the forefront when designing the buoyancy package for manned submersible.  This talk will conceptually construct the syntactic foam from the design of the microballon and binder phases and explore the intricate interaction between them in the composite foam.  It will highlight potential modes of failure and technical routes of mitigating this failure.  In addition, it will link the characterization the phases during the development process to the QC testing during production.

A rigorous QC protocol in all components in the syntactic buoyancy is required to maintain a capable manufacturing process as well as reliable, predictable long-term syntactic foams behavior.  This control starts in the microballoon manufacturing process; problems or process deviations during their manufacture can trickle all the way through to the finished foam properties.  The same is expected in the polymer binder phase, coupling agents and other additives that go into the finished product. When the essential constituent properties are identified and quantified, the final performance of the finished syntactic foam can be predicted.
]==],
    image = "foam-microbubbles.jpg",
    materials = false,
    start = { day = 26, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 5400,
    room = "219",
  },

  {
    title = "MTS MUV Committee Meeting",
    fulltitle = "Annual Committee Meeting for MTS Manned Underwater Vehicles",
    presenters = { "Will Kohnen", },
    materials = true,
    start = { day = 26, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 3600,
    room = "219",
  },

})
maketrack("edu", { --Education and Academia

  {
    title = "Student Built Vehicles in Field Research",
    fulltitle = "Utilizing Student \"Built-for-Competition\" Vehicles in Real World Applications",
    presenters = { "Steven Bradshaw", "Phillip Cheng", "Michael Tam", },
    abstract = [==[
The MATE Center provides an outlet for students of all ages to build and test Remotely Operated Vehicles (ROV). MATE Center goes through great lengths to plan and simulate ‘real-world’ problems as the basis for their competitions. From submarine search and rescue operations to underwater sea mount exploration and, more recently, oil spill containment, the competitions attempt to simulate reality.

Georgia Tech Savannah Robotics' ROV Beta Mk II is a direct product of the MATE competition. This vehicle was featured in a summer research trip to the Louisiana Gulf Coast to search for remnants of the Deepwater Horizon oil spill. The same system originally developed for competition collected water samples for oil content analysis at the Gulf Coast site.

This year, Beta Mk II is slated to survey recently unearthed Revolutionary War shipwrecks off the coast of Yorktown, VA. For 2012, the MATE ROV Competition again aligns with the real world research plan for the vehicle. This talk will outline the competition influences on design, the differences in real world performance vs. competition, and the future work inspired by the competition.
]==],
    image = "savannah.jpg",
    materials = "savannah.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "220",
  },

  {
    title = "Micro-ROV as Enablers in Education",
    fulltitle = "Micro-ROV as Enablers in Education",
    presenters = { "Andrew Goldstein", },
    abstract = [==[
Robotics plays an increasing role in STEM education.   It provides for a systems level curricula which encompasses and integrates many disciplines:  mathematics, mechanical, electrical, and software engineering, and domain specific problem solving.     Adding the aspect of underwater exploration to the story makes the use of robotics even more compelling as a driver of improvements to STEM education.  The unique scientific component of underwater exploration allows for the combination of non-engineering scientific elements such biology, geology, oceanography and even archeology.
The commercial micro ROV provides benefits as an educational tool.   The primary benefits being ease of use and logistics, relative low cost, multiplicity of roles, and system completeness.   The microROV also enables a continuum of development which synchronizes well with other popular STEM efforts.
This talk will discuss some of the ways in which VideoRay fosters undersea robotics in educational roles.   The applicability to students in various stages of development from k-12 to post-graduate will be discussed.   Suggestions on ways other commercial organizations can more proactively support improvements to STEM education will be covered.
]==],
    image = "edunablers.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "220",
  },

  {
    title = "ROV competition",
    fulltitle = "From ROV competition to subsea technology",
    presenters = { "Dmitry Lyakhov", "Sergey Ogay", "Jill Zande", },
    abstract = [==[
In result of MATE activities in educational field, specifically - ROV Competition, 2010 winner student ROV has been successfully commercialized this year. The supply from  Institute of Marine Technology Problems was for Russian Far East Maritime State University  for educational as well as coastal and port/harbor applied  marine research
This paper reviews relatively fast evolution showing that participation in student’s competitions opens the doors to industry. Details of development project and ROV itself  described pointing the evolution from student “toy” to real product. The issue of growing demand in UUV operator/technician staff is presented from educational establishment’s side.
]==],
    image = "edu3presimg.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "220",
  },

  {
    title = "SENSE IT",
    fulltitle = "SENSE IT - Student created water quality sensors",
    presenters = { "Liesl Hotaling", "James Bonner", "William Kirkey", "Peiyi Lin", "Susan Lowes", "Temitope Ojo", },
    abstract = [==[
The SENSE IT project provides high school students the opportunity to build, calibrate and test a set of sensors and circuits, to measure a variety of physical quantities. To build and understand their sensors, student use a wide range of core knowledge of mathematics and physical science, as well as learning practical technology skills such as soldering and debugging circuits. Then students interface their sensors with computers, write programs to gather raw signals from the sensors, implement calibration curves, and perform data manipulation and data logging. Students then program their own communications protocols for wireless data transmission and connect their computerized sensor stations together to form a distributed wireless sensor network.

SENSE IT promotes student awareness of the interdisciplinary nature of modern engineering and the interdependence of diverse areas of science and math. The theme of environmental stewardship and sensor systems provides: 1) a motivating and meaningful scenario for learning a wide range of core math, science and technology topics, 2) an engaging link between biological, physical and social sciences and 3) a cutting-edge example of science and engineering research, delivered directly into the classroom in a particular area of growing importance and workforce need.
]==],
    image = "sense-it.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "220",
  },

  {
    title = "ROVs in education",
    fulltitle = "An educational outreach program for STEM based education",
    presenters = { "Mark Gleason, PhD", "Gary Reynolds", },
    abstract = [==[
The Great Lakes Naval Memorial and Museum (GLNMM) has developed a program that utilizes ROV kits and a professional build ROV to promote STEM based education for all ages. These programs utilize underwater technology to provide educational activities that promote a greater understanding of the underwater environment through direct interaction. The technology used in these programs are small underwater robots referred to as remotely operated vehicles or ROVs. These ROVs can be created, designed and build by students or other program participants such as teachers. GLNMM has created a traveling educational outreach program that includes classes of different lengths and levels for people of all ages and backgrounds. These classes can be offered at locations throughout the region and include two separate experiences. The first experience is creating and building a ROV that the participants can use to explore the underwater environment. The second part is the opportunity to drive a professionally build ROV to explore underwater to depths of several hundred feet. Most dives are in only in depths of fifty feet or less. This technology allows the participants an experience similar to being a SCUBA diver.
]==],
    image = "gleason-reynolds.jpg",
    materials = "gleason.docx",
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "220",
  },

  {
    title = "Capping gulf oil well, high school style!",
    fulltitle = "\"Phorcys\", MATE 2011 Champion ROV Overview by Jesuit High School Robotics Team",
    presenters = { "Rolf Konstad", },
    abstract = [==[
Jesuit High School successfully completed missions designed by the Marine Advanced Technology Education (MATE) Center to cap a flowing oil well and assess environmental damage, simulating the challenges that BP encountered in the gulf oil spill.  The MATE Center holds an annual ROV competition and hosts high school, college, and university teams from around the world.  The 2011 competition was held at the NASA Neutral Buoyancy Lab in Houston, Texas, adding the challenge of withstanding a depth of 40 feet.  The Jesuit High School Robotics Team, with a budget of $15,000 and a schedule of 20 workdays, manufactured the winning ROV with modular accessories specifically designed for each task, Ethernet communications, and a vectored control system.  This presentation will provide an overview of the ROV, including the design process, control system, accessories, and potential full scale applications.

## Team Members ##

-	Evan Arnold (senior, fourth year member) piloted the ROV "Phorcys" during the 2011 competition. He is the Operations Manager for this year’s competition.
-	Spencer Breining-Aday (junior, second year member) was machinist for the wellhead cap last year. Spencer machines parts for the 2012 competition.
-	Joe Griffin (senior, fourth year member) assisted with the build process of the accessories and was part of the deck crew at NASA.  Joe is the Competition Manager for this season.
-	Chris Konstad (junior, third year member) programmed the electronics on the ROV and is now head of software development for the 2012 competition.
-	Nick Sopwith (sophomore, second year member) worked on the design and build of the wellhead cap. Nick currently works as a microcontroller programmer.
-	Jesse Tambornini (junior, second year member) worked as a CAD designer. Jesse still creates computer mockups of each component and now trains new members for future competitions.
-	Louis Styer (junior, third year member) maintains and updates the team website. He now coordinates picture and video displays for the team on the website.
-	Drake Nylund (junior, third year member) created computer mockups of each ROV component and is transitioning to software development.
-	Alan Luu (senior, second year member) worked on the design and build of the wellhead cap. This year Alan is leading the design and build of telemetry sensors.
]==],
    image = "phorcys.jpg",
    materials = "highschool.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "220",
  },

  {
    title = "MATE ROV Competition",
    fulltitle = "Think of Yourselves as Entrepreneurs - How the MATE ROV Competition is challenging students to develop 21st century workplace skills",
    presenters = { "Jill Zande", },
    abstract = [==[
For 10 years, the Marine Advanced Technology Education (MATE) Center’s international ROV competition program has challenged students to think creatively, work as part of a team, and apply technical skills in new and innovative ways.

However, in 2011 the Center took a new approach to encouraging students to develop 21st century workplace skills.  Instead of teams, MATE asked students to think of themselves as entrepreneurs and to form “companies” instead of “teams.”  We challenged them to develop an understanding of the breadth of business operations and to structure their company with the appropriate personnel – from CEOs to CFOs, Software Engineers to Marketing Directors,  Operations Managers to PR Specialists.  Not only were they expected to design, build, and perform, their “product,” they also had to sell it to their client – in this case, the MATE Center and the industry professionals who volunteer as competition judges.

The response was positive – and powerful!  Students and mentors took the challenge very seriously.  They came up with creative names for their companies and, in some cases, developed a company logo.  They identified the positions necessary for a business to run successfully and assigned students to those roles.  They created business cards and marketing materials that described their company and product line.  (One company developed an “app” that is available for download on the iTunes store.)  They wore suits and ties during their engineering presentations.  They gave cost and delivery estimates for their product and, if they had competed before, their record of past performance.

Based on this success, the MATE competition will continue its entrepreneurial approach and add to it in 2012.  For example, in order to reach out to and further engage students with an interest in technology but an aptitude in the arts, MATE will ask companies to develop PR “kits” and put them into practice by targeting their local media.
]==],
    image = "rovcomp.jpg",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "220",
  },

  {
    title = "Shipwreck as Educational Model",
    fulltitle = "Educating the next generation of scientists with real world scenarios:  Modeling a shipwreck for the MATE Center ROV competition",
    presenters = { "Matthew Gardner", },
    abstract = [==[
In an effort to provide realistic educational experiences for students, the MATE Center works closely with marine industry professionals to develop ROV competition mission tasks that model real world scenarios.  The goal of the MATE Center missions is to present challenges students might experience in the field and familiarize them with another aspect of the underwater industry.

The 2012 mission theme deals with 20th century shipwrecks and their potential environmental threats.    Working with the Professional Marine Explorers Society, the MATE Center is developing tasks that include surveying the wreck and removing fuel from a corroding tank.  Replicating this complex problem involves creating mission props that are designed with inexpensive hardware store technology, allowing teams around the world to copy MATE Center designs.  Underwater missions also take place in a pool environment, with clear, warm water, generally less than 6 meters deep.  Working within these limitations, the MATE Center mission tasks model real world events that students might experience in the underwater industry.
]==],
    image = "eduwreck.jpg",
    materials = "gardner.pptx",
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "220",
  },

})
maketrack("div", { --Commercial Diving

  {
    title = "Advanced Electronic Technologies for Divers",
    fulltitle = "The application of advanced electronic technology in diver hand held systems, to increase diver capability, efficiency and safety, for both military and commercial divers.",
    presenters = { "Jim Garrington", },
    abstract = [==[
This presentation will cover new technologies available to divers in commercial, military or scientific roles that will provide them with more capabilities, and a safer work environment.

Off the shelf technology now exists to give divers the ability to see and work in zero visibility, detect and track buried objects, accurately navigate over large distances, inspect structures, as well as gather accurate bathymetric / hydrographic data.

This presentation will present an overview of these new technologies and provide examples of how they can be used by different types of divers to offer new services, as well as make existing jobs safer and more efficient.

This Presentation will deal with the following examples:

Commercial Diving;
Buried pipe and cable tracking, Structural inspections, searches

Military Diving
MCM operations, Rapid beach profiling, covert operations, SAR operations

Scientific diving
Archaeological mapping, bathymetry

Law Enforcement
SAR operations, Crime scene investigations
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "AEP Diving Contact Training Program",
    fulltitle = "Training Power Plant personnel to work with Divers:  AEP continues the \"Diving Contact\" training program and adds an Advanced Program for Mixed Gas Diving.",
    presenters = { "Will F. Hux", "David Scarberry", },
    abstract = [==[
American Electric Power, a Sustaining Member of ADCI, continues to conduct training of its employees in the rules and regulations of commercial diving via OSHA, US Coast Guard and the ADCI Consensus Standards.  Training programs are conducted each year at selected AEP facilities for new students and re-qualifying Diving Contacts.  Criteria for becoming a Diving Contact at AEP is delineated in their program and requires each person to be nominated by management, complete the program and a written examination.  They serve in the program for a period of three years and must re-qualify by attending refresher training.  An AEP Diving Contact works directly with diving contractors at any AEP facility.  They are familiar with all diving regulations and the Consensus Standards, including Rev. 6, and can work the diving tables for repetitive dives, surface decompression on air or oxygen for example. Since they understand parts of our industry; they really make it easier for a diving contractor to communicate with them.  Dave Scarberry has been their Diving Coordinator and the originator of their program since inception and is responsible for its development and administration.  Will Hux is the instructor from MESCO/ Stroud Diving & Hydrography and wrote the training curriculum for the classroom portion of the training.  They make a strong team in presenting a safety program of which is an industry first.
]==],
    image = "div-training.gif",
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "221",
  },

  {
    title = "Electronic Recording Diving & Chamber Dives",
    fulltitle = "Electronic Recording of Diving & Chamber Dives",
    presenters = { "Will F. Hux", },
    abstract = [==[
While it has been common industry practice to rely on hand written dive logs for divers and chamber runs for decompression, we have to rely completely on the integrity, quality, and capability of the human element to make detailed time and data entries without errors and while possibly being distracted by a great many things on deck.  Our company has been using electronic recorders and pressure sensors on chambers for years but now there exists a small device which we've been testing and have in practice for years which we issue to each diver and place in each of our chambers.  It records the time, depth, and temperature of the entire dive including the rates of ascent and descent.  They are a remarkable tool to counsel employees who violate descent and ascent rates or supervisors who allow surface intervals to go beyond the 5 minutes allowed between surfacing a diver and surface-decompression.

As a safety device, the recorders are completely indelible and the data is stored where it cannot be tampered with or changed.  They couple magnetically to upload data and there are no plugs or ports.  the only battery comes installed at the factory and they last approximately 10 years depending on usage.  These record chamber runs with precision and are completely intrinsic and sealed so there is no need to worry in an oxygen environment.  Testing is underway in our deep hyperbaric testing chamber to determine accuracy and integrity of its program and depth capability.

I hope to present this device and share the safe technology with all our members in January.
]==],
    image = "recording.jpg",
    materials = "recording.ppt",
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "U.S. Navy Diving System Certification Survey",
    fulltitle = "U.S. Navy On-Site Diving System Certifcation Survey and System Re-Entry Control Records",
    presenters = { "Michael Frey", "Brendan Murphy", },
    abstract = [==[
Provide procedures used to conduct on-site system certification survey of U. S. Navy Diving Life Support Equipment.  Present the detailed checklist and requirements used to inspect the material and operational condition of the system.  Discuss U.S. Navy diving system maintence requirements and the system used to track the completion of required maintenance.  Present the documentation used by maintenance personnel to document re-entry and work completed on a certified system.  Discuss the documentation required for replacing components of a certified diving life support system.
]==],
    image = "frey-murphy-pres.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 3600,
    room = "221",
  },

  {
    title = "Using Quality Management Systems to Improve Diving Operations",
    fulltitle = "Understanding the requirements and the benefits of implementing an integrated Management System to improve Diving Safety and Quality of Operations",
    presenters = { "Miriam Boudreaux", },
    abstract = [==[
This presentation is aimed at highlighting the benefits of implementing a management system that integrates quality and safety to improve the overall operations and safety performance of a Diving organization.  Organizations that have an established quality management system enjoy higher levels of customer and employee satisfaction.  Employees feel empowered to contribute to the success of the system and also are able to make better decisions because the organization’s processes are in control.  But how can an organization achieve this level of operational excellence?

In this session we will answer the following questions:

1.	What is a Quality Management System and how does it relate to Safety?
2.	List of Diving companies throughout the world who operate under a Quality or Safety Management System certified to ISO 9001 and/or OHSAS 18001.
3.	10 Things Diving companies can do to get a Quality/Safety Management System off the ground.
4.	10 tangible benefits of implementing a quality/safety management system in a Diving organization.

Attendees will also receive a checklist at the end of the session that can be used to identify the gaps in their quality/safety management system within their organizations to determine areas that need further work in order to achieve full compliance.
]==],
    image = "miriam-pres.gif",
    materials = "boudreaux.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "USCG Acceptance of non-ASME PVHOs",
    fulltitle = "Case Studies in US Coast Guard Approval of PVHOs Not Constructed As ASME Pressure Vessels.",
    presenters = { "Bart Kemper", },
    abstract = [==[
The Code of Federal Regulations specifically adopts the ASME Boiler and Pressure Vessel Code and the PVHO as the standards for diving systems in US waters.  Not all diving systems are made to ASME standards.  This presentation examines several case studies of where the US Coast Guard approved non-ASME vessels.
]==],
    image = "satsystem.jpg",
    materials = "non-asme-pvhos.pdf",
    start = { day = 24, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Improved Glove Technolgy entering the Diving Field",
    fulltitle = "",
    presenters = { "Chad Quibodeaux", },
    abstract = [==[

]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "221",
  },

  {
    title = "Pile Restoration and Protection",
    fulltitle = "FX-70 Inert Corrosion Free Fiberglass Jacket System for Pile Restoration and Protection",
    presenters = { "Carl Scheffel", },
    abstract = [==[
Originally presented at the Transportation Research Board in January 2011.  This paper discusses systems and techniques that have been utilized to restore the structural integrity and protect concrete, steel, and woodpiles for more than 35 years. Many bridges in active use today are well beyond their intended designed life.  Since it would be much too costly and time consuming to replace these bridges with new bridges, proven repair and rehabilitation systems are critical to the life and safety of these structures. This paper will discuss the use of the FX-70 Inert Corrosion Free fiberglass jacket system that utilizes FX-70-6 Hydro-Ester Multipurpose Marine Epoxy and FX-225 Underwater Mortar specifically designed for bridge pile restoration.
]==],
    image = "bridge.jpg",
    materials = "pile-restoration.ppt",
    start = { day = 24, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "The Medical Capabilites & Expectations of Today's DMTs",
    fulltitle = "",
    presenters = { "Dr. Brian S. Bourgeois, PE", "Richard Meister", },
    abstract = [==[

]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Are Today's DMTs Properly Trained?",
    fulltitle = "The Evolving role of DMT - Training and Performance",
    presenters = { "Dr. Brian S. Bourgeois, PE", "Richard Meister", },
    abstract = [==[
The diving industry is made of individuals that perform many duties in often
challenging circumstances. These individuals are asked to perform as divers,
hands, operators, and tenders. The work above and below the surface of the
water is not all that different. The Dive Medic is often seen as the
on-scene medical care provider to divers. Quality medical care is
indispensable. In the case of a diving accident the DMT is asked to step-in
and administer care. This care will often not be associated with the direct
application of pressurized gas. In fact, many conditions arising from
decompression/recompression scenarios are actually medical in basis. The DMT
should be educated to act as an adjunct to the treating physician in all
such cases. This will require a new approach to the education of the vital
individuals.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 3600,
    room = "221",
  },

  {
    title = "Saturation Diving and the Nervous System",
    fulltitle = "The High Pressure Nervous Syndrome (HPNS) and Working Saturation Dives to over 2000 fsw",
    presenters = { "Peter Bennett", },
    abstract = [==[
In 1966-68 the author first discovered HPNS at 600 fsw and 800 fsw.  Amerlioration first proved possible by selection of less susceptible divers, a very slow compression rate and stages for adaptation, but something more was required for depths greater than 1,000 fsw.  The author developed TRIMIX (He/N2/O2) to prevent such HPNS.  Experimental dives were made from the 1970s to 1990s at Duke University Medical Center ending with 4 deep saturation dives leading to a record depth of 686 m (2,250 fsw).  These were then continued at the German Underwater Simulator (Hamburg). At first, there were 14 deep working dives (8 hours welding per day) breathing TRIMIX 5 with little or no HPNS to 600 m (2,150 ft).  Later, further TRIMIX 5 dives with a 13 man diver team and 2,662 man days of saturation and 983 days of successful welding at 450 m (1,440 fsw) were conducted, proving the success of TRIMIX 5 in prevention of HPNS with no long term effects.
]==],
    image = "duke-dive-2250ft.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 3600,
    room = "221",
  },

  {
    title = "Hyperbaric Vital Signs",
    fulltitle = "Vital Signs monitoring in a Hyperbaric environment",
    presenters = { "Chris Peppler", },
    abstract = [==[
Commercial Diving is instrumental to the offshore oil and construction industries, with thousands of hours spent sub surface every year. With this being said sickness and hyperbaric illness are a very real threat to all divers. This paper explores what care givers whom provide emergent health care to divers have available to aid in monitoring vital signs for the ill or injured patient. With the move into deeper waters and more demanding work the health and well being of a diver has become a top priority. Further the OGP has published guidelines requiring the ability to monitor the cardiac rhythm of a diver in a chamber. This paper will describe the problems and solutions to patient monitoring at depth.
]==],
    image = "hyperbaric-ecg.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Diving & Decompression Potpourri",
    fulltitle = "",
    presenters = { "Tony Alleman, MD MPH", "Joe Serio, MD", "Robert Bourgeois, MD MPH", },
    abstract = [==[
This session will attempt to cover answers to questions frequently asked by divers, diving companies and diving schools regarding fitness to dive, medications and diving, factors involving decompression sickness and a variety of other topics.  There will be a generous question and answer period for questions from the audience related to fitness to dive, decompression sickness and similar topics.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 5400,
    room = "221",
  },

  {
    title = "McCray Diving Helmet",
    fulltitle = "Pacific Northwest Modified Diving Helmets, from Hockett to McCray to Clark",
    presenters = { "Sid Macken", },
    abstract = [==[
The contributions of Northwest divers to the craft of commercial diving are significant. Divers have often modified standard helmets to suit their specific needs and, beginning in the 1930s and into the 1960s, Seattle area divers developed a very distinctive helmet with several advantages over the standard gear. The culmination of this design process was a swimmable diving helmet that, but for differing construction materials and lack of swim fins, remains quite comparable to the equipment worn by modern commercial divers. This is the story of the progression from the standard diving helmet design to what became known as the Northwest Modified Diving Helmet or, since it is often named for its major contributor, the McCray helmet.
]==],
    image = "helmet.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 2700,
    room = "221",
  },

  {
    title = "Diving Accident which claimed five lives aboard USS GRAYBACK (SS-574)",
    fulltitle = "How the USS Grayback (SS-574) accident in 1982 has led to improvements in submarine diving safety",
    presenters = { "David J Kelly", },
    abstract = [==[
The principal objective of this presentation is to provide participants with a detailed perspective on a seminal event in the history of Navy submarine based diving systems.

The diving accident which claimed five lives aboard USS GRAYBACK (SS-574) in January 1982 led to numerous changes in how the Navy designed, built, maintained and operated complex submarine based diving systems.  The lessons learned from this accident and the actions taken to ensure safety in future designs and operations are ones that can and must be applied to all such high-risk evolutions, and should be understood by all those responsible for such work.

A full description of the system in use at the time of the accident will be provided, with photographs and diagrams, to explain the layout and operation of the starboard hangar aboard GRAYBACK where the accident occurred.

The conversion work done at Mare Island Naval Shipyard will be discussed, along with contractor oversight issues.  The discussion will also cover other causes leading up to the accident including maintenance and training shortfalls and operator actions.  In addition, corrective actions specific to GRAYBACK and lessons learned applied to future systems will be presented.
]==],
    image = "grayback.jpg",
    materials = "grayback.pdf",
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 15 },
    length = 2700,
    room = "221",
  },

  {
    title = "Underwater Burning and Welding Safety",
    fulltitle = "Underwater Burning and Welding Safety",
    presenters = { "David Scarberry", },
    abstract = [==[
This subject will address a recent accident that occured to a diver while performing an underwater welding operation.  The resulting investigation and root cause analysis lead to the identification of several unrealized conditions that aided in creating this "perfect storm."  These included such items as unaccounted power sources, unfamiliar with tools, unknown actual amperage from welder, and adjacent work groups.  The end result was a new, and more detailed JHA was created that addresses these hazards.  This JHA includes all of the best safet practices as laid out by the ADCI, but also takes it to the next level of pre-job set ups, and a firm commitment by AEP on how all U/W buring and welding work will conducted across the entire fleet.
]==],
    image = "welding.gif",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Analox Hypergas MkII Training Taster",
    fulltitle = "Highlights from the full Analox Hypergas MkII training course",
    presenters = { "Simon Lunt", "Larry Janicek", },
    abstract = [==[
This session will be jointly presented by Simon Lunt, Analox & Larry Janicek, LBJ Maritime.  It is intended to highlight some of the salient points in relation to monitoring hydrocarbons in the diving bell which are covered in greater detail in the official Analox Hypergas MkII training course offered by both Analox and LBJ Maritime.  This taster session will help delegates to determine if the full course is suitable for them.

There will also be a short section in the presentation which will update delegates on Analox's project relating to the monitoring of H2S in the diving bell.
]==],
    image = "hypergas.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Legal Update 2012",
    fulltitle = "Legal Update 2012 For the Commerical Dive Industry",
    presenters = { "Rick Lesser", "Michele Nelson Bass", },
    abstract = [==[
While our previous legal seminars have focused on the determination as to whether divers working offshore or on navigable waters were actually Jones Act Seamen, the last two years have seen a sea change (pun intended) in the remedies available to workers offshore.

The 1995 case of <cite>Chandris v. Latsis</cite> set up the basic ground rules regarding who generally was a Seaman (those working in the service of the vessel at least thirty percent of their time, etc.), and the U.S. Supreme Court in 2005 finally nailed down a definition of what constitutes a vessel.

Now, following the seminal case of <cite>Atlantic Sounding v. Townsend</cite> in 2009, courts all over the country have rejected the notion that punitive damages are not allowed to Seamen who are denied maintenance and cure, or more importantly, are injured on an "unseaworthy" vessel.

These rulings reverse the longstanding (since 1990 in <cite>Miles v. Apex</cite>) rule that Seamen were not allowed to collect punitive damages under any theory, but now punitive damages have been granted in cases involving failure to pay maintenance and cure, unseaworthy vessel conditions, and more recently courts have allowed a loss of consortium claim for a Seaman's spouse.

This expansion of remedies under general maritime law needs to be addressed by those employing Seamen and divers (who certainly now appear to fall into the Seamen class), so understanding the consequences of non-compliance and properly insuring for potential losses is a critical need for all maritime employers today.  This seminar will provide that information.
]==],
    materials = false,
    start = { day = 26, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "221",
  },

  {
    title = "Domestic Diver Training for International Certification",
    fulltitle = "International recognition of United States' domestic commercial diver training",
    presenters = { "David Parkes", },
    abstract = [==[
When the Diver Certification Board of Canada (DCBC) was conceived in 2001 divers asked that it be set up in such a way that DCBC certificates would be accepted anywhere in the world they wanted to work; divers wanted to carry just one certificate of professional competency.   The CEO of the DCBC travelled to the UK to confirm that the new Canadian certificates would continue to benefit from the international recognition that the National Energy Board certificates had received.

The Divers Institute of Technology in Seattle, Washington was the first US school to realize the benefit of international recognition of their diver training; they modified their training program and applied for accreditation by the DCBC in 2003.  Since then the Commercial Diving Academy in Jacksonville, Florida and the Minnesota Commercial Diving Training Center in Brainerd have also become accredited by the DCBC and Santa Barbara City College of Santa Barbara, California is just a few steps away from accreditation.  International recognition means that US graduates of those schools are certified to work almost anywhere in the world.

The paper will discuss the governance of the DCBC, the competency standard on which certification is based, the process to certify divers and the process to achieve accreditation.  The paper will also touch upon the work of the DCBC to retain and enhance their international recognition.
]==],
    image = "divcert.png",
    materials = "parkes-intl-cert.ppt",
    start = { day = 26, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "221",
  },

  {
    title = "Using ISMERLO (relating to the KOOSHA1 sinking)",
    fulltitle = "Using a rescue coordination system to support multinational and multi-organizational rescue responses",
    presenters = { "Bill Orr", },
    abstract = [==[
The advent of web based coordination has enabled significant improvements in coordinating global rescue operations.  The International Submarine Escape and Rescue Liaison Office and its web based system located at http://www.ismerlo.org enables coordination across multinational and multi-organizational boundaries in support of incidents like KOOSHA 1.

The presentation will look at a short history and the development of the current capabilities of the ISMERLO rescue coordination system. Then look at incidents like the rescue of the AS-28 PRIZ mini submarine off Kamchatka in 2005 and other contingencies operations like the KOOSHA 1. Discussion will include options for the future to support the local Rescue Coordination Centers (RCCs) and initiatives for further support the International Aeronautical and Maritime Search and Rescue.  Future options could include development of a stand-alone system managed and supported by the offshore industry or options for integration into the existing ismerlo.org system.
]==],
    materials = false,
    start = { day = 26, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 3600,
    room = "221",
  },

})
maketrack("si", { --Sensors and Instruments

  {
    title = "Inertial NAV system for small ROV",
    fulltitle = "Using an inertial navigation system for small and micro ROV",
    presenters = { "Maurizio Banfi", },
    abstract = [==[
In many applications, acoustic navigation systems (such as the commonly used USBL) cannot provide accurate positioning information. Because of multiple sound reflections, for instance, acoustic systems have poor performances in shallow water or highly cluttered areas, such as in a port environment, close to piers and various underwater structures. The users of large and very complex ROV's solve the above problem by outfitting their vehicles with Inertial Navigation Systems (INS) and Doppler Velocity Logs (DVL) that extend the use of their equipment much beyond the capabilities of acoustic systems. Unfortunately, though, this kind of equipment is not available to the users of small ROV, because of size, power demand and price reasons.

The ROV & Diver TRACKER is a complete navigation system that includes a Fiber Optic Gyro (FOG), a DVL and multiple support sensor, suitable for installation into small and micro ROV's. This paper describes the system and the results obtained onboard a VideoRay micro ROV, where the TRACKER was integrated with both the vehicle and a BlueView SONAR.
]==],
    image = "inertial-nav.jpg",
    materials = "banfi.pdf",
    start = { day = 25, month = 1, year = 2012,
      hour = 08, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Through-the-sensor Multibeam control of ROVs",
    fulltitle = "Multibeam Imaging Sonar-Track, through-the-sensor control for microROVs",
    presenters = { "Ed Cheesman", },
    abstract = [==[
This presentation delves behind the scenes to provide a series of examples on how this new generation of acoustic-based imaging and measurement technology is being used to automate ROV navigation, improve AUV efficiency, and revolutionize the underwater construction and maintenance industries.

The rapid adoption of 2D MultiBeam Imaging Sonar (MBI) has already made real time, water-clarity independent situational awareness a reality for today's well equipped ROVs. In addition to their fast update rate, smart sonar functions like advanced target tracking algorithms, exclusively licensed from SeeByte, now enable MBI-based automated solutions in addition to crisp imagery.

Compact, lightweight, and low-power 3D MicroBathymetric systems can nearly double efficiency in AUV side scan surveys. Deployed as part of an integrated bottom survey system with side-scan or SAS sonar, a 3D MicroBathymetric sensor can fill the nadir gap directly below the AUV with high resolution 3D imagery and data - eliminating the need for overlapping runs and minimizing survey time.

A similar paradigm shift is occurring in the area of underwater 3D scanning, with highly accurate modeling & measurement now possible thanks to the BV5000 3D MultiBeam Scanning Sonar and geospatial data handling techniques currently employed by the terrestrial and airborne laser survey communities.
]==],
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Mapping, Integration of Inertial and Multibeam on ROVs",
    fulltitle = "",
    presenters = { "Ian Florence", },
    abstract = [==[
The concept of ROV subsea inertial navigation and ROV mounted Multibeam has been around for a number of years. In a recent offshore project the two systems were tightly integrated so the inertial system provided Heading, pitch, roll and position directly to the Multibeam. The paper discusses the integration processes – good parts and bad. In the results errors in the system are shown and how they were resolved. Also demonstrates the 2 way LBL and inertial for ROV navigation. The paper gives real project result from the Gulf of Mexico with some spectacular images.
Ian Florence
Subsea Construction Manager
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Description of Solutions Using Sonar Imaging",
    fulltitle = "Description of Equipment and Sonar Tools Available for Underwater Inspection and Construction Monitoring",
    presenters = { "Mark Klein", },
    abstract = [==[
A description of various sonar imaging tools readily available to contractors, engineers, and owners associated with underwater infrastructure and construction.  Specifically, inland applications are provided with the goal of sharing exciting opportunities to better communicate and monitor underwater work.  This presentation will review basic imaging techniques, share several samples of sonar imaging recently used to support underwater construction, monitor water intake structures, dock and ship berth maintenance, and dredge operations.  Discussion of how to expand the use of sonar in various markets which can enhance communication, and improve safety on underwater projects.
]==],
    image = "klein-sonar1.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Case Study of Remote Sensing in Construction",
    fulltitle = "A review of several imaging methods used in a recent construction project to monitor dredging, diving, and progress of a diffuser installation in black water.",
    presenters = { "Mark Klein", },
    abstract = [==[
Share the benefits and results of using scanning and multi-beam sonar imaging systems on two recent underwater construction projects.  Share samples and results of using both Tritech and Kongsberg systems.  These case studies will review leased and owned systems and how they provided cost effective and safe solutions.  The two case studies provided will include the installation of a new outfall including monitoring dredge and diving operations.  The second case study will show imaging solutions used to improve quality control and safety during the desilting and cleaning of intakes at a Nuclear power plant after Hurricane Irene.  These projects provide examples of sonar imaging readily available for incorporation into a majority of underwater construction projects, especially for inland black water projects.
]==],
    image = "klein-sonar2.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Realizing True Benefits of Real-Time 3D Sonar",
    fulltitle = "Realizing the True Benefits of Real-Time 3D Imaging Sonar Technology",
    presenters = { "Blair Cunningham", },
    abstract = [==[
This paper discusses some of the unique benefits of the use of real-time 3D imaging sonar technology as a multi-discipline sensor. This technology can provide exceptional data in real-time monitoring applications as well as mapping and survey applications, saving considerable money in complex and time sensitive operations. With the benefit of fully geo-referenced 3D data sets for every ping, the use of CGI (Computer Generated Imagery) is possible, allowing a fully immersive "augmented reality" environment for operators, engineers and clients all in real-time. In addition to the real-time monitoring benefits, 3D imaging sonar provides huge data redundancy which is available for in-line processing algorithms to improve accuracy, provide automatic noise and clutter removal, and produce incredible image detail over what could be normally achieved by current 2D and multibeam sonar technology.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Cathodic Protection Probes - Diver and ROV",
    fulltitle = "Cathodic Protection Probes for Diver & ROV Interface - What's New?",
    presenters = { "Jim Britton", },
    abstract = [==[
The presentation will review types of instrument currently avaialble, their application and limitations.  Practical tips to ensure correct equipment function and common pitfalls which lead to inaccuarate surveys will be discussed.  The talk will present various case histories on diver surveys, ROV pipeline surveys and general topside cathodic protections surveys. Various probe types will be discussed along with emerging technologies for AUV surveys.
]==],
    image = "probe.jpg",
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Scanning Sonar Surveys",
    fulltitle = "Using the MS 1000 scanning sonar for creating baseline surveys on large scale projects",
    presenters = { "Brian Abbott", },
    abstract = [==[
Using the MS 1000 scanning sonar for creating baseline surveys on large scale projects. These large scale projects can be but not limited to bridges, dams, ports & harbors and canal systems.  Creating these baseline surveys allows for better engineering assessment of structures and site conditions for homeland security issues.  Changing the orientation of the sonar allows one to image in different plans and obtain information necessary to build a three dimensional structure of the site.  All of this information can be tied into a GPSRTK system allowing for one to reacquire information at a later date and time.
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "222",
  },

  {
    title = "Early leak detection",
    fulltitle = "Hydrocarbon Sniffers In Mobile Subsea Flowline Monitoring - A Field Report",
    presenters = { "Daniel Esser", },
    abstract = [==[
Exploration and production activities for oil and gas are steadily increasing in subsea areas. Various methods exist to detect and localize subsea oil and gas emissions but there is still a lack of understanding the processes of subsea leakages, and technologies to detect and localize emissions from subsea installations at an early stage have to be improved. Detecting and localizing subsea oil and gas emissions means dealing with warm multiphase outflow consisting of oil phase, gas bubbles and dissolved gas (mainly Methane), formation water, mixing with cold seawater, and sometimes even the formation of additional solid gas hydrate phases. Recent field observations and hydrodynamic models of Methane-rich fluid transport at natural seeping sites indicate the distinct behavior of Methane-dominated fluids in seawater.
A successful leak detection strategy must focus on the different physicochemical fluid characteristics of Methane as a tracer for subsea oil and gas emissions in general. The feasibility of Hydrocarbon Sniffers for the detection, localization and subsequent validation of subsea oil and gas emissions has been proven in several ROV- and AUV-borne subsea flowline surveys from 2008 until today. Field experience and latest results will be presented for different environmental backgrounds, reaching from arctic areas to extreme shallow waters.
]==],
    image = "contros.jpg",
    materials = true,
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "Generating 3D Models from Underwater Video",
    fulltitle = "Generating Photorealistic 3D Models from Underwater Inspection Video",
    presenters = { "Neil Cavan", "Jason Gillham", },
    abstract = [==[
Video inspection by a remotely operated vehicle (ROV) is simple, cost effective to deploy, and widely used. However, this inspection method suffers from the limitations of underwater visibility. Since it is only possible to observe a small section of an underwater asset at any one time, long videos are necessary to fully inspect large assets. The information provided by inspection videos is valuable, but it can be time-consuming to assess the state of an underwater asset based on many hours of video.

This presentation demonstrates a software tool developed by 2G Robotics for generating photorealistic 3D models from underwater video. Computer identified feature points in the video are automatically tracked, and are then reconstructed as a digital 3D point cloud of the asset observed in the video. Once the point cloud has been obtained, it can be surfaced and coloured using image data from the video to create a photorealistic 3D model of the entire asset. The algorithms can work with video from any camera, and need only the video itself as input: no special calibration object or motion sequence is used. Since no change to the inspection workflow is required, this technology can create a 3D model from archived inspection video.

Using a photorealistic 3D model as the starting point for underwater asset inspection allows the state of the entire asset to be understood more quickly and intuitively compared to using video alone.  This technology has the potential to alter the post inspection work-flow, saving time and providing greater asset understanding, resulting in reduced project costs and risks.
]==],
    image = "modelpoints.jpg",
    materials = "cavan.pdf",
    start = { day = 25, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "222",
  },

  {
    title = "HD 3D photogrammetric modeling applications",
    fulltitle = "High definition 3D photogrammetric modeling offers unprecedented levels of geometric accuracy for post-incident analysis and repair of damage to subsea components",
    presenters = { "Anthony Hall", "Marie McCormick", "Alastair Trower", },
    abstract = [==[
The presentation will encompass a step through the basics of digital 3D photogrammetric modeling hardware and techniques, followed by a series of case studies that highlight the flexibility and value of the technology to provide highly accurate geometric information of damaged subsea components that can then be used to conduct structural analyses (e.g. FEAs). design tooling, and and verify design repairs. Case studies will include but not be limited to an impact-damaged well head, a deepwater pipeline damaged by anchor impacts, and heavily corroded mooring components. The presentation will finish with some discussion of the opportunities by this technology in combination with advances in metallic and polymer 3D printing technologies
]==],
    materials = false,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "222",
  },

})
maketrack("wrex", { --Shipwrecks

  {
    title = "USS Houston/Princess of the Stars",
    fulltitle = "VideoRay Expeditions to the site of the USS Houston: Indonesia / Case Study: M/V Princess of the Stars Tragedy",
    presenters = { "Dave Phillips", },
    abstract = [==[
### USS Houston ###

Dave Phillips will explain the challenges faced while diving in high current with dangers above and below the surface on the USS HOUSTON, sunk during WWII off the coast of Indonesia. The goal of the team has been to preserve the memory of this World War II battle by documenting the Houston with video and sonar images as this vessel is slowly being claimed by the sea. During multiple trips, expedition members treat the wreck site with the dignity and sanctity deserved, and have worked closely with surviving USS Houston sailors and family members. VideoRay has been a strong partner and sponsor in making these missions to the Houston possible.

### M/V Princess of the Stars ###

David Phillips travelled to the Philippines in 2008 to work with Titan Salvage Company on salvage efforts for a major ferry tragedy. The M/V Princess of the Stars, carrying several hundred people tragically capsized during a major typhoon leaving only a handful of survivors. During this salvage, VideoRay played a part in the early assessment and overview of the wreck. David will present footage of this wreck as case study for melding use of VideoRay ROVs into commercial salvage and other industrial applications.
]==],
    materials = false,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Controversial World War I Shipwreck Surveyed with Inspection Class ROV",
    fulltitle = "Inside a Controversial Shipwreck",
    presenters = { "Brian Luzzi", "Steven Van Meter", },
    abstract = [==[
Remains of a controversial World War I shipwreck off the coast of Ireland explored with an Inspection Class Remotely Operated Vehicle (ROV) for a high profile television production in the summer of 2011.
]==],
    image = "lusitania.jpg",
    materials = true,
    start = { day = 24, month = 1, year = 2012,
      hour = 09, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Shipwreck survey and artifact ID",
    fulltitle = "A Comprehensive Procedure for Survey and Artifact Identification Using Iver2 - A Case Study",
    presenters = { "Ramprasad Balasubramanian", },
    abstract = [==[
In this talk we present a comprehensive survey procedure developed in-house and deployed on a recent survey mission in Mount Hope Bay to locate two ship wreckages using an Iver2. The vehicles were equipped with a Klein Side Scan Sonar, an Imagenex Delta-T multi-beam sensor and a Sontec Doppler Velocity Log (DVL) sensor. We present details on the in water compass calibration procedure that was developed using an Extended Kalman Filtering approach.   In addition, details on mission specification, localization including slant range correction and logging of multi-beam and side-scan sonar data are also presented. The multi-beam and side-scan data are prost-processed for automatic as well as manual artifact identification. Some sample results are also presented. We envision this comprehensive approach to be adopted for  multiple applications such as SLAM, hydrographic survey and underwater inspection missions.
]==],
    image = "rambala-presimg.jpg",
    materials = "rambala.pptx",
    start = { day = 24, month = 1, year = 2012,
      hour = 15, min = 30 },
    length = 1800,
    room = "222",
  },

})

sort(all,pressort)

return tracks
