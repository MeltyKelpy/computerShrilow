extends Node

var itemInfomation = [
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleLeft",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"Click-Up!",
	"ImgType":"titlePiece",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleRight",
	"Type":"Title",
	},
	{
	# AUTOCLICK
	"Image":"res://assets/images/areas/melanies/items/autoclick",
	"Name":"Autoclick",
	"Desc":'"Its as simple as it sounds. autoclicks Shrilow every once in awhile, increasing for every upgrade you get." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":8,
	"CurUpgrade":0,
	"BaseValue":3,
	"UpgradeIncrease":(-0.4),
	"Owned":false,
	"Purchased":false,
	"Cost":100,
	"ScenePath":"res://technical/items/autoclicker.tscn",
	"Type":"Generic",
	},
	{
	# Plus One
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Plus One",
	"Desc":'"Adds one to your Base Money-Per-Click value." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":10000000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":500,
	"ScenePath":"res://technical/items/plusone.tscn",
	"Type":"Generic",
	},
	{
	# Plus One AUTO
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Plus One Auto",
	"Desc":'"Adds one to your Base Money-Per-Click for the autoclicker." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":10000000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":1000,
	"ScenePath":"res://technical/items/plusoneauto.tscn",
	"Type":"Generic",
	},
	#{
	## JELLY
	#"Image":"res://assets/images/areas/melanies/items/jelly.png",
	#"Name":"Jelly!",
	#"Desc":'"Little Goober who produces $1 every 3 seconds, while not alot, you can buy as many as you want!" -Mel ',
	#"Upgradeable?":false,
	#"MaxUpgrade":1,
	#"CurUpgrade":0,
	#"BaseValue":0,
	#"UpgradeIncrease":1,
	#"Owned":false,
	#"Cost":150,
	#"ScenePath":"res://technical/items/jelly.tscn",
	#"Type":"Consumable",
	#},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleLeft",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"Money Makers",
	"ImgType":"titlePiece",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleRight",
	"Type":"Title",
	},
	{
	# Greasepuppy
	"Image":"res://assets/images/areas/melanies/items/greasepuppy.png",
	"Name":"Greasepuppy",
	"Desc":'"spawns in the main shrilow area, they only give you $1 every 3 seconds, but you can buy as many as you want." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":75,
	"ScenePath":"res://technical/items/Greasepuppy.tscn",
	"Type":"Consumable",
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
	"Purchased":false,
	"Cost":300,
	"ScenePath":"res://technical/items/bone.tscn",
	"Type":"Consumable",
	},
	{
	# Auto-Bone
	"Image":"res://assets/images/areas/melanies/items/bone.png",
	"Name":"Auto-Bone",
	"Desc":'"Doubles your auto clickers base money per click for 30 seconds." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":600,
	"ScenePath":"res://technical/items/autobone.tscn",
	"Type":"Consumable",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleLeft",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"Events",
	"ImgType":"titlePiece",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleRight",
	"Type":"Title",
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
	"Purchased":false,
	"Cost":150,
	"ScenePath":"res://technical/items/floppydiskevent.tscn",
	"Type":"Consumable",
	},
	{
	# IMEDIATE EVENT
	"Image":"res://assets/images/areas/melanies/items/floppydisk.png",
	"Name":"Notably Shinier Floppy Disk",
	"Desc":'"Immediately starts a minigame event you havent played yet on the current run, useful if you want to unlock all the minigames. you completionist whore." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
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
	"Purchased":false,
	"Cost":500,
	"ScenePath":"res://technical/items/blockOutEvents.tscn",
	"Type":"Consumable",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleLeft",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"Crystals",
	"ImgType":"titlePiece",
	"Type":"Title",
	},
	{
	"ScenePath":"res://technical/shopTitle.tscn",
	"SectionName":"",
	"ImgType":"titleRight",
	"Type":"Title",
	},
	{
	# PUPPYCRYSTAL
	"Image":"res://assets/images/areas/melanies/items/puppyCrystal",
	"Name":"Puppy Crystal",
	"Desc":'"Mid-Game upgrade for your greasepuppies, makes their money gain 3 instead of 1. only one crystal can be on at once." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":150000,
	"ScenePath":"res://technical/items/puppyCrystal.tscn",
	"Type":"Generic",
	},
	{
	# SHRILOWCRYSTAL
	"Image":"res://assets/images/areas/melanies/items/shrilowCrystal",
	"Name":"Shrilow Crystal",
	"Desc":'"Late-game upgrade for your $ per click/auto-click, doubles it!. only one crystal can be on at once." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":300000,
	"ScenePath":"res://technical/items/shrilowCrystal.tscn",
	"Type":"Generic",
	},
	{
	# JELLYCRYSTAL
	"Image":"res://assets/images/areas/melanies/items/jellyCrystal",
	"Name":"Jelly Crystal",
	"Desc":'"Late-game upgrade for your overall jelly $ per second amounts, triples the money and halves the time!. only one crystal can be on at once." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":500000,
	"ScenePath":"res://technical/items/crystal.tscn",
	"Type":"Generic",
	},
	{
	# MINECRYSTAL
	"Image":"res://assets/images/areas/melanies/items/mineCrystal",
	"Name":"Mine Crystal",
	"Desc":'"Late-game upgrade for your miners income, doubles it! only one crystal can be on at once." -Mel ',
	"Upgradeable?":true,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":750000,
	"ScenePath":"res://technical/items/mineCrystal.tscn",
	"Type":"Generic",
	},
	]

var gambleCore = [
	{
	"Image":"res://assets/images/areas/melanies/items/seinfeld.png",
	"Name":"Jerry Seinfeld!",
	"Desc":'"Summons a jerry seinfeld" - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/jerryseinfeld.tscn",
	"Type":"Consumable",
	},
	{
	"Image":"res://assets/images/areas/melanies/items/jerrybomb.png",
	"Name":"Jerry Bomb!",
	"Desc":'"Summons 3 jerry seinfelds" - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/jerrybomb.tscn",
	"Type":"Consumable",
	},
	{
	"Image":"res://assets/images/areas/melanies/items/jerrybomb.png",
	"Name":"MASSIVE Jerry Bomb!",
	"Desc":'"Summons 6 jerry seinfelds" - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/massivejerrybomb.tscn",
	"Type":"Consumable",
	},
	{
	"Image":"res://assets/images/areas/melanies/items/seinfeld.png",
	"Name":"JERRY INVASION",
	"Desc":'"SUMMONS 12 JERRY SEINFELDS" - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/jerryinvasion.tscn",
	"Type":"Consumable",
	},
	{
	"Image":"res://assets/images/areas/melanies/items/orang.png",
	"Name":"orange",
	"Desc":'"orange" - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/orange.tscn",
	"Type":"Consumable",
	},
	{
	"Image":"res://assets/images/areas/melanies/items/money.png",
	"Name":"Your Money Back!",
	"Desc":'"well," - Bricks',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Purchased":false,
	"Cost":0,
	"ScenePath":"res://technical/items/gamblecore/yourmoneyback.tscn",
	"Type":"Consumable",
	},
	]

var shopTUTORIAL = [
	{
	# Greasepuppy
	"Image":"res://assets/images/areas/melanies/items/greasepuppy.png",
	"Name":"Greasepuppy",
	"Desc":'"spawns in the main shrilow area, they only give you $3 every 3 seconds, but you can buy as many as you want." -Mel ',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":50,
	"ScenePath":"res://technical/items/GreasepuppyTUTORIAL.tscn",
	"Type":"Consumable",
	}]

var melvinItems = [
	#{
	# BASIC ROOM
	#"Image":"res://assets/images/areas/melanies/items/room.png",
	#"Name":"Basic Room",
	#"Desc":'"a basic room, jelly capcity of 15." - melvin',
	#"Upgradeable?":false,
	#"MaxUpgrade":1,
	#"CurUpgrade":0,
	#"BaseValue":0,
	#"UpgradeIncrease":0,
	#"Owned":false,
	#"Cost":300,
	#"ScenePath":"res://technical/jellies/basicRoom.tscn",
	#"Type":"Consumable",
	#},
	{
	# SIMPLE ROOM
	"Image":"res://assets/images/areas/melanies/items/room.png",
	"Name":"Simple Room",
	"Desc":'"a simple room, jelly capcity of 5." - melvin',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":100,
	"ScenePath":"res://technical/jellies/simpleRoom.tscn",
	"Type":"Consumable",
	},
	{
	# SIMPLE ROOM
	"Image":"res://assets/images/areas/melanies/items/room.png",
	"Name":"Cozy Cabin",
	"Desc":'"a cozy cabin, jelly capcity of 5." - melvin',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":150,
	"ScenePath":"res://technical/jellies/cozyCabin.tscn",
	"Type":"Consumable",
	},
	#{
	## SIZABLE ROOM
	#"Image":"res://assets/images/areas/melanies/items/room.png",
	#"Name":"Sizable Room",
	#"Desc":'"a sizable room, jelly capcity of 8." - melvin',
	#"Upgradeable?":false,
	#"MaxUpgrade":1,
	#"CurUpgrade":0,
	#"BaseValue":0,
	#"UpgradeIncrease":0,
	#"Owned":false,
	#"Cost":250,
	#"ScenePath":"res://technical/jellies/basicRoom.tscn",
	#"Type":"Consumable",
	#},
	#{
	## SIMPLE ROOM
	#"Image":"res://assets/images/areas/melanies/items/room.png",
	#"Name":"The Break Room",
	#"Desc":'"a break room, jelly capcity of 8." - melvin',
	#"Upgradeable?":false,
	#"MaxUpgrade":1,
	#"CurUpgrade":0,
	#"BaseValue":0,
	#"UpgradeIncrease":0,
	#"Owned":false,
	#"Cost":300,
	#"ScenePath":"res://technical/jellies/basicRoom.tscn",
	#"Type":"Consumable",
	#},
	{
	# The Court
	"Image":"res://assets/images/areas/melanies/items/room.png",
	"Name":"The Court",
	"Desc":'"a basketball court, jelly capcity of 10." - melvin',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":450,
	"ScenePath":"res://technical/jellies/TheCourt.tscn",
	"Type":"Consumable",
	},
	{
	# Pit
	"Image":"res://assets/images/areas/melanies/items/room.png",
	"Name":"The Pit",
	"Desc":'"a pit. max jelly count of 100" - melvin',
	"Upgradeable?":false,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":0,
	"Owned":false,
	"Cost":2000,
	"ScenePath":"res://technical/jellies/thePit.tscn",
	"Type":"Consumable",
	},
	]

var marketItems = [
	{
	# AUTOCLICK
	"Image":"res://assets/images/areas/melanies/items/autoclick",
	"Name":"MARKETCLICKER",
	"Desc":'Autoclicker, but black market-ified! Level stays between rebirths.',
	"Upgradeable?":true,
	"MaxUpgrade":8,
	"CurUpgrade":0,
	"BaseValue":3,
	"UpgradeIncrease":(-0.4),
	"Owned":false,
	"Purchased":false,
	"Cost":5,
	"ScenePath":"res://technical/rebirthShit/Rautoclicker.tscn",
	"Type":"Generic",
	},
	{
	# Plus One
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Persistent Plus One",
	"Desc":'Adds one to your $ per click value. value stays between rebirths!',
	"Upgradeable?":true,
	"MaxUpgrade":10000000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":5,
	"ScenePath":"res://technical/rebirthShit/Rplusone.tscn",
	"Type":"Generic",
	},
	{
	# Plus One AUTO
	"Image":"res://assets/images/areas/melanies/items/plus1",
	"Name":"Plus One MC",
	"Desc":'Adds one to your MARKET-CLICKER'+"'"+'s $ per click value. value stays between rebirths!',
	"Upgradeable?":true,
	"MaxUpgrade":10000000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":10,
	"ScenePath":"res://technical/rebirthShit/Rplusoneauto.tscn",
	"Type":"Generic",
	},
	{
	# EVIL MINES
	"Image":"res://assets/images/areas/blackMarket/market/items/evilMines",
	"Name":"Evil Mines",
	"Desc":'Doubles the level cap for Mines. stays between rebirths!',
	"Upgradeable?":true,
	"MaxUpgrade":1,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":10,
	"ScenePath":"res://technical/rebirthShit/allowEvilMines.tscn",
	"Type":"Generic",
	},
	{
	# ANTAG
	"Image":"res://assets/images/areas/blackMarket/market/items/antagJelly",
	"Name":"Antag Jelly",
	"Desc":'Gives you the Antag Jelly, an upgradable jelly! stays between rebirths',
	"Upgradeable?":true,
	"MaxUpgrade":10000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":10,
	"ScenePath":"res://technical/items/jelly.tscn",
	"Type":"Generic",
	},
	{
	# PHANTOM
	"Image":"res://assets/images/areas/blackMarket/market/items/phantomJelly",
	"Name":"Phantom Jelly",
	"Desc":'Gives you the Phantom Jelly, an upgradable jelly! stays between rebirths',
	"Upgradeable?":true,
	"MaxUpgrade":10000,
	"CurUpgrade":0,
	"BaseValue":0,
	"UpgradeIncrease":1,
	"Owned":false,
	"Purchased":false,
	"Cost":10,
	"ScenePath":"res://technical/items/jelly.tscn",
	"Type":"Generic",
	},
	]

var donationItems = [
	# added for convenience when making the donation loading system later
	{"shouldntbehere":"hellosourcecoderumager"},
	{
	"Name":"Decorate the Main Area",
	"Desc":"Funding to Decorate the Main Area! (the one where shrilow is).\n\nIf funded, will add streamers and other silly things to decorate the main area!",
	"FundingStages":4,
	"FundingStage":0,
	"FundMinimum":500000,
	"CurrentFunding":0,
	"Img":"",
	},
	{
	"Name":"Improve Mine Conditions",
	"Desc":"Funding to Increase Miner Working Conditions!\n\nIf funded, it'll uhmmmm give them all construction gear",
	"FundingStages":1,
	"FundingStage":0,
	"FundMinimum":100000,
	"CurrentFunding":0,
	"Img":"",
	},
	]

var itemName = "Item Name will show up Here"
var itemDesc = "Right here, an Item's description will show up."
var itemExtra = ""
var total_money = 0
var money = 0
var maxMoney = 0

func _find_item(id):
	var result = 0
	for i in itemInfomation.size():
		if itemInfomation[i]["Type"] != "Title":
			if itemInfomation[i]["Name"] == id:
				result = i
	return result

func _find_item_in_array(id, array):
	var result = 0
	for i in array.size():
		if array[i]["Type"] != "Title":
			if array[i]["Name"] == id:
				result = i
	return result

func _process(_delta: float) -> void:
	if money > maxMoney:
		maxMoney = money
