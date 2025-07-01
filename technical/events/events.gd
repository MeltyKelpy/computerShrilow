extends Node

var eventList = [
	#{
	#"Event":"Sniper",
	#"AttachedScene":"res://technical/events/hitmarker.tscn",
	#"WarningMessage":"MR.PRESIDENT, GET DOWN! THEY'RE GONNA ASSASSINATE YOU! MOVE THAT FREAKING HITMARKER BEFORE HE GETS SHOT!!",
	#"Played?":false,
	#},
	{
	"Event":"Golden Shrilow",
	"AttachedScene":"res://technical/events/goldenShrilow.tscn",
	"WarningMessage":"HE HAS TURN GOLD.. WOAW..............",
	"Type":"Generic",
	"Played?":false,
	},
	{
	"Event":"Jerry Seinfeld",
	"AttachedScene":"res://technical/events/jerryseinfeld.tscn",
	"WarningMessage":"wuh oh! mischevious jerry seinfeld the cat has come to STEAL YOUR MONEY. click him to shoo him away!",
	"Type":"Generic",
	"Played?":false,
	},
	{
	"Event":"Flood",
	"AttachedScene":"res://technical/events/flood.tscn",
	"WarningMessage":"Oh, thats shrilow's area flooding. GO PULL OUT THE PLUG BEFORE HE DROOOWWNNNSSS.",
	"Type":"Generic",
	"Played?":false,
	},
	{
	"Event":"Miner Kid",
	"AttachedScene":"res://technical/events/minerkid.tscn",
	"WarningMessage":"Oh.. i think you're getting a call.. you should check that..",
	"Type":"Generic",
	"Played?":false,
	},
	{
	"Event":"Popup Windows",
	"AttachedScene":"res://technical/events/startMyWindwosComputer.tscn",
	"WarningMessage":"get an adblocker already",
	"Type":"Generic",
	"Played?":false,
	},
	]

var justMinigames = [
	{
	"Event":"Mario",
	"AttachedScene":"res://technical/events/mario.tscn",
	"WarningMessage":"It's just like that one game",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Hardest Game Ever",
	"AttachedScene":"res://technical/events/hardestGame.tscn",
	"WarningMessage":"Dude... you're never gonna beat this... trust me....",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Roshambo",
	"AttachedScene":"res://technical/events/roshambo.tscn",
	"WarningMessage":"ITS NOT CALLED ROCK PAPER SCISSOERS, IDIOT! ITS ROSHAMBO! IDIOT!",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Whack-ilow",
	"AttachedScene":"res://technical/events/whack-ilow.tscn",
	"WarningMessage":"Boink! right on the head! bet that'll leave a cartoonish bump on your head. heh. yup.",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Write-it-Right!",
	"AttachedScene":"res://technical/events/writeitright.tscn",
	"WarningMessage":"I love typing im so good at typing my teacher made me use typing.com in 2nd grade so im like. rly good at it yeah",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Shrilowperro",
	"AttachedScene":"res://technical/events/shrilowperro.tscn",
	"WarningMessage":"mama always said not the play in the road. shrilow: pshh eah right >:)",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	{
	"Event":"Target Practice",
	"AttachedScene":"res://technical/events/targetpractice.tscn",
	"WarningMessage":"I love shooting civilians - the police",
	"Type":"Minigame",
	"Played?":false,
	"BestStars":0,
	},
	]

func find_minigame(namev):
	for i in justMinigames.size():
		if justMinigames[i]["Event"] == namev:
			return i
			break
