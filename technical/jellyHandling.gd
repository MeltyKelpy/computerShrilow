extends Node

# COMMON BASE: MONEY 1 SEC 10
# UNCOMMON BASE: MONEY 1 SEC 8
# RARE BASE: MONEY 2 SEC 6
# AWESOME BASE: MONEY 2 SEC 4
# QUEER BASE: MONEY 3 SEC 2

var commonJellies = [
	{
	"Name":"Jelly",
	"Desc":"The Basic Jelly, a weird species of creature who weirdly resemble a smaller version of MeltyKelpy (Melanie)",
	"MoneyGain":1,
	"Seconds":10,
	"Discovered":false,
	},
	]
var uncommonJellies = [
	{
	"Name":"FuckedUp Jelly",
	"Desc":"A fucked up version of Jelly, resembles a poorly scribbled drawing of Her",
	"MoneyGain":1,
	"Seconds":9,
	"Discovered":false,
	},
	{
	"Name":"School Jelly",
	"Desc":"I gently open the door..\n(Based on the outfits in DDLC+)",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Speedy Jelly",
	"Desc":"Aw yeah! This is happenin'!",
	"MoneyGain":1,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Dress Jelly",
	"Desc":"Jelly in a fancy lil dress! you think shes going to see someone special?\n(Based on the alt design of game creator, MeltyKelpy's sona)",
	"MoneyGain":1,
	"Seconds":7,
	"Discovered":false,
	},
	{
	"Name":"Dog Jelly",
	"Desc":"oh!.. uhm.. woof?\n(Based on the sona of OJSTheCoder)",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Retarded Gambler Jelly",
	"Desc":"GIVE ME THAT MONEY, BABY! I LOVE GAMBLING! AND I ALSO LOVE PILLAR CHASE 2! AND ANIME! AND GAMBLING!\n(Based on the roblox avatar of Mikeyunstoppable)",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Posterized Jelly",
	"Desc":"Posterization.",
	"MoneyGain":1,
	"Seconds":9,
	"Discovered":false,
	},
	{
	"Name":"Evil Jelly",
	"Desc":"dude why you so fuckin angry chill out man",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Septic Jelly",
	"Desc":"buy my coffee\n(Based on JackSepticEye)",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Diamond Peanut Butter",
	"Desc":"ride my minecart\n(Based on DanTDM)",
	"MoneyGain":1,
	"Seconds":8,
	"Discovered":false,
	},
	{
	"Name":"Untrustworthy Jelly",
	"Desc":"I don't know guys I don't FUCKING trust this FUCKING guy at FUCKING all.",
	"MoneyGain":1,
	"Seconds":9,
	"Discovered":false,
	},
	]
var rareJellies = [
	{
	"Name":"Gardener Jelly",
	"Desc":"Cutiepie! go plant some little strawberry seeds, love\n(This is my favorite jelly.)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Pup Jelly",
	"Desc":"got that dog in her\n(Based on a character from a comic called Pinky and Pepper Forever)",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Winter Jelly",
	"Desc":"brrr... so cold!\nHopefully you'll warm up soon!",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"JellyBricks",
	"Desc":"Double sunglasses, double the AWESOME\n(Based on the sona of GhostyBricks)",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Blindfold Jelly",
	"Desc":"I don't even LIKE girls, I have a boyfriend\n(Based on Gojo from JJK)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Chainsaw Peanut Butter",
	"Desc":"oh yeah lets, chainsaw it out.. thats his line right\n(Based on Denji from Chainsaw Man)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"The Jelly with a BlueHat",
	"Desc":"haha. sfm joke here. put an actual joke here dont release the game with this line in it istg\n(Based on the sona of TheTramWithABlueHat)",
	"MoneyGain":2,
	"Seconds":7,
	"Discovered":false,
	},
	{
	"Name":"Jellyjumpscare",
	"Desc":"Owns a record label, and also really like people of solid colors.\n(Based on the sona of kosejumpscare, my GOAT)",
	"MoneyGain":1,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Crazy Jelly",
	"Desc":"haha uhmm coocooCRAZY for coocoo puffs\n(Based on the sona of Jocapelt)",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Captain Jelly",
	"Desc":"Somehow still alive, surprisingly\n(Based on Curly from mouthwashing)",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Nurse Jelly",
	"Desc":"Take your meds! <3\n(Based on Anya from mouthwashing)",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	]
var awesomeJellies = [
	{
	"Name":"Kiwami Jelly",
	"Desc":"Do NOT search up Kiwami in the discord gif search.",
	"MoneyGain":2,
	"Seconds":4,
	"Discovered":false,
	},
	{
	"Name":"Super Senior Jelly",
	"Desc":"I NEED those freshman gyatts\n(Based on more injured Gojo from JJK)\n(those who gojo)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Plinker Jelly",
	"Desc":"Beep bop uhm im a robot BITCH\n(Based on the sona of Saayo)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Singer Jelly",
	"Desc":"she's hiding in your wifi, keep watch..\n(Based on Hatsune Miku)",
	"MoneyGain":2,
	"Seconds":4,
	"Discovered":false,
	},
	{
	"Name":"Tasty Jelly",
	"Desc":"bet you expected this one to be called singer jelly huh?\n(Based on Bee from FlavourText)",
	"MoneyGain":2,
	"Seconds":4,
	"Discovered":false,
	},
	{
	"Name":"Weird Jelly",
	"Desc":"Huh.. this jelly looks a little strange.. probably nothing!",
	"MoneyGain":2,
	"Seconds":4,
	"Discovered":false,
	},
	{
	"Name":"Weird Peanut Butter",
	"Desc":"Hey! What are you doing here? This isn't the right rarity for you!",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Clumsy Alien Jelly",
	"Desc":"Silly alien creature! where'd you come from, lil guy??\n(Based on the sona of KlutzyBugzy)",
	"MoneyGain":2,
	"Seconds":5,
	"Discovered":false,
	},
	{
	"Name":"Skibidi Jelly",
	"Desc":"skibidi skibidi dop dop yes yes",
	"MoneyGain":2,
	"Seconds":6,
	"Discovered":false,
	},
	{
	"Name":"Blue Jelly",
	"Desc":"Visit my bouncy castle in the outskirts of JellyTown",
	"MoneyGain":2,
	"Seconds":4,
	"Discovered":false,
	},
	]
var queerJellies = [
	{
	"Name":"JellythatlookslikeMeltyKelpy",
	"Desc":"Jelly that looks like MeltyKelpy. it looks so different!\n(This uses the normal color palette for MeltyKelpy's sona, rather than the one for the game.)",
	"MoneyGain":4,
	"Seconds":2,
	"Discovered":false,
	},
	{
	"Name":"Jelly2021",
	"Desc":"ANCIENT RELIC. (Based off the 2021 sona of game creator, MeltyKelpy)",
	"MoneyGain":3,
	"Seconds":2,
	"Discovered":false,
	},
	{
	"Name":"Angle",
	"Desc":"angelthe boib thengalge the boi THEBOI BASKEKKETTHBALL",
	"MoneyGain":3,
	"Seconds":2,
	"Discovered":false,
	},
	{
	"Name":"Peanut Butter",
	"Desc":"hey, wait a minute. you're not supposed to be here.\n(jelly's best friend)",
	"MoneyGain":3,
	"Seconds":3,
	"Discovered":false,
	},
	]
var blueJellies = [
	{
	"Name":"Ao Oni",
	"Desc":"hes blue",
	"MoneyGain":4,
	"Seconds":1,
	"Discovered":false,
	},
	{
	"Name":"Monkey D. Luffy",
	"Desc":"the one piece...././../..,.,..,",
	"MoneyGain":4,
	"Seconds":1,
	"Discovered":false,
	},
	{
	"Name":"Those who Jelly",
	"Desc":"brazilian phonk",
	"MoneyGain":4,
	"Seconds":1,
	"Discovered":false,
	},
	]

var jellyName = "Hover over a jelly to see its description!"
var jellyDesc = "if you have said jelly, of course."
