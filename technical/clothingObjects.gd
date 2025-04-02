extends Node

var equippedClothing = 0

var clothes = [
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
	# SUIT // 1
	"Name":"Presidental Suit",
	"Desc":"As all presidents must have. may be useful if you ever need to go to a speech... otherwise, provides no buffs.",
	"Owned":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/suit.png",
	"Image":"shrilowPresident",
	"eyes":"PresEyes",
	"maxDistance":10,
	"Cost":0
	},
	{
	# DATE NIGHT
	"Name":"Date Night",
	"Desc":"Everyone needs a fancy outfit for their date night! or, atleast i think they do? idk i show up in jeans usually lol\nincreases your click power by 1",
	"Owned":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/datenight.png",
	"Image":"shrilowDate Night",
	"eyes":"DateEyes",
	"maxDistance":20,
	"Cost":100
	},
	{
	# OIL RIG
	"Name":"Rig Mechanic",
	"Desc":"You're the luckiest bastard on this rig.\nincreases your auto-click power by 1",
	"Owned":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/rig.png",
	"Image":"shrilowCaz",
	"eyes":"BaseEyes",
	"maxDistance":20,
	"Cost":500
	},
	{
	# FREIHTER
	"Name":"Space Freighter",
	"Desc":"I can fix this..\n",
	"Owned":false,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/base.png",
	"Image":"shrilowFreighter",
	"eyes":"BaseEyes",
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
	"Image":"res://assets/images/computershrilows/shrilowBases/shrilowBase.png",
	"Cost":0
	},
	{
	# DATE NIGHT
	"Name":"Date Night",
	"Desc":"Everyone needs a fancy outfit for their date night! or, atleast i think they do? idk i show up in jeans usually lol\nincreases your click power by 1",
	"Owned":true,
	"IconKey":"res://assets/images/areas/wardrobe/clothing/datenight.png",
	"Image":"res://assets/images/computershrilows/shrilowBases/shrilowDate Night.png",
	"Cost":0
	},
]

var itemName = "Clothing name will show up here"
var itemDesc = "Click an item to buy it, hover to preview it."
