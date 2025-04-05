extends Node

var equippedClothing = 0

var clothes = [
	{
	# BASE // 0
	"Name":"Base Clothes",
	"Desc":"The iconic shrilow clothes! Provides no buffs.",
	"Owned":true,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/base.png",
	"Image":"shrilowBase",
	"eyes":"baseEyes",
	"maxDistance":20,
	"Cost":0
	},
	{
	# SUIT // 1
	"Name":"Presidental Suit",
	"Desc":"As all presidents must have. may be useful if you ever need to go to a speech... otherwise, provides no buffs.",
	"Owned":true,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/suit.png",
	"Image":"shrilowPresident",
	"eyes":"presEyes",
	"maxDistance":10,
	"Cost":0
	},
	{
	# DATE NIGHT
	"Name":"Date Night",
	"Desc":"Everyone needs a fancy outfit for their date night! or, atleast i think they do? idk i show up in jeans usually lol\nincreases your click power by 1",
	"Owned":false,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/datenight.png",
	"Image":"shrilowDate Night",
	"eyes":"dateEyes",
	"maxDistance":20,
	"Cost":100
	},
	{
	# OIL RIG
	"Name":"Rig Mechanic",
	"Desc":"You're the luckiest bastard on this rig.\nincreases your auto-click power by 1",
	"Owned":false,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/rig.png",
	"Image":"shrilowCaz",
	"eyes":"rigEyes",
	"maxDistance":20,
	"Cost":500
	},
	{
	# FREIHTER
	"Name":"Space Freighter",
	"Desc":"I can fix it...\nincreases (UNDEFINED LMAOO)",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/freight.png",
	"Image":"shrilowFreighter",
	"eyes":"baseEyes",
	"UnlockReq":"a little overkill on those mine upgrades... dont you think?\n(Unlocks Alongside an Achievement)",
	"maxDistance":20,
	"Cost":500
	},
	{
	# COKA
	"Name":"Coka",
	"Desc":"I did ALL THE CLICKING! ALL OF IT! more clicking than you've EVER SEEN!\nincreases (UNDEFINED LMAOO)",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/mokerson.png",
	"Image":"shrilowMokerson",
	"UnlockReq":"I'd get clicking...\n(Unlocks Alongside an Achievement)",
	"eyes":"baseEyes",
	"maxDistance":20,
	"Cost":500
	},
]

var clothesTUTORIAL = [
	{
	# BASE // 0
	"Name":"Base Clothes",
	"Desc":"The iconic shrilow clothes! Provides no buffs.",
	"Owned":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/base.png",
	"Image":"shrilowBase",
	"eyes":"BaseEyes",
	"maxDistance":20,
	"Cost":0
	},
	{
	# DATE NIGHT
	"Name":"Date Night",
	"Desc":"Everyone needs a fancy outfit for their date night! or, atleast i think they do? idk i show up in jeans usually lol\nincreases your click power by 1",
	"Owned":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/datenight.png",
	"Image":"shrilowDate Night",
	"eyes":"DateEyes",
	"maxDistance":20,
	"Cost":0
	},
]

var itemName = "Clothing name will show up here"
var itemDesc = "Click an item to buy it, hover to preview it."
