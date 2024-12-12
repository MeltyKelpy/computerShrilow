extends Node

var clickPower = 1
var clickPowerAdditions = 0
var clickPowerClothingBuffs = 0

var AUTOclickPower = 1
var AUTOclickPowerAdditions = 0
var AUTOclickPowerClothingBuffs = 0

var minesLength = 1
var health = 100

var stopTheCount = 0
var jellys = (-1)
var greasepuppies = (-1)

var melDialogue = [
	{
	"present":"About you",
	"dialogKey":"ABTYOU",
	"unlocked":true,
	},
	{
	"present":"Jerry Seinfeld",
	"dialogKey":"JERRY",
	"unlocked":true,
	},
	{
	"present":"Melvin?",
	"dialogKey":"MELVIN",
	"unlocked":true,
	},
	{
	"present":"Do u fw Skibidi Toilet",
	"dialogKey":"SKIBIDI",
	"unlocked":true,
	},
	{
	"present":"What's up with the jellies?",
	"dialogKey":"JELLIES",
	"unlocked":false,
	},
	]

func updateClothes() -> void:
	clickPowerClothingBuffs = 0
	AUTOclickPowerClothingBuffs = 0
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Date Night":
		clickPowerClothingBuffs = 1
