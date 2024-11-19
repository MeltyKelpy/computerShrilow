extends Node

var itemInfomation = [
	{
	# AUTOCLICK
	"Image":"res://assets/images/areas/melanies/items/autoclick",
	"Name":"Autoclick",
	"Desc":"It's as simple as it sounds. autoclicks Shrilow every once in awhile, increasing for every upgrade you get.",
	"Upgradeable?":true,
	"MaxUpgrade":4,
	"CurUpgrade":0,
	"BaseValue":2,
	"UpgradeIncrease":(-0.4),
	"Owned":false,
	"Cost":50,
	"ScenePath":"res://technical/items/autoclicker.tscn",
	"Type":"Generic",
	},
	{
	# Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Bone",
	"Desc":"Doubles your base money per click for 30 seconds.",
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":300,
	"ScenePath":"res://technical/items/bone.tscn",
	"Type":"Consumable",
	},
	{
	# Auto-Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Auto-Bone",
	"Desc":"Doubles your auto clicker's base money per click for 30 seconds.",
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":500,
	"ScenePath":"res://technical/items/autobone.tscn",
	"Type":"Consumable",
	},
	{
	# Plus One
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Plus One",
	"Desc":"Adds one to your Base Money-Per-Click value.",
	"Upgradeable?":true,
	"MaxUpgrade":5,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":1000,
	"ScenePath":"res://technical/items/plusone.tscn",
	"Type":"Generic",
	},
	]

var itemName = "Item Name will show up Here"
var itemDesc = "Right here, an Item's description will show up."
var itemExtra = ""
var money = 0
