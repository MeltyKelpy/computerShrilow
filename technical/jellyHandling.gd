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
	"Name":"JellyBricks",
	"Desc":"Double sunglasses, double the AWESOME\n(Based on the sona of GhostyBricks)",
	"MoneyGain":2,
	"Seconds":6,
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
	"Name":"Plinker Jelly",
	"Desc":"Beep bop uhm im a robot BITCH\n(Based on the sona of Saayo)",
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
	]

var jellyName = "Hover over a jelly to see its description!"
var jellyDesc = "if you have said jelly, of course."
