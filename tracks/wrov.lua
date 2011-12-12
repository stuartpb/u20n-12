local shared = require "shared"
local maketrack = require "maketrack"
return maketrack("wrov", {

  {
    title = "Hydraulic Fluid Performance at Depth",
    fulltitle = "The effect of Depth and Pressure on Hydraulic and Dielectric Fluids",
    lead = {
      first = "Mark",
      last = "Miller",
      org = "Terresolve Technologies",
      email = "memiller@terresolve.com",
    },
    abstract = [==[
Offshore drilling has been in existence a little over 100 years. Drilling and production depths have accelerated greatly over the past several years and depths over 3000 meters (10,000 feet) are not uncommon.
This move into deeper and deeper waters has presented many technical and environmental challenges for ROVs and related equipment.
One of these challenges is that at the depths and significantly increased pressures that ROVs can see, the physical characteristics of hydraulic and dielectric fluids change. This paper explores the various factors that effect fluid characteristics including; pressure, temperature, viscosity, and type of fluid. It compares and contracts petroleum oils, environmentally safe oils and synthetics. It also includes a comparison of these fluids at atmospheric conditions to isolate any changes solely due to fluid type.
]==],
    bio = [==[
Mark Miller is the CEO of Terresolve Technologies, a Cleveland-based company that provides non-toxic, biodegradable lubricating products. Mr. Miller has a B.S. in Chemical Engineering from Tufts University and an M.B.A. from Manhattan College. He has engineered, sold and marketed lubricants and lubricant additives for over 30 years.
Terresolve's biobased fluids have been extensively proven in the lab and in the field and are renewable, support the agrarian community, and meet federal guidelines for environmentally preferable purchasing.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 9, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Certification of ROV Personnel",
    fulltitle = "A New Competency Certification Scheme for ROV Operating Personnel",
    lead = {
      first = "David",
      last = "Parkes",
      org = "Diver Certification Board of Canada",
      email = "dparkes@divercertification.com",
    },
    abstract = [==[
Since 2003, the Diver Certification Board of Canada (DCBC) has offered certification to commercial diving personnel who can demonstrate that they have sufficient training and experience to enable them to meet the competency requirements of the appropriate section of the Canadian Standards Association (CSA) Competency Standard for Diving Operations (CSA Standard Z275.4). The DCBC also accredits commercial diver training organizations which train to the competency levels of Z275.4.

For the past two years the DCBC has been working with schools, industry and other organisations to develop a certification scheme for ROV operating personnel.

The purpose of certifying the competence of ROV personnel (Pilot/Technicians and Supervisors) is to help ensure the safety of personnel, equipment, assets and the environment and includes the protection of divers who often work in the same underwater work site as a ROV.

In general the levels of certification and the competencies required to obtain certification are designed to meet the requirements of ROV Contractors and ROV end users.
]==],
    bio = [==[
David Parkes M.Ed
David Parkes is the Chief Executive Officer of the DCBC.  He retired from the Canadian Coast Guard in October 2000, following a 35-year career during which he served in a number of positions including Senior Examiner of Marine Engineers in Ottawa and, for seven years, Director of the Canadian Coast Guard College in Sydney, Nova Scotia.  For the final four years of his career he was Director of Technical Services for the Maritimes Region of the Coast Guard.
David was hired as a consultant in early 2001 to create the DCBC and in 2002 he agreed to stay on the first Executive Director.  In 2009, during the development of a policy-based governance structure for the board, David's title was changed to CEO.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 9, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Hard rock coring on steep terrain",
    fulltitle = "Hard-Rock Coring at Steep Terrain Seafloor with a Flipper-Type Crawler ROV",
    lead = {
      first = "Tomoya",
      last = "Inoue",
      org = "JAMSTEC",
      email = "inouet@jamstec.go.jp",
    },
    cos = {
      {
        first = "Akira",
        last = "Asada",
        org = "The University of Tokyo",
        email = "asada@iis.u-tokyo.ac.jp",
      },
      {
        first = "Tokuihiro",
        last = "Katsui",
        org = "Kobe University",
        email = "katsui@maritime.kobe-u.ac.jp",
      },
      {
        first = "Masashi",
        last = "Mochizuki",
        org = "The University of Tokyo",
        email = "moma@iis.u-tokyo.ac.jp",
      },
      {
        first = "Hiroyuki",
        last = "Osawa",
        org = "JAMSTEC",
        email = "osawah@jamstec.go.jp",
      },
      {
        first = "Ken",
        last = "Takagi",
        org = "The University of Tokyo",
        email = "takagi@k.u-tokyo.ac.jp",
      },
    },
    abstract = [==[
Coring at flat even seafloor have been conducted. However, there are of slight difficulty for a conventional ROV to conduct at steep or irregular terrain seafloor because the ROV needs a function or mechanism to keep its attitude tenaciously being subjected to a reaction force.

One of advantageous ROVs for its operation is a flipper type crawler ROV which JAMSTEC has developed. Flipper type crawler system which can rotate a crawler itself provides not only an advantage mobility but also an high performance to hold on.

The authors conducted the running experiment of the flipper type crawler ROVs on sand, cobble, or rock reef seafloor. The authors also conducted an initial hard-rock coring experiment at steep and irregular terrain seafloor off Okinawa.
This paper presents the advantageous mobility of the flipper type crawler ROV which has been confirmed at sea trial and the possibility of hard-rock coring at steep or irregular terrain seafloor with it.
]==],
    bio = [==[
Dr. Tomoya Inoue graduated from the doctorial course of Osaka University.
From 1995 to 2001, he was working in Hitachi Zosen Corporation, as an Engineer and a Chief Engineer for offshore project.
Since 2002 he has been working in JAMSTEC (Japan Agency Marine-Earth Science and Technology) as a Senior Research Scientist. He was involved in the drill ship project as a chief engineer of drilling system and also in the development of the deep-sea ROV (remotely operated vehicle) as a project leader.
His research interests are in offshore deep drilling technology and underwater vehicle.
]==],
    headshot = "inoue.jpg",
    start = { day = 25, month = 1, year = 2012,
      hour = 10, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Repair in less than 60 Minutes",
    fulltitle = "ROV Repair and Return to Work in 60 Minutes or Less",
    lead = {
      first = "Andy",
      last = "Porterfield",
      org = "Schilling Robotics",
      email = "andy.porterfield@schilling.com",
    },
    abstract = [==[
In response to the complexity of the missions they are asked to perform, ROVs continue to become more powerful and complicated in design.  When a component fails, repair tasks can take multiple hours and have a significant economic impact on ROV operators and their customers.  In all instances of major ROV subsystem repairs, the component that needs to be replaced or repaired is located in the second or third tier of the design; gaining access to and repairing the failed component can require multiple hours of work.  For example, a HPU replacement on a conventional ROV can typically take 8 hours.  With an average pipelay vessel day rate of $180,000, the vessel downtime cost of such a task can easily mount to $60,000 or more.

An assessment of this issue showed that it was not feasible to achieve step-change improvements in repair tasks without revisiting the overall system design philosophy and placing a significant focus on the primary challenges of time to repair and ability to perform the repair correctly the first time.  As a result, Schilling Robotics has invested in developing ROV technology that can be repaired within 60 minutes, providing a significant increase in ROV system uptime and customer profitability.

This presentation will review features important in reducing downtime including: modular subsystem design, component accessibility, ease of replacement, and removal of the potential for installation errors during the maintenance process.  Major ROV subsystem examples will be discussed, including the HPU, the electrical power distribution system, and the tether/umbilical terminations.
]==],
    bio = [==[
Andy Porterfield has been a Mechanical Engineer at Schilling Robotics since 2008, and has prior design and test experience in the Aerospace, Railroad, and Highway Safety industries.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Dredging Using Advanced Techniques",
    fulltitle = "ROV Dredging Using Advanced Techniques",
    lead = {
      first = "Hans",
      last = "Kros",
      org = "Oceaneering Intl.",
      email = "hkros@oceaneering.com",
    },
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
    bio = [==[

]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 11, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Integrating Equipment to Work Class ROVs",
    fulltitle = "Considerations When Integrating Equipment or Tooling to a Work Class ROV",
    lead = {
      first = "Steve",
      last = "Barrow",
      org = "Schilling Robotics",
      email = "steve.barrow@schilling.com",
    },
    abstract = [==[
Remotely Operated Vehicles (ROVs) serve as the primary platform for a variety of operations in deep water.  ROVs must often be reconfigured with different tools or sensors to accomplish these missions.  However, integrating new sensors, equipment or tooling to a work-class ROV can be a difficult and time consuming experience.
The lack of standardization between different models of ROVs also makes preplanning the equipment integration difficult.  Taking the time to understand and address the basic considerations and the options available will help to prevent last minute emergencies.
This presentation will provide an overview of the primary concerns when integrating new equipment.  Considerations include the size and weight of the equipment, ROV-specific mechanical attachment points, hydraulic connections, and electrical power and communication requirements.
]==],
    bio = [==[
Steve Barrow, senior applications engineer for Schilling Robotics, has designed ROVs and ROV tooling since 1998.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 13, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Cutting Tools",
    fulltitle = "ROV deployed tools for cutting ropes, umbilicals, cables and pipelines",
    lead = {
      first = "Keith",
      last = "Elliot",
      org = "Allspeeds Ltd. / Webtool",
      email = "keith.elliot@allspeeds.co.uk",
    },
    abstract = [==[
ROV deployed cutting tools are an important part of the subsea toolbox, and are essential equipment for the installation  and decommissioning of subsea tiebacks and other subsea installations.
An overview of the available technologies will be discussed, with particular focus given to the correct selection of the tool to suit the application.  Guidance will be given regarding the safe deployment, use, retrieval and storage of subsea cutting tools, with particular focus on those deployed by ROV to deep water.
Improvements in the strength of wire rope technology and the increasing use of aramid based soft lines pose particular challenges to current cutting technology.  This will be discussed along with improvements that can be made to ensure modern cutting tools are capable of producing the cutting forces required whilst still maintaining a low enough weight and size for ROV deployment.
]==],
    bio = [==[
Allspeeds Ltd are a renowned UK engineering company with prominent brands such as Tangye, Millingford International (API 11AX-0034) and Webtool and have been designing and manufacturing subsea tooling for over 25 years.
Keith Elliot has been with the company for 6 years and is Engineering Director responsible for the Design and Manufacture of all the companies products.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Hydraulic Intensifiers",
    fulltitle = "Hydraulic Intensifers are a Boost for ROV Tooling Requirements",
    lead = {
      first = "Bill",
      last = "Niblock",
      org = "ASP, Inc.",
      email = "Bill.Niblock@airsyspro.com",
    },
    cos = {
      {
        first = "Thyge",
        last = "Bollmann",
        org = "miniBOOSTER Hydraulics A/S",
        email = "TB@minibooster.com",
      },
    },
    abstract = [==[
The presentation will focus on recent and anticipated trends for high pressure hydraulics in subsea applications, predominately in the oil production industry and how compact hydraulic intensifiers can be a cost effective and reliable solution.

Deeper Drilling-Higher Pressures.  Exploration in deeper water combined with higher safety margins are driving the need for higher hydraulic pressures.  We will review how some subsea procedures, such as seal testing, are requiring higher pressures, and how hydraulic intensifiers are responding to the need.

Reliability and Flexibility.  Being able to perform at depth and at a range of flows and pressures, is challenged when additional hydraulic fluids and process solutions are used.  Discussion will consider how recent design considerations with hydraulic intensifiers improve both reliability and flexibility.

Beyond ROV.  Some of the intervention applications that are served by ROVs, also need upgrading, such as BOP accumulator charging.  Discussion will cover how compact hydraulic intensifiers can be a cost effective solution.
]==],
    bio = [==[
Bill Niblock is the Engineering Manager at ASP, Inc.  Bill supports customers throughout North America in several industries that are using hydraulic intensifiers to meet high pressure hydraulic needs.

Thyge Bollmann is a Vice President at miniBOOSTER Hydraulics A/S in Denmark and works with customers worldwide in support of miniBOOSTER Hydraulic Intensifiers.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 14, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "Waterjet Applications Subsea",
    fulltitle = "Waterjet Technology and Applications Deepwater Subsea",
    lead = {
      first = "Bruce",
      last = "Kivisto",
      org = "Chukar Waterjet, Inc.",
      email = "brucek@chukarwaterjet.com",
    },
    abstract = [==[
Waterjet technology has been developed for application in deepwater (3,000m+) environments. It offers several important advantages over existing technologies and presents new opportunities for continued refinement of subsea maintenance, repair, salvage, and emergency response techniques.

Advances in waterjet intensifier pump technology allow it to be applied subsea as a cutting tool in emergency response situations, or simply as an ultra-high pressure stream of water for coating or marine growth removal in applications such as isolation of welds for inspection. It may also be used as a tool to provide turbulence in a stream of methanol for tasks such as hydrate remediation and is effective at cutting steel up to 250 mm thick. The tool in a waterjet system cannot bind in the cut to jeopardize asset integrity, and it eliminates the hazard of igniting trapped pockets of gas during cutting.

Waterjet technology has been extended into the deepwater subsea space during the past year. Inclusion of an intensifier style subsea waterjet system in the collection of emergency response assets will give another option for cutting, salvage, and conduct of rapid de-mobilization operations.
]==],
    bio = [==[
Worked in the waterjet industry for 10 years. Work in the waterjet industry has focused on development of new applications for waterjet equipment and the extension of waterjet technology into the subsea environment. Professionally registered Electrical Engineer from the the University of Minnesota specializing in machine development and control systems.
]==],
    start = { day = 25, month = 1, year = 2012, --TODO: DATE
      hour = 15, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "ROV Automation",
    fulltitle = "Navigation, Object Tracking and Data Monitoring in Real-Time for ROV Automation",
    lead = {
      first = "Ioseba",
      last = "Tena",
      org = "SeeByte",
      email = "ioseba.tena@seebyte.com",
    },
    abstract = [==[
The last five years has seen the advent of commercial-off-the-shelf (COTS) Remotely Operated Vehicle (ROV) automation solutions. The challenges posed by a rapidly expanding ROV pilot workforce, dynamic working environments and increasing demands on quality and performance have been the main drivers for this technology. A good example of its application is the 2008 Doc Ricketts vehicle. This was a Workclass ROV (WROV) equipped with the basic autonomy building blocks to enable station keeping, waypoint following and object tracking. The Doc Ricketts WROV is still in active service with MBARI. This basic capability paved the way for commercial applications and now station keeping is a standard option. More recently, Jan De Nul Fall Pipe ROV is an example that uses COTS sophisticated cruise and mission planning modules. This world's first enables precise positioning of the ROV over a pipeline as it swings from side to side and places rocks over the product. Available capabilities today include real-time monitoring and control of multiple ROVs relative to chart data, mid-water DP using INS and tracking sonar, pre-lay survey flight modes and hands-off touchdown monitoring using sonar. The combination of data from optical cameras with 3D sonar imaging will further enhance the mapping of the subsea environment to facilitate various activities such as mission planning and training.

The purpose of this talk is to provide an insight into this technology and a glimpse of what to expect in the immediate future.
]==],
    bio = shared.bios.tena,
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 00 },
    length = 1800,
    room = "217",
  },

  {
    title = "Fiber Optic Connectivity",
    fulltitle = "Considerations for Successful Optical Fiber Connectivity in Subsea Applications",
    lead = {
      first = "Steve",
      last = "Bell",
      org = "BIRNS, Inc.",
      email = "sbell@birns.com",
    },
    abstract = [==[
Fiber optic connectors deliver massive bandwidth in a minute footprint, and thus are becoming increasingly popular for ROV and manned submersibles for everything from vehicle control and HD cameras to tracking and fiber based sensors. However, there are numerous complex engineering considerations for such systems, given the rigorous demands of subsea applications. Thus, it's key to make informed decisions about how fiber optics should be integrated into a design from its inception to achieve the maximum advantage of the technology.

This report explores the theory of fiber optics, both operation and concepts of use, strategies for design, pros and cons, especially as they affect the trade-offs between single mode and multimode fiber for specific applications.
Further, it examines to the future of the technology and how it can shape the deep ocean industry, from low back reflectance connectors to bend-insensitive, high numerical aperture fiber options, which will allow even greater versatility and performance in robust connector shell designs.
]==],
    bio = [==[
Serves as Optical/Photonics Engineer for BIRNS, Inc., an ISO 9001:2008-certified global leader in the design and manufacture of unique lines of high performance lights, connectors, penetrators and custom cable assemblies.

Responsible for the design, development and execution of the company’s diverse fiber-optic connector systems, and has helped BIRNS expand and enhance its wide range of popular fiber optic and hybrid connector solutions, including the new BIRNS Millennium™ standard electro-optical hybrid series.

More than 20 years of industry experience; holds a Bachelor of Science degree in Optical Engineering.  Prior to joining the team at BIRNS, served as a Senior Photonics Engineer at Sabeus Federal Systems, LLC, where designed, built, and tested fiber-optic hydrophones for prototype towed acoustic arrays for the US Navy.

Successful career has also included a position at Optiphase as a Senior Engineer, responsible for the optical design of fiber-optic interferometer systems and as an engineer for CalTech on the LIGO (Laser Interferometer Gravitational Wave Observatory) project.
]==],
    start = { day = 25, month = 1, year = 2012,
      hour = 16, min = 30 },
    length = 1800,
    room = "217",
  },

  {
    title = "MTS ROV Committee Meeting",
    fulltitle = "",
    lead = {
      first = "Drew",
      last = "Michel",
      org = "MTS ROV Committee",
      email = "rovdrew@earthlink.net",
    },
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
    bio = [==[
Drew has 45 years of experience in technical and executive positions in the industry and is currently one of the most respected independent ROV consultants in this field.   His accomplishments and awards include;

-	Induction into the Offshore Energy Center Hall of Fame in 2010
-	Selection for induction into the ADCI Commercial Diving hall of Fame in 2012
-	A Fellow and President elect of the Marine Technology Society (MTS)
-	A senior member of the Institute of Electrical and Electronic Engineers (IEEE).
-	Has served 21 consecutive years as Chair of the MTS ROV Committee
-	Has served 20 years as Co-chair of the Annual Underwater Intervention Conference.
-	Serves on the National Visiting committee (board) of the Marine Advanced Technology Education Center.
-	Served on the National Academy of Sciences committee on Undersea Vehicles and National Needs and National Research Council committee on Undersea Observatories.
-	A recipient of the MTS Lockheed-Martin Award for Ocean Science and Engineering;
-	An Engineering News Record Honoree for Outstanding Engineering Achievement
]==],
    start = { day = 26, month = 1, year = 2012,
      hour = 9, min = 00 },
    length = 5400,
    room = "217",
  },
})
