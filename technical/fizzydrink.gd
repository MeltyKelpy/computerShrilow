extends Node

var clicks = 0

var clickPower = 1
var clickPowerP1 = 0
var clickPowerP1R = 0
var clickPowerAdditions = 0
var clickPowerClothingBuffs = 0
var shrilowPower = 0

var AUTOclickPower = 1
var AUTOclickPowerP1 = 0
var AUTOclickPowerP1R = 0
var AUTOclickPowerAdditions = 0
var AUTOclickPowerClothingBuffs = 0
var shrilowPowerAuto = 0

var minesLength = 1
var health = 100

var stopTheCount = 0
var riggedElection = 0
var jellys = 0
var greasepuppies = 0
var amountOfRooms = 0

var enabledCrystal = "none"

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
	{
	"present":"Black Market?",
	"dialogKey":"MARKETCONTINUED",
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
var melvinDialogue = [
	{
	"present":"About you",
	"dialogKey":"ABTYOUMELV",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"About this place",
	"dialogKey":"ABTDAYCARE",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Origin of the Jellies",
	"dialogKey":"JELLYORIGINS",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Caring for a Jelly",
	"dialogKey":"CARINGFORJELLIES",
	"unlocked":true,
	"interacted":false,
	},
	]
var marketDialogue = [
	{
	"present":"Who are yall?",
	"dialogKey":"whoAreYall",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"What is this place?",
	"dialogKey":"whatIsThis",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Phantom, you look like ghostybricks.",
	"dialogKey":"BRICKS",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"do you fw skibidi toilet?",
	"dialogKey":"skibidi",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"QuickTime Event?",
	"dialogKey":"QTE",
	"unlocked":false,
	"interacted":false,
	},
	{
	"present":"Melanie?",
	"dialogKey":"MELANIN",
	"unlocked":false,
	"interacted":false,
	},
	]

var descriptionSetting = ""

var scrollLimitLEFT = 0
var scrollLimitRIGHT = 0

func _process(float) -> void:
	if str(enabledCrystal) == str(0):
		enabledCrystal = "shrilow"
	if enabledCrystal == "shrilow":
		shrilowPower = (FizzyDrink.clickPowerAdditions+FizzyDrink.clickPower+FizzyDrink.clickPowerP1+FizzyDrink.clickPowerP1R+FizzyDrink.clickPowerClothingBuffs)
		shrilowPowerAuto = (FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerP1+FizzyDrink.AUTOclickPowerP1R+FizzyDrink.AUTOclickPowerClothingBuffs)
	else: 
		shrilowPower = 0
		shrilowPowerAuto = 0

func updateClothes() -> void:
	clickPowerClothingBuffs = 0
	AUTOclickPowerClothingBuffs = 0
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Date Night":
		clickPowerClothingBuffs = 1
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Rig Mechanic":
		AUTOclickPowerClothingBuffs = 1
