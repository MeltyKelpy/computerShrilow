extends Node

var achievements = [
	{
	"name":"Rebirth",
	"requirement":"Get your first Million, and Rebirth.",
	"desc":"Data Wipe",
	"unlocked?":false,
	"ID":"rebirth",
	},
	{
	"name":"10 Lifetimes Pass",
	"requirement":"Get your 10th Rebirth",
	"desc":"Prove your worth.",
	"unlocked?":false,
	"ID":"rebirth10",
	},
	{
	"name":"Spicy...",
	"requirement":"Play a run with a Curse",
	"desc":"Might need some water!",
	"unlocked?":false,
	"ID":"spicy",
	},
	{
	"name":"THATS NOT SPICY, THATS JUST. HURT",
	"requirement":"Go through a playthrough with 5 curses",
	"desc":"Gotta get some milk for that...",
	"unlocked?":false,
	"ID":"extraspicy",
	},
	{
	"name":"Dark Web Enthusiast",
	"requirement":"Buy all Black Market Items",
	"desc":"You’re probably on a watchlist now…",
	"unlocked?":false,
	"ID":"darkwebber",
	},
	{
	"name":"Rage Quit",
	"requirement":"Quit right after losing a minigame",
	"desc":"Really?",
	"unlocked?":false,
	"ID":"ragequiter",
	},
	{
	"name":"Minecraft",
	"requirement":"Max out a mine (Reward: Captain Shrilow)",
	"desc":"Oh yeah? I'm in the same cave; looking for miners.",
	"unlocked?":false,
	"ID":"minecraft",
	},
	{
	"name":"Shopping Spree",
	"requirement":"Buy all Shop Items in one playthrough",
	"desc":"Women be shoppin!",
	"unlocked?":false,
	"ID":"women",
	},
	{
	"name":"Crazy Jelly Lady",
	"requirement":"Get all Jellies",
	"desc":"hi saayo",
	"unlocked?":false,
	"ID":"crazyjellylady",
	},
	{
	"name":"Fashionista",
	"requirement":"Buy all Outfits",
	"desc":"I bet you feel so… bonita! Thanks for that one saayo kiss emoji",
	"unlocked?":false,
	"ID":"fashionista",
	},
	{
	"name":"Billionaire",
	"requirement":"Get 1 Billion Dollars",
	"desc":"Eat the rich (you)",
	"unlocked?":false,
	"ID":"billionare",
	},
	{
	"name":"80s Arcade Fanatic",
	"requirement":"Play all Minigames",
	"desc":"Get it? Like. like arcade games? IT'S FUNNY OKAY?",
	"unlocked?":false,
	"ID":"arcade",
	},
	{
	"name":"IPad Baby",
	"requirement":"See all ScreenEvents",
	"desc":"Abababa wah! SHUT UP. THAT'S YOU. THAT'S HOW YOU SOUND.",
	"unlocked?":false,
	"ID":"ipadbaby",
	},
	{
	"name":"Are your Fingers Sore",
	"requirement":"Click Shrilow 10000 Times",
	"desc":"YEOUUCHH",
	"unlocked?":false,
	"ID":"sorefingers",
	},
	{
	"name":"Carpal Tunnel",
	"requirement":"Click Shrilow 100000 Times",
	"desc":"But don't you know that is the hurts? *bone breaking sound* IV in that arm, yo!",
	"unlocked?":false,
	"ID":"carpaltunnel",
	},
	{
	"name":"90% of Gamblers",
	"requirement":"Buy 100 Jelly Gumballs",
	"desc":"Quit before they hit big!",
	"unlocked?":false,
	"ID":"90percent",
	},
	{
	"name":"Jocapelt",
	"requirement":"Buy 1000 Jelly Gumballs",
	"desc":"Rookie Numbers.",
	"unlocked?":false,
	"ID":"1000gum",
	},
	{
	"name":"Mikey",
	"requirement":"Buy 10 Platinum Gumballs",
	"desc":"Rookie Numbers.",
	"unlocked?":false,
	"ID":"10plat",
	},
	{
	"name":"500 Greasepuppys",
	"requirement":"Buy 500 Greasepuppys",
	"desc":"Do you feel it? I do. We need MORE. 500 Greasepuppies!",
	"unlocked?":false,
	"ID":"500gp",
	},
	{
	"name":"Quite Simple",
	"requirement":"Get 0 Stars in Roshambo",
	"desc":"Y’know, in roshambo (the game i made), uhh if you get 0 stars, you lose. Uh which is- what you’re always gonna get, because I am the roshambo demon. And I made roshambo (my game, btw). Uhh i was gonna win. because i’m. The Roshambo demon. Because I made roshambo. That's my game, by the way, I made it. - ro",
	"unlocked?":false,
	"ID":"roshambo",
	},
	{
	"name":"Yelp Review Master",
	"requirement":"Get 5 Stars on every Possible “Pizza Past Perfect!” Patron",
	"desc":"Nobody’s doin it like me. Oh yeah. I'm the best! Put the fries in the bag",
	"unlocked?":false,
	"ID":"yelpmaster",
	},
	{
	"name":"Astral Spiff",
	"requirement":"Get 5 Stars on every Minigame",
	"desc":"In this video, i'm gonna try my best to get 5 stars on every computer shrilow minigame",
	"unlocked?":false,
	"ID":"astralspiff",
	},
	{
	"name":"I like Writing",
	"requirement":"Get every Journal Entry",
	"desc":"You should get an english degree",
	"unlocked?":false,
	"ID":"englishdegree",
	},
	{
	"name":"Completionist Whore",
	"requirement":"Get every Achievement",
	"desc":"thank",
	"unlocked?":false,
	"ID":"completionist",
	},
	]

var deletedAchievements = [
	{
	"name":"No-Life",
	"requirement":"Rebirth on the tutorial",
	"desc":"Bet you feel really achomplished, huh?",
	"ID":0,
	},
	]

func save():
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	for i in achievements.size():
		config.set_value("Achievements", str(i), achievements[i]["unlocked?"])
	
	config.save(Game.files[Game.curFile])

func load():
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	if config.has_section("Achievements"):
		for i in achievements.size():
			if config.has_section_key("Achievements", str(i)):
				achievements[i]["unlocked?"] = bool(config.get_value("Achievements", str(i)))

func saveDeleted():
	
	var config = ConfigFile.new()
	
	var err = config.load("user://globals")
	
	for i in achievements.size():
		deletedAchievements[i] = int(config.get_value("Achievements", str(i)))
	
	config.save("user://globals")
