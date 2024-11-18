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
	"ScenePath":"res://technical/items/autoclicker.tscn"
	},
	{
	# Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Bone",
	"Desc":"not too sure what it does, its kind of just a bone.",
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":25,
	"ScenePath":null
	}
	]

var itemName = "Item Name will show up Here"
var itemDesc = "Right here, an Item's description will show up."
var itemExtra = ""
var money = 0
