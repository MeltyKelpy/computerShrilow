extends Node

var itemInfomation = [
	{
	# AUTOCLICK
	"Image":"res://assets/images/areas/melanies/items/autoclick",
	"Name":"Autoclick",
	"Desc":'"Its as simple as it sounds. autoclicks Shrilow every once in awhile, increasing for every upgrade you get." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":5,
	"CurUpgrade":0,
	"BaseValue":2,
	"UpgradeIncrease":(-0.4),
	"Owned":false,
	"Cost":300,
	"ScenePath":"res://technical/items/autoclicker.tscn",
	"Type":"Generic",
	},
	{
	# Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Bone",
	"Desc":'"Doubles your base money per click for 30 seconds." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":600,
	"ScenePath":"res://technical/items/bone.tscn",
	"Type":"Consumable",
	},
	{
	# Auto-Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Auto-Bone",
	"Desc":'"Doubles your auto clickers base money per click for 10 seconds." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":1000,
	"ScenePath":"res://technical/items/autobone.tscn",
	"Type":"Consumable",
	},
	{
	# Plus One
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Plus One",
	"Desc":'"Adds one to your Base Money-Per-Click value." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":100,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":1000,
	"ScenePath":"res://technical/items/plusone.tscn",
	"Type":"Generic",
	},
	{
	# IMEDIATE EVENT
	"Image":"res://assets/images/areas/melanies/items/floppydisk.png",
	"Name":"Floppy Disk",
	"Desc":'"Immediately starts a minigame event, useful if you want to get some more coins fast." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":150,
	"ScenePath":"res://technical/items/floppydiskevent.tscn",
	"Type":"Consumable",
	},
	{
	# IMEDIATE EVENT
	"Image":"res://assets/images/areas/melanies/items/floppydisk.png",
	"Name":"Notably Shinier Floppy Disk",
	"Desc":'"Immediately starts a minigame event you havent played yet, useful if you want to unlock all the minigames. you completionist whore." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":300,
	"ScenePath":"res://technical/items/shinyfloppydiskevent.tscn",
	"Type":"Consumable",
	},
	{
	# ANTIVIRUS
	"Image":"res://assets/images/areas/melanies/items/antivirus.png",
	"Name":"Antivirus",
	"Desc":'"Blocks out events for 30 minutes, everytime you buy it, it adds 30 more minutes to the event restriction timer. Not something i recommend, but to each their own." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":200,
	"ScenePath":"res://technical/items/blockOutEvents.tscn",
	"Type":"Consumable",
	},
	{
	# JELLY
	"Image":"res://assets/images/areas/melanies/items/jelly.png",
	"Name":"Jelly!",
	"Desc":'"Little Goober who produces $1 every 2 seconds, while not alot, you can buy as many as you want!" -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Cost":250,
	"ScenePath":"res://technical/items/jelly.tscn",
	"Type":"Consumable",
	},
	]

var itemName = "Item Name will show up Here"
var itemDesc = "Right here, an Item's description will show up."
var itemExtra = ""
var money = 0
var maxMoney = 0

func _process(_delta: float) -> void:
	if money > maxMoney:
		maxMoney = money
