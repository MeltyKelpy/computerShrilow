extends Node

var equippedClothing = 0

var clothes = [
	{
	# BASE // 0
	"Name":"Base Clothes",
	"Desc":"The iconic shrilow clothes! [color=green]Provides no buffs.[/color]",
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
	"Desc":"As all presidents must have. may be useful if you ever need to go to a speech... [color=green]otherwise, provides no buffs.[/color]",
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
	"Desc":"Everyone needs a fancy outfit for their date night! or, atleast i think they do? idk i show up in jeans usually lol\n[color=green]increases your click power by 1[/color]",
	"Owned":false,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/datenight.png",
	"Image":"shrilowDate Night",
	"eyes":"dateEyes",
	"maxDistance":20,
	"Cost":50
	},
	{
	# OIL RIG
	"Name":"Rig Mechanic",
	"Desc":"You're the luckiest bastard on this rig.\n[color=green]increases your auto-click power by 1[/color]",
	"Owned":false,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/rig.png",
	"Image":"shrilowCaz",
	"eyes":"rigEyes",
	"maxDistance":20,
	"Cost":200
	},
	{
	# FREIHTER
	"Name":"Space Freighter",
	"Desc":"I can fix it...\n[color=green]increases (UNDEFINED LMAOO)[/color]",
	"Owned":false,
	"Unlocked":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/freight.png",
	"Image":"shrilowFreighter",
	"eyes":"baseEyes",
	"UnlockReq":"",
	"maxDistance":20,
	"Cost":500
	},
	{
	# JACKLOW
	"Name":"Jacklow",
	"Desc":"First we mine, then we craft! lets minecraft!\n[color=green]increases miner speed and income by 1.5x[/color]",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/jacklow.png",
	"Image":"shrilowJack",
	"eyes":"jackEyes",
	"UnlockReq":"[color=red]Get to the mines, buddy!\n(Unlocks Alongside an Achievement)[/color]",
	"maxDistance":20,
	"Cost":100000
	},
	{
	# GPLOW
	"Name":"GPLow",
	"Desc":"I feel an odd urge to.. imprison my principal!\n[color=green]decreases greasepuppy income-time to 1 second.[/color]",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/gp.png",
	"Image":"shrilowGP",
	"eyes":"gpEyes",
	"UnlockReq":"[color=red]We need more... 500 greasepuppies!\n(Unlocks Alongside an Achievement)[/color]",
	"maxDistance":20,
	"Cost":150000
	},
	{
	# COKA
	"Name":"Coka",
	"Desc":"I did ALL THE CLICKING! ALL OF IT! more clicking than you've EVER SEEN!\n[color=green]increases (UNDEFINED LMAOO)[/color]",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/mokerson.png",
	"Image":"shrilowMokerson",
	"UnlockReq":"[color=red]I'd get clicking...\n(Unlocks Alongside an Achievement)[/color]",
	"eyes":"baseEyes",
	"maxDistance":20,
	"Cost":500
	},
	{
	# LEGACY
	"Name":"Legacy",
	"Desc":"The Original.\n[color=green]doesnt do anything. i hate you.[/color]",
	"Owned":false,
	"Unlocked":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/legacy.png",
	"Image":"shrilowLegacy",
	"eyes":"legacyEyes",
	"UnlockReq":"[color=red]?\n(Unlocks Alongside an Achievement)[/color]",
	"maxDistance":15,
	"Cost":1
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

func find_outfit(fit_name):
	var ID = false
	for i in ClothingObjects.clothes.size():
		if ClothingObjects.clothes[i]["Name"] == fit_name:
			ID = i
			break
	return ID
