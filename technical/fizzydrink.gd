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
	"present":"Crystals?",
	"dialogKey":"CRYSTALS",
	"unlocked":false,
	"interacted":false,
	"important":true,
	},
	{
	"present":"I need phone numbers",
	"dialogKey":"NUMBERS",
	"unlocked":false,
	"interacted":false,
	"important":true,
	},
	{
	"present":"How do I get to AppData?",
	"dialogKey":"appdataHelp",
	"unlocked":false,
	"interacted":false,
	"important":true,
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
	"present":"Can i use your phone lol",
	"dialogKey":"phone",
	"unlocked":false,
	"interacted":false,
	"important":true,
	},
	{
	"present":"Phantom whats your password",
	"dialogKey":"password",
	"unlocked":false,
	"interacted":false,
	"important":true,
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
var bricksDialogue = [
	{
	"present":"About you",
	"dialogKey":"ABTYOUBRICKS",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"How does this place work?",
	"dialogKey":"ABTCASINO",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"whats your fucking problem",
	"dialogKey":"BRICKSINSULT",
	"unlocked":true,
	"interacted":false,
	},
	{
	"present":"Phantom?",
	"dialogKey":"BRICKSPHANTOM",
	"unlocked":true,
	"interacted":false,
	},
	]

var callers = [
	{"name":"Antag","id":0314,"unlocked?":true,"img":"antagvinyet.png", "audio":"minerkid", "maxcalls":999, "timescalled":0},
	{"name":"The Miner Kid","id":2012,"unlocked?":false,"img":"minerkidvinyet.png", "audio":"minerkid", "maxcalls":2, "timescalled":0},
	{"name":"QuickTime-Event","id":2006,"unlocked?":false,"img":"qtevinyet.png", "audio":"minerkid", "maxcalls":2, "timescalled":0},
	{"name":"Melanie","id":0962,"unlocked?":false},
	{"name":"OJSTheCoder","id":2636,"unlocked?":false},
	{"name":"KlutzyBugzyx3","id":0222,"unlocked?":false,"img":"spencervinyet.png", "audio":"spencer", "maxcalls":4, "timescalled":0},
	{"name":"MeltyKelpy","id":0315,"unlocked?":false},
	{"name":"John Stoner","id":0420,"unlocked?":false,"img":"johnstonervinyet.png", "audio":"johnstoner", "maxcalls":2, "timescalled":0},
	]

var descriptionSetting = ""

var amountOfHomeCrystals = 0

var scrollLimitLEFT = 0
var scrollLimitRIGHT = 0

var properlySeled = ""

func _unlock_phone_number(caller_id):
	for i in callers.size():
		if callers[i]["id"] == caller_id:
			return caller_id

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://assets/images/ibeam.png"), Input.CURSOR_IBEAM)

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
	properlySeled = ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"]
	clickPowerClothingBuffs = 0
	AUTOclickPowerClothingBuffs = 0
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Date Night":
		clickPowerClothingBuffs = 1
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Rig Mechanic":
		AUTOclickPowerClothingBuffs = 1
