extends Node

var clicks = 0

var clickPower = 1
var clickPowerP1 = 0
var clickPowerP1R = 0
var clickPowerAdditions = 0
var clickPowerClothingBuffs = 0

var AUTOclickPower = 1
var AUTOclickPowerP1 = 0
var AUTOclickPowerP1R = 0
var AUTOclickPowerAdditions = 0
var AUTOclickPowerClothingBuffs = 0

var minesLength = 1
var health = 100

var stopTheCount = 0
var jellys = 0
var greasepuppies = 0
var amountOfRooms = 0

var melDialogue = [
	{
	"present":"About you",
	"dialogKey":"ABTYOU",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Interests?",
	"dialogKey":"INTERESTS",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Coding?",
	"dialogKey":"CODING",
	"unlocked":false,
	"interacted":false,
	},
	{
	"present":"Smoking Weed?",
	"dialogKey":"WEED",
	"unlocked":false,
	"interacted":false,
	},
	{
	"present":"My Little Pony?",
	"dialogKey":"MLP",
	"unlocked":false,
	"interacted":false,
	},
	#{
	#"present":"Still Wakes the Deep?",
	#"dialogKey":"STILLWAKES",
	#"unlocked":false,
	#"interacted":false,
	#},
	{
	"present":"Jerry Seinfeld",
	"dialogKey":"JERRY",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"How're u here?",
	"dialogKey":"HOW",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Opinions on here?",
	"dialogKey":"COMPUTEROPINIONS",
	"unlocked":false,
	"interacted":false,
	},
	{
	"present":"Melvin?",
	"dialogKey":"MELVIN",
	"unlocked":false,
	"interacted":false,
	},
	{
	"present":"Do u fw Skibidi Toilet",
	"dialogKey":"SKIBIDI",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"What's up with the jellies?",
	"dialogKey":"JELLIES",
	"unlocked":false,
	"interacted":false,
	},
	]

var descriptionSetting = ""

func updateClothes() -> void:
	clickPowerClothingBuffs = 0
	AUTOclickPowerClothingBuffs = 0
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Date Night":
		clickPowerClothingBuffs = 1
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Rig Mechanic":
		AUTOclickPowerClothingBuffs = 1
