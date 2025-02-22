extends Node2D

var achievements = [
	{
	"name":"Rebirth",
	"requirement":"Get your first Million, and Rebirth.",
	"desc":"Data Wipe",
	"unlocked?":false,
	},
	{
	"name":"10 Lifetimes Pass.",
	"requirement":"Get your 10th Rebirth",
	"desc":"Prove your worth.",
	"unlocked?":false,
	},
	{
	"name":"Dark Web Enthusiast",
	"requirement":"Buy all Black Market Items",
	"desc":"You’re probably on a watchlist now…",
	"unlocked?":false,
	},
	{
	"name":"Rage Quit",
	"requirement":"Buy all Black Market Items",
	"desc":"You’re probably on a watchlist now…",
	"unlocked?":false,
	},
	{
	"name":"Minecraft",
	"requirement":"Max out a mine (Reward: Captain Shrilow)",
	"desc":"Oh yeah? I'm in the same cave; looking for miners.",
	"unlocked?":false,
	},
	{
	"name":"Shopping Spree",
	"requirement":"Buy all Shop Items in one playthrough",
	"desc":"Women be shoppin!",
	"unlocked?":false,
	},
	{
	"name":"Crazy Jelly Lady",
	"requirement":"Get all Jellies",
	"desc":"hi saayo",
	"unlocked?":false,
	},
	{
	"name":"Fashionista",
	"requirement":"Buy all Outfits",
	"desc":"I bet you feel so… bonita! Thanks for that one saayo kiss emoji",
	"unlocked?":false,
	},
	{
	"name":"Billionaire",
	"requirement":"Get 1 Billion Dollars",
	"desc":"Eat the rich (you)",
	"unlocked?":false,
	},
	{
	"name":"Ourple Guy",
	"requirement":"Play all Minigames",
	"desc":"Get it? Like. like arcade games? IT'S FUNNY OKAY?",
	"unlocked?":false,
	},
	{
	"name":"IPad Baby",
	"requirement":"See all ScreenEvents",
	"desc":"Abababa wah! SHUT UP. THAT'S YOU. THAT'S HOW YOU SOUND.",
	"unlocked?":false,
	},
	{
	"name":"Abababa wah! SHUT UP. THAT'S YOU. THAT'S HOW YOU SOUND.",
	"requirement":"Buy all Black Market Items",
	"desc":"You’re probably on a watchlist now…",
	"unlocked?":false,
	},
	{
	"name":"Are your Fingers Sore?",
	"requirement":"Click Shrilow 10000 Times",
	"desc":"YEOUUCHH",
	"unlocked?":false,
	},
	{
	"name":"Carpal Tunnel",
	"requirement":"Click Shrilow 100000 Times",
	"desc":"But don't you know that is the hurts? *bone breaking sound* IV in that arm, yo!",
	"unlocked?":false,
	},
	{
	"name":"90% of Gamblers",
	"requirement":"Buy 100 Jelly Gumballs",
	"desc":"Quit before they hit big!",
	"unlocked?":false,
	},
	{
	"name":"Jocapelt",
	"requirement":"Buy 1000 Jelly Gumballs",
	"desc":"Rookie Numbers.",
	"unlocked?":false,
	},
	{
	"name":"Mikey",
	"requirement":"Buy 10 Platinum Gumballs",
	"desc":"Rookie Numbers.",
	"unlocked?":false,
	},
	{
	"name":"500 Greasepuppys",
	"requirement":"Buy 500 Greasepuppys",
	"desc":"Do you feel it? I do. We need MORE. 500 Greasepuppies!",
	"unlocked?":false,
	},
	{
	"name":"Quite Simple",
	"requirement":"Get 0 Stars in Roshambo",
	"desc":"Y’know, in roshambo (the game i made), uhh if you get 0 stars, you lose. Uh which is- what you’re always gonna get, because I am the roshambo demon. And I made roshambo (my game, btw). Uhh i was gonna win. because i’m. The Roshambo demon. Because I made roshambo. That's my game, by the way, I made it. - ro",
	"unlocked?":false,
	},
	{
	"name":"Yelp Review Master",
	"requirement":"Get 5 Stars on every Possible “Pizza Past Perfect!” Patron",
	"desc":"Nobody’s doin it like me. Oh yeah. I'm the best! Put the fries in the bag",
	"unlocked?":false,
	},
	{
	"name":"Astral Spiff",
	"requirement":"Get 5 Stars on every Minigame",
	"desc":"In this video, i'm gonna try my best to get 5 stars on every computer shrilow minigame",
	"unlocked?":false,
	},
	{
	"name":"I like Writing",
	"requirement":"Get every Journal Entry",
	"desc":"You should get an english degree",
	"unlocked?":false,
	},
	{
	"name":"Completionist Whore",
	"requirement":"Get every Achievement",
	"desc":"thank",
	"unlocked?":false,
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

func load():
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	for i in achievements.size():
		achievements[i] = int(config.get_value("Achievements", str(i)))

func saveDeleted():
	
	var config = ConfigFile.new()
	
	var err = config.load("user://globals!")
	
	for i in achievements.size():
		deletedAchievements[i] = int(config.get_value("Achievements", str(i)))
	
	config.save("user://globals!")
