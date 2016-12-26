# ID				Text1		Text2		Text3 PartOfSpeech Definition		Generic Feedback
# 1		word1 blah		blah		blah	blah				 blah					blah
# 2		word2 blah		blah		blah	blah				 blah					blah
# 3		word3 blah		blah		blah	blah				 blah					blah
# 4		word4 blah		blah		blah	blah				 blah					blah
#
# 1. Create a page where David can see the info above for both grades, which
# serves as a checklist. Once he creates it in Google Docs and I confirm it
# passes, I'll update the webpage so he can see his progress
# 2. Create a google docs spreadsheet in the format above. Give examples to
# serve as a great guide for getting started quickly and easily
# 3. Folow up with David and give both the page link and Google Docs link so he
# can get started

fifth_grade_words = [
	"abolish",
	"dedicate",
	"absurd",
	"deprive",
	"abuse",
	"detect",
	"access",
	"dictate",
	"accomplish",
	"document",
	"achievement",
	"duplicate",
	"aggressive",
	"alternate",
	"edible",
	"altitude",
	"endanger",
	"antagonist",
	"escalate",
	"antonym",
	"evade",
	"anxious",
	"exasperate",
	"apparent",
	"excavate",
	"approximate",
	"exert",
	"aroma",
	"exhibit",
	"assume",
	"exult",
	"astound",
	"available",
	"Feeble",
	"avalanche",
	"frigid",
	"Banquet",
	"gigantic",
	"beverage",
	"gorge",
	"bland",
	"guardian",
	"blizzard",
	"budge",
	"Hazy",
	"bungle",
	"hearty",
	"homonym",
	"Cautiously",
	"challenge",
	"identical",
	"character",
	"illuminate",
	"combine",
	"immense",
	"companion",
	"impressive",
	"crave",
	"independent",
	"compassion",
	"industrious",
	"compensate",
	"intense",
	"comply",
	"intercept",
	"compose",
	"concept",
	"Jubilation",
	"confident",
	"convert",
	"kin",
	"course",
	"courteous",
	"Luxurious",
	"debate",
	"major",
	"decline",
	"miniature",
	"minor",
	"mischief",
	"monarch",
	"moral",
	"myth",
	"narrator",
	"navigate",
	"negative",
	"nonchalant",
	"numerous",
	"oasis",
	"obsolete",
	"occasion",
	"overthrow",
	"Pardon",
	"pasture",
	"pedestrian",
	"perish",
	"petrify",
	"portable",
	"prefix",
	"preserve",
	"protagonist",
	"provide",
	"purchase",
	"Realistic",
	"reassure",
	"reign",
	"reliable",
	"require",
	"resemble",
	"retain",
	"retire",
	"revert",
	"route",
	"Saunter",
	"seldom",
	"senseless",
	"sever",
	"slither",
	"sluggish",
	"soar",
	"solitary",
	"solo",
	"sparse",
	"spurt",
	"strategy",
	"suffix",
	"suffocate",
	"summit",
	"suspend",
	"synonym",
	"Talon",
	"taunt",
	"thrifty",
	"translate",
	"tropical",
	"Visible",
	"visual",
	"vivid",
	"Wilderness",
	"withdraw"
]

sixth_grade_words = [
	"abandon",
	"constant",
	"abundant",
	"contaminate",
	"access",
	"context",
	"accommodate",
	"continuous",
	"accumulate",
	"controversy",
	"adapt",
	"convenient",
	"adhere",
	"cope",
	"agony",
	"cordial",
	"allegiance",
	"cultivate",
	"ambition",
	"cumulative",
	"ample",
	"anguish",
	"Declare",
	"anticipate",
	"deluge",
	"anxious",
	"dense",
	"apparel",
	"deplete",
	"appeal",
	"deposit",
	"apprehensive",
	"designate",
	"arid",
	"desperate",
	"arrogant",
	"deteriorate",
	"awe",
	"dialogue",
	"diligent",
	"Barren",
	"diminish",
	"beacon",
	"discretion",
	"beneficial",
	"dissent",
	"blunder",
	"dissolve",
	"boisterous",
	"distinct",
	"boycott",
	"diversity",
	"burden",
	"domestic",
	"dominate",
	"Campaign",
	"drastic",
	"capacity",
	"duration",
	"capital",
	"dwell",
	"chronological",
	"civic",
	"Eclipse",
	"clarity",
	"economy",
	"collaborate",
	"eerie",
	"collide",
	"effect",
	"commend",
	"efficient",
	"commentary",
	"elaborate",
	"compact",
	"eligible",
	"composure",
	"elude",
	"concise",
	"encounter",
	"consent",
	"equivalent",
	"consequence",
	"erupt",
	"conserve",
	"esteem",
	"conspicuous",
	"evolve",
	"exaggerate",
	"Majority",
	"excel",
	"makeshift",
	"exclude",
	"manipulate",
	"expanse",
	"marvel",
	"exploit",
	"massive",
	"extinct",
	"maximum",
	"extract",
	"meager",
	"mere",
	"Factor",
	"migration",
	"former",
	"mimic",
	"formulates",
	"minute",
	"fuse",
	"monotonous",
	"futile",
	"Negotiate",
	"Generate",
	"genre",
	"Objective",
	"obstacle",
	"Habitat",
	"omniscient",
	"hazardous",
	"onset",
	"hoax",
	"optimist",
	"hostile",
	"originate",
	"Idiom",
	"Painstaking",
	"ignite",
	"paraphrase",
	"immense",
	"parody",
	"improvises",
	"persecute",
	"inept",
	"plummet",
	"inevitable",
	"possess",
	"influence",
	"poverty",
	"ingenious",
	"precise",
	"innovation",
	"predicament",
	"intimidate",
	"predict",
	"prejudice",
	"Jovial",
	"preliminary",
	"primitive",
	"Knack",
	"priority",
	"prominent",
	"Leeway",
	"propel",
	"prosecute",
	"legislation",
	"vow"
]

seventh_grade_words = [
	"abate",
	"abnormal",
	"abode",
	"abrupt",
	"accelerate",
	"acclaim",
	"acknowledge",
	"acquire",
	"acrid",
	"addict",
	"adjacent",
	"admonish",
	"affliction",
	"agitate",
	"ajar",
	"akin",
	"allege",
	"annihilate",
	"anonymous",
	"antagonize",
	"apathy",
	"arbitrate",
	"aspire",
	"astute",
	"authentic",
	"avert",
	"bellow",
	"beseech",
	"catastrophe",
	"cater",
	"chorus",
	"citrus",
	"clamber",
	"climax",
	"compromise",
	"concur",
	"confront",
	"congested",
	"conjure",
	"consult",
	"corrupt",
	"counterfeit",
	"covet",
	"customary",
	"debut",
	"deceased",
	"dependent",
	"despondent",
	"detach",
	"devour",
	"dishearten",
	"dismal",
	"dismantle",
	"distraught",
	"downright",
	"exuberant",
	"flaw",
	"fruitless",
	"gaudy",
	"geography",
	"gratify",
	"gravity",
	"grim",
	"grimy",
	"grueling",
	"gruesome",
	"haggle",
	"headlong",
	"hilarious",
	"homage",
	"homicide",
	"hospitable",
	"hurtle",
	"hybrid",
	"illiterate",
	"impede",
	"implore",
	"incident",
	"incredulous",
	"infamous",
	"lurk",
	"maternal",
	"maul",
	"melancholy",
	"mellow",
	"momentum",
	"mortify",
	"mull",
	"murky",
	"narrative",
	"negligent",
	"nimble",
	"nomadic",
	"noteworthy",
	"notify",
	"notorious",
	"nurture",
	"obnoxious",
	"oration",
	"orthodox",
	"overwhelm",
	"pamper",
	"patronize",
	"peevish",
	"pelt",
	"pending",
	"perceived",
	"perjury",
	"permanent",
	"persist",
	"perturb",
	"pique",
	"pluck",
	"poised",
	"ponder",
	"potential",
	"predatory",
	"presume",
	"preview",
	"prior",
	"prowess",
	"radiant",
	"random",
	"rant",
	"recede",
	"reprimand",
	"resume",
	"retort",
	"robust",
	"rupture",
	"saga",
	"sequel",
	"sham",
	"shirk",
	"simultaneously",
	"snare",
	"species",
	"status",
	"stodgy",
	"substantial",
	"subtle",
	"sullen",
	"supervise",
	"tamper",
	"throb",
	"toxic",
	"tragedy",
	"trickle",
	"trivial",
	"uncertainty",
	"unscathed",
	"upright",
	"urgent",
	"utmost",
	"vengeance",
	"vicious",
	"vindictive",
	"vista",
	"vocation",
	"void",
	"wary",
	"whim",
	"wince",
	"wrath",
	"yearn"
]

eigth_grade_words = [
	"balmy",
	"dispatch",
	"banter",
	"disposition",
	"barter",
	"doctrine",
	"benign",
	"dub",
	"bizarre",
	"durable",
	"blasé",
	"bonanza",
	"eccentric",
	"bountiful",
	"elite",
	"haven",
	"heritage",
	"hindrance",
	"hover",
	"humane",
	"Imperative",
	"cache",
	"embark",
	"capacious",
	"encroach",
	"caption",
	"endeavor",
	"chastise",
	"enhance",
	"citadel",
	"enigma",
	"cite",
	"epoch",
	"clad",
	"era",
	"clarify",
	"eventful",
	"commemorate",
	"evolve",
	"component",
	"exceptional",
	"concept",
	"excerpt",
	"confiscate",
	"excruciating",
	"indifferent",
	"infinite",
	"instill",
	"institute",
	"intervene",
	"intricate",
	"inventive",
	"inventory",
	"irascible",
	"jurisdiction",
	"connoisseur",
	"accord",
	"conscientious",
	"adept",
	"￼￼abet",
	"conservative",
	"advocate",
	"contagious",
	"agile",
	"conventional",
	"allot",
	"convey",
	"aloof",
	"crucial",
	"amiss",
	"crusade",
	"analogy",
	"culminate",
	"anarchy",
	"antics",
	"Deceptive",
	"apprehend",
	"decipher",
	"ardent",
	"decree",
	"articulate",
	"deface",
	"assail",
	"defect",
	"assimilate",
	"deplore",
	"atrocity",
	"deploy",
	"attribute",
	"desist",
	"audacious",
	"desolate",
	"augment",
	"deter",
	"authority",
	"dialect",
	"avail",
	"dire",
	"avid",
	"discern",
	"awry",
	"disdain",
	"exemplify",
	"exotic",
	"Facilitate",
	"fallacy",
	"fastidious",
	"feasible",
	"fend",
	"ferret",
	"flair",
	"flustered",
	"foreboding",
	"forfeit",
	"formidable",
	"fortify",
	"foster",
	"Gaunt",
	"gingerly",
	"glut",
	"grapple",
	"grope",
	"gullible",
	"languish",
	"renown",
	"legendary",
	"revenue",
	"liberal",
	"rubble",
	"loll",
	"rue",
	"lucrative",
	"luminous",
	"Sage",
	"sedative",
	"memoir",
	"serene",
	"mercenary",
	"servile",
	"mien",
	"shackle",
	"millennium",
	"slmien",
	"shacize",
	"spontaneous",
	"modify",
	"stamina",
	"stance",
	"staple",
	"onslaught",
	"stint",
	"sublime",
	"overt",
	"subside",
	"succumb",
	"pang",
	"surpass",
	"panorama",
	"susceptible",
	"perspective",
	"swelter",
	"phenomenon",
	"panorama",
	"perspective",
	"swelter",
	"phenomenon",
	"sporadic"
	"muse",
	"muster",
	"recourse",
	"wage",
	"recur",
	"wrangle",
	"renounce",
	"disgruntled",
	"haggard",
	"inaugurate",
	"embargo",
	"incense"
]
