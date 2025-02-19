extends Node2D

var curClicks = 0.0
var rng = RandomNumberGenerator.new()
var held_object = false
var cameraMoveDir = "center"
var area = "notJellies"
var returnPosCamX = 577
var returnPosCamY = 324
var can = false
var melShopState = true
var melvinShopState = true
var marketShopState = true
var dialougeMode = false
var dialogKey = "none"
var alongTheDialogue = 0

var AnimPosCamX = 0
var AnimPosCamY = 0
var allowing = false

var rebirthIndicated = false

var storageReturnX = 0
var storageReturnY = 0
var storageReturnA = ""

var dialogueOptionsMelanie = []
var dialogueOptionsMelvin = []
var storage = []

var myEvilClockExists = false

var gumballSelection = 0
var gumballInfo = [
	{
	"Name":"Common Coin",
	"Desc":"The Common Coin - 200$\nbasic coin for getting jellies.\n\nCommon Chance: 98%\nUncommon Chance: 1.5%\nRare Chance: 0.5%\nAwesome Chance: 0%\nQueer Chance: 0%",
	"Cost":200,
	"imagePath":"res://assets/images/areas/gumball/coins/common.png",
	"1STOrder":"CommonChance", 
	"2NDOrder":"UncommonChance", 
	"3RDOrder":"RareChance", 
	"4THOrder":"AwesomeChance", 
	"5THOrder":"QueerChance",
	"CommonChance":98.0,
	"UncommonChance":1.5,
	"RareChance":0.5,
	"AwesomeChance":0.0,
	"QueerChance":0.0,
	},
	{
	"Name":"Uncommon Coin",
	"Desc":"The Uncommon Coin - 400$\nallows you to get uncommons alot more easily, but with added price.\n\nCommon Chance: 15%\nUncommon Chance: 80%\nRare Chance: 4%\nAwesome Chance: 1%\nQueer Chance: 0%",
	"Cost":400,
	"imagePath":"res://assets/images/areas/gumball/coins/uncommon.png",
	"1STOrder":"UncommonChance", 
	"2NDOrder":"CommonChance", 
	"3RDOrder":"RareChance", 
	"4THOrder":"AwesomeChance", 
	"5THOrder":"QueerChance",
	"CommonChance":15.0,
	"UncommonChance":80.0,
	"RareChance":4.0,
	"AwesomeChance":1.0,
	"QueerChance":0.0,
	},
	{
	"Name":"Rare Coin",
	"Desc":"The Rare Coin - 800$\nallows you to get rares alot more easily, but for ALOT more money.\n\nCommon Chance: 4%\nUncommon Chance: 30%\nRare Chance: 60%\nAwesome Chance: 18%\nQueer Chance: 1%",
	"Cost":800,
	"imagePath":"res://assets/images/areas/gumball/coins/rare.png",
	"1STOrder":"RareChance", 
	"2NDOrder":"UncommonChance", 
	"3RDOrder":"AwesomeChance", 
	"4THOrder":"CommonChance", 
	"5THOrder":"QueerChance",
	"CommonChance":4.0,
	"UncommonChance":30.0,
	"RareChance":60.0,
	"AwesomeChance":15.0,
	"QueerChance":1.0,
	},
	{
	"Name":"Awesome Coin",
	"Desc":"The Awesome Coin - 2000$\nallows you to get awesomes abit more easily, but for NOTABLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 19%\nRare Chance: 40%\nAwesome Chance: 40%\nQueer Chance: 1%",
	"Cost":2000,
	"imagePath":"res://assets/images/areas/gumball/coins/awesome.png",
	"1STOrder":"RareChance", 
	"2NDOrder":"AwesomeChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":19.0,
	"RareChance":40.0,
	"AwesomeChance":40.0,
	"QueerChance":1.0,
	},
	{
	"Name":"Queer Coin",
	"Desc":"The Queer Coin - $7500\nallows you to get queers abit more easily, but for INSANELY more money.\n\nCommon Chance: 0%\nUncommon Chance: 10%\nRare Chance: 35%\nAwesome Chance: 55%\nQueer Chance: 5%",
	"Cost":7500,
	"imagePath":"res://assets/images/areas/gumball/coins/queer.png",
	"1STOrder":"AwesomeChance", 
	"2NDOrder":"RareChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":15.0,
	"RareChance":35.0,
	"AwesomeChance":50.0,
	"QueerChance":5.0,
	},
	{
	"Name":"Platinum Coin",
	"Desc":"The Platinum Coin - $1000000\nallows you to get queers alot more easily, but for ABYSMALLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 0%\nRare Chance: 5%\nAwesome Chance: 80%\nQueer Chance: 15%",
	"Cost":1000000,
	"imagePath":"res://assets/images/areas/gumball/coins/platinum.png",
	"1STOrder":"AwesomeChance", 
	"2NDOrder":"RareChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":0.0,
	"RareChance":5.0,
	"AwesomeChance":80.0,
	"QueerChance":15.0,
	},
	]

var shitShrilowCanSay = [
	"Whos leg do i gotta hump to get a dry martini around here?",
	"FAGGOT. FAGGOT. FAGGOT.",
	"I wouldnt have missed",
	"I hope everyone who dies goes to hell no matter what",
	"I love moka dot coka",
	"I'm a real person",
	"you should go get an autism diagnosis",
	"play my game",
	"men",
	"ooo you wanna click me! ooo u wanna do it!",
	"pickle",
	"i turned myself into a pickle once, funniest thing ive ever done",
	"hear me out",
	"the bible? i hardly know her!",
	"who are you.",
	"IVE BEEN FUCKING PETRIFIED HELP ME",
	]

var cacapoopyGOD = preload("res://technical/MelaniesItem.tscn")

var jellies
var mines
var puppies
var rooms

func manageScenes():
	dialougeMode = true
	if melShopState == false:
		$Shop/ItemDescription.visible_ratio = 0
	if melvinShopState == false:
		$Melvin/ItemDescription.visible_ratio = 0
	clearDialogItems()
	# MELANIE DIALOGUE BELOW
	match dialogKey:
		"none":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "u should NOT be seeing this."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "this also worked as a test, which is cool"
			if alongTheDialogue == 2:
				endDialogue()
		"HOW":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Honestly? i dont really remember"
				for i in FizzyDrink.melDialogue.size():
					if FizzyDrink.melDialogue[i]["dialogKey"] == "COMPUTEROPINIONS":
						FizzyDrink.melDialogue[i]["unlocked"] = true
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "just sortaaa... woke up here?? i guess??"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "not too insanely pressed, alot of my other friends are here, like shrilow! and thats cool!!.. I guess?"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "does it make up for being trapped inside a computer? no LOL but its good enough if im gonna be here anyways."
			if alongTheDialogue == 4:
				endDialogue()
		"COMPUTEROPINIONS":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Its kinda chill, Jerry is annoying as fuck but i can handle him."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "That quick time event prick is a littleee bit annoying tho, same with those black market guys GOD FORBID someone do something original around here, huh?"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "but yeah, its fine, i guess"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "Never in my life did i think i'd be scared of a recycling bin, though. eugh. its SCARY in there."
			if alongTheDialogue == 4:
				endDialogue()
		"MELVIN":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "woah haha uhm whatareyou talking about idk who that is haha"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "ha!... haha....... ha... SHUT UP"
			if alongTheDialogue == 2:
				endDialogue()
		"ABTYOU":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Sure, im Melanie"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "average shopkeeper around the computer, its all i really do now that im here"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "i hope to do something more than just this someday, but if i dont then whatever"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "also my pronouns are she/it, if thats smth u care abt"
			if alongTheDialogue == 4:
				endDialogue()
		"INTERESTS":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "i really like drawing, and also coding, and listening to music, and getting high"
				for i in FizzyDrink.melDialogue.size():
					if FizzyDrink.melDialogue[i]["dialogKey"] == "CODING" or FizzyDrink.melDialogue[i]["dialogKey"] == "MLP" or FizzyDrink.melDialogue[i]["dialogKey"] == "WEED":
						FizzyDrink.melDialogue[i]["unlocked"] = true
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "and also girls, and also boys, one very specific alien boy to be exact"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "i also really like my little pony gen 4, SPECIFICALLY gen 4"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "thats about it, I guess?"
			if alongTheDialogue == 4:
				endDialogue()
		"CODING":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "coding is like. 10x easier than people make it seem"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "i've been coding for about 2 years now, and it's been real fun"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "except for when its not."
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "like the one time i sobbed while coding Enemy AI"
			if alongTheDialogue == 4:
				endDialogue()
		"MLP":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "i like MLP Gen 4 alot, been a fan for awhile now"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "pinkie pie is my favorite probably, but i like all of the mane 6 and the extended mane 6 aswell"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "despite being a kids show its still really good, and that makes sense cuz it was made when kid's television wasnt TRASH AND ASS so yk"
			if alongTheDialogue == 3:
				endDialogue()
		"WEED":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "what's there to say? i like smoking weed"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "im high off my mind as we speak, actually"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "you tryna get some? i know a guy"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "offers there, just saying"
			if alongTheDialogue == 4:
				endDialogue()
		#"STILLWAKES":
			#if alongTheDialogue == 0:
				#$Shop/ItemDescription.text = "genuinely the best game of 2024, no competition"
			#if alongTheDialogue == 1:
				#$Shop/ItemDescription.text = "beautiful sound design, genuinely scary, and visually beautiful aswell, what more could you want?"
			#if alongTheDialogue == 2:
				#$Shop/ItemDescription.text = "it's pretty linear, though. so it depends if thats something you fuck with or not"
			#if alongTheDialogue == 3:
				#$Shop/ItemDescription.text = "its kind of on the more expensive side, i suppose. if you dont got 50ish bucks laying around then i personally recommend jacksepticeye's playthrough of it, i really enjoyed that one"
			#if alongTheDialogue == 4:
				#endDialogue()
		"JERRY":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "oh. yeah. that guy."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "nobody likes him around here, espesically shoprunners."
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "its almost like he exists PURELY to steal all our money ( its all he does anyway, might as well be. )"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "i can say for CERTAIN that anyone around here fucking hates that guy. fact check me if you want, or dont. i dont rly care"
			if alongTheDialogue == 4:
				endDialogue()
		"SKIBIDI":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "...."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "consider jumping off a building, maybe ?"
			if alongTheDialogue == 2:
				endDialogue()
		"JELLIES":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "oh, yeah those things"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "i have no goddamn clue why they look like me, they just do."
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "but, because of that fact; when they seen me for the first time they declared me as their fucking QUEEN?!??!"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "so yeah idk i've been hiding from them ever since"
			if alongTheDialogue == 4:
				$Shop/ItemDescription.text = "theres so fucking many of them, and they're alot more evil than they seem dude."
			if alongTheDialogue == 5:
				$Shop/ItemDescription.text = "they tried to give me a dead bird as a royal offering. where are they finding birds in the computer ??"
			if alongTheDialogue == 6:
				endDialogue()
	
	# MELVIN DIALOGUE BELOW
	match dialogKey:
		"none":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "u should NOT be seeing this."
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "this also worked as a test, which is cool"
			if alongTheDialogue == 2:
				endDialogue()
		"ABTYOUMELV":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "Oh, yes! o-of course"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "I am, mel..vin"
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "I run the Jelly Daycare!"
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "And I have, absolutely NO correlation to that other shopkeeper! none at all! ha!.. haha!"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "...hm........."
			if alongTheDialogue == 5:
				endDialogue()
		"ABTYOUMELV":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "Oh, yes! o-of course"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "I am, mel..vin"
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "I run the Jelly Daycare!"
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "And I have, absolutely NO correlation to that other shopkeeper! none at all! ha!.. haha!"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "...hm........."
			if alongTheDialogue == 5:
				endDialogue()

func endDialogue():
	$Shop/ItemDescription.visible_ratio = 0
	dialougeMode = false
	dialogKey = "none"
	alongTheDialogue = 0
	if melShopState == false:
		spawnDialogueOptionsMelanie("melanie")
		setShopBase("melanie")
	if melvinShopState == false:
		spawnDialogueOptionsMelanie("melvin")
		setShopBase("melvin")

func generateHoes():
	for i in ItemValues.itemInfomation.size():
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		caca.type = "melanie"
		add_child(caca)
		caca.reparent($Shop/ScrollContainer/GridContainer)
	for i in ItemValues.melvinItems.size():
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		caca.type = "melvin"
		add_child(caca)
		caca.reparent($Melvin/ScrollContainer/GridContainer)
	for i in ItemValues.marketItems.size():
		var cacapoopyGOD2 = preload("res://technical/MarketItem.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($BlackMarket/ScrollContainer/GridContainer)
	for i in ClothingObjects.clothes.size():
		var cacapoopyGOD2 = preload("res://technical/clothingObject.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($Wardrobe/ScrollContainer/GridContainer)
	for i in Jelly.commonJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.commonJellies[i]["Name"]
		caca.desc = Jelly.commonJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Common"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.uncommonJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.uncommonJellies[i]["Name"]
		caca.desc = Jelly.uncommonJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Uncommon"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.rareJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.rareJellies[i]["Name"]
		caca.desc = Jelly.rareJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Rare"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.awesomeJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.awesomeJellies[i]["Name"]
		caca.desc = Jelly.awesomeJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Awesome"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.queerJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.queerJellies[i]["Name"]
		caca.desc = Jelly.queerJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Queer"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.blueJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.blueJellies[i]["Name"]
		caca.desc = Jelly.blueJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Blue"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)

func _ready():
	
	Game.loadData()
	
	$Mines.position.y = 648
	generateHoes()
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	# AWFUL CASE OF SPAGHETTI CODE IM JUST TOO LAZY TO WRITE THIS WELL LMAO
	if err == OK:
		
		if config.get_value("Fiscal", "Rebirths") > 0:
			$Shop/MarektIndicator.visible = true
			$Shop/EnterMarket.disabled = false
		else:
			$Shop/MarektIndicator.visible = false
			$Shop/EnterMarket.disabled = true
		
		for i in ["autoClickerUpgrade", "PlusOneUpgrade", "PlusOneAUTOUpgrade", "shrilowCry", "jellyCry", "mineCry"]:
			if config.get_value("Shop", i) == null:
				config.set_value("Shop", i, 0)
		for i in ["RebirthAutoClickerLevel", "PresistantPlusOne", "PlusOneMC"]:
			if config.get_value("Rebirth", i) == null:
				config.set_value("Rebirth", i, 0)
		
		for i in ["autoclicker", "plusone", "plusoneauto", "shrilowCrystal", "crystal", "mineCrystal", "Rautoclicker", "Rplusone", "Rplusoneauto"]:
			if i == "autoclicker":
				if config.get_value("Shop", "autoClickerUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "plusone":
				if config.get_value("Shop", "PlusOneUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "plusoneauto":
				if config.get_value("Shop", "PlusOneAUTOUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			if i == "shrilowCrystal":
				if config.get_value("Shop", "shrilowCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "crystal":
				if config.get_value("Shop", "jellyCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "mineCrystal":
				if config.get_value("Shop", "mineCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "Rautoclicker":
				if config.get_value("Rebirth", "RebirthAutoClickerLevel") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "Rplusone":
				if config.get_value("Rebirth", "PresistantPlusOne") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "Rplusoneauto":
				if config.get_value("Rebirth", "PlusOneMC") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
	
	if DirAccess.dir_exists_absolute("user://saveData/nodeSaves/file"+str(Game.curFile+1)) == true:
		rooms = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Rooms.tscn").instantiate()
		$Jelly/rooms.queue_free()
		$Jelly.add_child(rooms)
		
		jellies = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Jellies.tscn").instantiate()
		$Jelly/Control.queue_free()
		$Jelly.add_child(jellies)
		
		mines = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Mines.tscn").instantiate()
		$Mines/ScrollContainer/Control/MinesLevel.queue_free()
		$Mines/ScrollContainer/Control.add_child(mines)
		
		puppies = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Puppies.tscn").instantiate()
		$ShrilowScreen/puppies.queue_free()
		$ShrilowScreen.add_child(puppies)
		
		$setNames.start()
	
	Game.saveData()

func _process(_delta : float) -> void:
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	# AWFUL CASE OF SPAGHETTI CODE IM JUST TOO LAZY TO WRITE THIS WELL LMAO
	if err == OK:
		if ItemValues.money >= 5000000 + (1000000 * Game.rebirths) and rebirthIndicated == false and can == true:
			rebirthIndicated = true
			var cacapoopyGOD3 = preload("res://technical/rebirthNotification.tscn")
			var caca2 = cacapoopyGOD3.instantiate()
			add_child(caca2)
			$ShrilowScreen/Rebirth.disabled = false
			$ShrilowScreen/Rebirth.visible = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		var cacapoopyGOD2 = preload("res://technical/pauseMenu.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		caca.reparent($/root)
		get_tree().paused = true
	
	if Settings.settings[0]["enabled?"] == true:
		$Camera2D/kiwami.visible = true
	if Settings.settings[0]["enabled?"] == false:
		$Camera2D/kiwami.visible = false
	
	if dialougeMode == true and Input.is_action_just_pressed("Click"):
		alongTheDialogue += 1
		manageScenes()
	
	if melShopState == false:
		if $Shop/ItemDescription.visible_ratio > 1:
			$Shop/ItemDescription.visible_ratio = 1
		if $Shop/ItemDescription.visible_ratio < 1:
			$Shop/type.play()
			$Shop/ItemDescription.visible_characters += 50 * _delta
	if melvinShopState == false:
		if $Melvin/ItemDescription.visible_ratio > 1:
			$Melvin/ItemDescription.visible_ratio = 1
		if $Melvin/ItemDescription.visible_ratio < 1:
			$Shop/type.play()
			$Melvin/ItemDescription.visible_characters += 50 * _delta
	
	if dialougeMode == true:
		$Shop/BackButtonSHOP.disabled = true
		$Shop/BackSHOP.visible = false
		$Melvin/BackButton.disabled = true
		$Melvin/back.visible = false
	if dialougeMode == false:
		$Shop/BackButtonSHOP.disabled = false
		$Shop/BackSHOP.visible = true
		$Melvin/BackButton.disabled = false
		$Melvin/back.visible = true
	
	$Journal/jellyName.text = Jelly.jellyName
	$Journal/jellyDesc.text = Jelly.jellyDesc
	
	if get_tree().paused == false:
		$Camera2D/bg.visible = true
	else:
		$Camera2D/bg.visible = false
	
	if $Camera2D.position.x < (FizzyDrink.scrollLimitRIGHT) and $Camera2D.position.x > (FizzyDrink.scrollLimitLEFT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(1)
	elif $Camera2D.position.x == (FizzyDrink.scrollLimitRIGHT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(2)
	elif $Camera2D.position.x == (FizzyDrink.scrollLimitLEFT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(1)
	else:
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(2)
	
	if cameraMoveDir == "left" and area == "Jellies":
		$Camera2D.position.x -= 270 * _delta/0.5
	if cameraMoveDir == "right" and area == "Jellies":
		$Camera2D.position.x += 270 * _delta/0.5
	
	if area == "Jellies" and $Camera2D.position.x > (FizzyDrink.scrollLimitRIGHT):
		$Camera2D.position.x = (FizzyDrink.scrollLimitRIGHT)
	if area == "Jellies" and $Camera2D.position.x < (FizzyDrink.scrollLimitLEFT):
		$Camera2D.position.x = (FizzyDrink.scrollLimitLEFT)
	
	if FizzyDrink.stopTheCount != 0:
		if myEvilClockExists == false:
			var cacapoopyGOD2 = preload("res://technical/clock.tscn")
			var caca = cacapoopyGOD2.instantiate()
			add_child(caca)
			caca.create("Anti-virus", FizzyDrink.stopTheCount, "antivirus")
		myEvilClockExists = true
		$noEventsTimer.wait_time = FizzyDrink.stopTheCount
		$noEventsTimer.start($noEventsTimer.time_left + FizzyDrink.stopTheCount)
		FizzyDrink.riggedElection = FizzyDrink.stopTheCount
		FizzyDrink.stopTheCount = 0
		$EventTimer.paused = true
	if $noEventsTimer.time_left == 0:
		$EventTimer.paused = false
		myEvilClockExists = false
	
	if FizzyDrink.health >= 100:
		$Shrilow/ProgressBar.visible = false
	else:
		$Shrilow/ProgressBar.visible = true
	$Shrilow/ProgressBar.value = FizzyDrink.health
	if FizzyDrink.health <= 0:
		var cacapoopyGOD2 = load("res://technical/death.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
	
	$Gumball/stuff.text = gumballInfo[gumballSelection]["Desc"]
	$Gumball/coin.texture = load(gumballInfo[gumballSelection]["imagePath"])
	
	#elif gumballSelection == 1:
		#$Gumball/coinName.text = "Uncommon Coin"
		#$Gumball/stuff.text = "The Uncommon Coin, allows you to get uncommons alot more easily, but with added price.\n\nCommon Chance: 15%\nUncommon Chance: 80%\nRare Chance: 4%\nAwesome Chance: 1%\nQueer Chance: 0%"
	#elif gumballSelection == 2:
		#$Gumball/coinName.text = "Rare Coin"
		#$Gumball/stuff.text = "The Rare Coin, allows you to get rares alot more easily, but for ALOT more money.\n\nCommon Chance: 1%\nUncommon Chance: 40%\nRare Chance: 80%\nAwesome Chance: 18%\nQueer Chance: 1%"
	#elif gumballSelection == 3:
		#$Gumball/coinName.text = "Awesome Coin"
		#$Gumball/stuff.text = "The Awesome Coin, allows you to get awesomes abit more easily, but for NOTABLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 24%\nRare Chance: 40%\nAwesome Chance: 40%\nQueer Chance: 1%"
	#elif gumballSelection == 4:
		#$Gumball/coinName.text = "Queer Coin"
		#$Gumball/stuff.text = "The Queer Coin, allows you to get queers abit more easily, but for INSANELY more money.\n\nCommon Chance: 0%\nUncommon Chance: 10%\nRare Chance: 35%\nAwesome Chance: 55%\nQueer Chance: 5%"
	
	if $Melvin/ShopMusic.volume_db < 7 and area == "melvin":
		$Melvin/ShopMusic.volume_db += 0.5 + (0.5 * _delta)
	if $Melvin/ShopMusic.volume_db > -100 and area != "melvin":
		$Melvin/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $Market/ShopMusic.volume_db < 0 and area == "market":
		$Market/ShopMusic.volume_db += 0.5 + (0.5 * _delta)
	if $Market/ShopMusic.volume_db > -100 and area != "market":
		$Market/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $Shop/ShopMusic.volume_db < 0 and area == "melanie":
		$Shop/ShopMusic.volume_db += 1 + (1 * _delta)
	if $Shop/ShopMusic.volume_db > -100 and area != "melanie":
		$Shop/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $theVoid/mus.volume_db < -10 and area == "void":
		$theVoid/mus.volume_db += 1 + (1 * _delta)
	if $theVoid/mus.volume_db > -100 and area != "void":
		$theVoid/mus.volume_db -= 1 + (1 * _delta)
	
	$Mines/ScrollContainer/Control.custom_minimum_size.y = (648 * FizzyDrink.minesLength) + 100
	
	#$Mines/MinesBackground.position.y = $Mines/ScrollContainer.scroll_vertical
	
	$Shrilow/Shrilow.texture = load(ClothingObjects.clothes[ClothingObjects.equippedClothing]["Image"])
	
	if melShopState == true:
		$Shop/ItemName.text = ItemValues.itemName
		$Shop/ItemDescription.text = ItemValues.itemDesc
		$Shop/ItemExtra.text = ItemValues.itemExtra
	if melvinShopState == true:
		$Melvin/ItemName.text = ItemValues.itemName
		$Melvin/ItemDescription.text = ItemValues.itemDesc
	if area == "market":
		$BlackMarket/TokensCount.text = str(Game.rebirthTokens)
		$BlackMarket/ItemName.text = ItemValues.itemName
		$BlackMarket/ItemDescription.text = ItemValues.itemDesc
		$BlackMarket/ItemExtra.text = ItemValues.itemExtra
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(FizzyDrink.clicks)
	$USDText.text = str(round(ItemValues.money))
	$Gumball/USDText.text = str(round(ItemValues.money))
	$Melvin/USDText.text = str(round(ItemValues.money))
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	#if Input.is_action_just_pressed("eventText"):
		#$Camera2D.position.y = 324
		#_event()
		#if $Camera2D.position.x != -1221:
			#cameraAnimation("journal", -791, -1221)
		#if $Camera2D.position.x == -791:
			#cameraAnimation("journal", 576, 324)
	
	#if Input.is_action_just_pressed("DebugMode"):
		#$DEBUGVALUES.visible = !$DEBUGVALUES.visible
	
	if $DEBUGVALUES.visible == true:
		$DEBUGVALUES/ScrollContainer/Control/Label.text = "DEBUG MODE\n================\nEvent Timer: "+str($EventTimer.time_left)+"\nStop Events Timer: "+str($noEventsTimer.time_left)

func killIntro():
	$Camera2D/intro.queue_free()

func _on_shrilow_squeak_autoclick() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	if curClicks < 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/click.png")
	if curClicks >= 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/dizzy.png")
	ItemValues.money += FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerP1+FizzyDrink.AUTOclickPowerP1R+FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPowerClothingBuffs+FizzyDrink.shrilowPowerAuto
	$Shrilow/Squeak2.play()

func _on_shrilow_squeak_pressed() -> void:
	if Input.is_action_just_pressed("Click"):
		$faceRevert.stop()
		$faceRevert.start()
		$faceRevert2.stop()
		$faceRevert2.start()
		$Shrilow.scale.x = 1.2
		$Shrilow.scale.y = 0.85
		$Shrilow/Shrilow/ShrilowFace.visible = false
		$Shrilow/Shrilow/StillFace.visible = true
		if curClicks < 150:
			$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/click.png")
		if curClicks >= 150:
			$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/dizzy.png")
		$Shrilow/Squeak.play()
		ItemValues.money += FizzyDrink.clickPower+FizzyDrink.clickPowerP1+FizzyDrink.clickPowerP1R+FizzyDrink.clickPowerAdditions+FizzyDrink.clickPowerClothingBuffs+FizzyDrink.shrilowPower
		FizzyDrink.clicks += 1
		curClicks += 1
	if Input.is_action_just_pressed("rightClick"):
		$Shrilow/textBox/box/dialog.text = str(shitShrilowCanSay[rng.randi_range(0, shitShrilowCanSay.size()-1)])
		var tween = create_tween()
		tween.tween_property($Shrilow/textBox, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$Shrilow/Timer.start()

func _on_face_revert_timeout() -> void:
	$Shrilow/Shrilow/ShrilowFace.visible = true
	$Shrilow/Shrilow/StillFace.visible = false

func _on_shop_button_pressed() -> void:
	if can == true:
		can = false
		print("shop")
		area = "melanie"
		$sectionTransitions.play("toShop")

func _on_back_button_shop_pressed() -> void:
	if can == true:
		can = false
		if melShopState != true:
			melShopToggle()
		area = "notJellies"
		$sectionTransitions.play("leaveShop")

func _on_wardrobe_button_pressed() -> void:
	if can == true:
		can = false
		print("wardrobe")
		$sectionTransitions.play("toWard")

func _on_back_button_ward_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("leaveWard")

func _on_back_button_ward2_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("leaveMines")

func _on_trophies_button_pressed() -> void:
	pass
	#if can == true:
		#can = false
		#print("trophies")

func _on_mines_button_pressed() -> void:
	if can == true:
		can = false
		print("mines")
		$sectionTransitions.play("toMines")

func _event() -> void:
	$Camera2D/bg.visible = false
	var type = rng.randi_range(0, 1)
	var num
	if type == 0:
		num = rng.randi_range(0, Events.justMinigames.size()-1)
	if type == 1:
		num = rng.randi_range(0, Events.eventList.size()-1)
	_startEvent(num, type)

func _startEvent(numberPicked, type) -> void:
	var cacapoopyGOD2 
	if type == 1:
		cacapoopyGOD2 = load(Events.eventList[numberPicked]["AttachedScene"])
	if type == 0:
		cacapoopyGOD2 = load(Events.justMinigames[numberPicked]["AttachedScene"])
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	if type == 0:
		caca2.warn(Events.justMinigames[numberPicked]["WarningMessage"])
	if type == 1:
		caca2.warn(Events.eventList[numberPicked]["WarningMessage"])
	if type == 0:
		get_tree().paused = true
		Events.justMinigames[numberPicked]["Played?"] = true
		returnPosCamX = $Camera2D.position.x
		returnPosCamY = $Camera2D.position.y
		$Camera2D.position.x = 576
		$Camera2D.position.y = 324
		caca.reparent($/root)
		visible = false

func shrilowColor(color) -> void:
	if color == "base":
		$Shrilow/Shrilow.modulate = Color(1,1,1)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,1)
	if color == "yellow":
		$Shrilow/Shrilow.modulate = Color(1,1,0)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,0)

func _on_face_revert_2_timeout() -> void:
	curClicks = 0

func _on_back_button_jelly_pressed() -> void:
	area = "notJellies"
	$Camera2D/storg.disabled = true
	$Camera2D/storgImg.visible = false
	$Camera2D/storg.visible = false
	if can == true:
		can = false
		$sectionTransitions.play("leaveJellies")

func _on_jellies_button_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("toJellies")

func _on_right_move_mouse_entered() -> void:
	if $Camera2D.position.x < (FizzyDrink.scrollLimitRIGHT):
		cameraMoveDir = "right"

func _on_left_move_mouse_entered() -> void:
	if $Camera2D.position.x > (FizzyDrink.scrollLimitLEFT):
		cameraMoveDir = "left"

func _on_right_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _on_left_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _signal_jelly():
	area = "Jellies"
	FizzyDrink.scrollLimitRIGHT = -576
	FizzyDrink.scrollLimitLEFT = -1324
	$Camera2D/storg.disabled = false
	$Camera2D/storg.visible = true
	$Camera2D/storgImg.visible = true

func cameraAnimation(Varea, positionX, positionY, allowMove):
	if Varea == "bell":
		if area == "melvin":
			if melvinShopState != true:
				melvShopToggle()
			area = "notJellies"
		else:
			area = "melvin"
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MELVIN":
				FizzyDrink.melDialogue[i]["unlocked"] = true
	if Varea == "market":
		if area == "market":
			area = "melanie"
		else:
			area = "market"
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MARKET":
				FizzyDrink.melDialogue[i]["unlocked"] = true
	if area == "Jellies":
		area = "notJellies"
	$EventTimer.paused = true
	var end = false
	for i in $Camera2D/bg/icon.sprite_frames.get_animation_names():
		if i == Varea:
			end = true
	if end == true:
		$Camera2D/bg/icon.play(Varea)
	else:
		$Camera2D/bg/icon.play("elevator")
	AnimPosCamX = positionX
	AnimPosCamY = positionY
	$Camera2D/AnimationPlayer.play("open")
	allowing = allowMove

func moveCam():
	can = true
	$Camera2D.position.x = AnimPosCamX
	$Camera2D.position.y = AnimPosCamY
	if allowing == false and area == "Jellies":
		area = "notJellies"
	if allowing == true:
		area = "Jellies"
	if area == "notJellies" or area == "melvin" or area == "melanie" or area == "market":
		$Camera2D/storg.disabled = true
		$Camera2D/storgImg.visible = false
		$Camera2D/storg.visible = false
	else:
		$Camera2D/storg.disabled = false
		$Camera2D/storg.visible = true
		$Camera2D/storgImg.visible = true

func coinSelectionChange(toAdd: int) -> void:
	gumballSelection += toAdd
	if gumballSelection < 0:
		gumballSelection = 5
	if gumballSelection > 5:
		gumballSelection = 0

func _buyGumball_pressed() -> void:
	if ItemValues.money >= gumballInfo[gumballSelection]["Cost"]:
		var type = 0.0
		var rarityGotten = "Common"
		type = (rng.randi_range(1, 200))
		print(type)
		var jellyTypeToBe
		
		if (type <= 1 and gumballInfo[gumballSelection]["Name"] == "Queer Coin") or (type <= 1 and gumballInfo[gumballSelection]["Name"] == "Platinum Coin"):
			jellyTypeToBe = "BlueChance"
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["5THOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["5THOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["4THOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["4THOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["3RDOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["3RDOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["2NDOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["2NDOrder"]
		else:
			jellyTypeToBe = gumballInfo[gumballSelection]["1STOrder"]
		
		print(jellyTypeToBe)
		
		var goatedVar
		var caca
		
		if jellyTypeToBe == "CommonChance":
			rarityGotten = "Common"
			goatedVar = rng.randi_range(0, Jelly.commonJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.commonJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.commonJellies[goatedVar]["Seconds"]
			caca.money = Jelly.commonJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.commonJellies[goatedVar]["Discovered"]
			Jelly.commonJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "UncommonChance":
			rarityGotten = "Uncommon"
			goatedVar = rng.randi_range(0, Jelly.uncommonJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.uncommonJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.uncommonJellies[goatedVar]["Seconds"]
			caca.money = Jelly.uncommonJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.uncommonJellies[goatedVar]["Discovered"]
			Jelly.uncommonJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "RareChance":
			rarityGotten = "Rare"
			goatedVar = rng.randi_range(0, Jelly.rareJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.rareJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.rareJellies[goatedVar]["Seconds"]
			caca.money = Jelly.rareJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.rareJellies[goatedVar]["Discovered"]
			Jelly.rareJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "AwesomeChance":
			rarityGotten = "Awesome"
			goatedVar = rng.randi_range(0, Jelly.awesomeJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.awesomeJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.awesomeJellies[goatedVar]["Seconds"]
			caca.money = Jelly.awesomeJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.awesomeJellies[goatedVar]["Discovered"]
			Jelly.awesomeJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "QueerChance":
			rarityGotten = "Queer"
			goatedVar = rng.randi_range(0, Jelly.queerJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.queerJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.queerJellies[goatedVar]["Seconds"]
			caca.money = Jelly.queerJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.queerJellies[goatedVar]["Discovered"]
			Jelly.queerJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "BlueChance":
			rarityGotten = "Blue"
			goatedVar = rng.randi_range(0, Jelly.blueJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.blueJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.blueJellies[goatedVar]["Seconds"]
			caca.money = Jelly.blueJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.blueJellies[goatedVar]["Discovered"]
			Jelly.blueJellies[goatedVar]["Discovered"] = true
		
		add_child(caca)
		caca.buy()
		caca.getID(0)
		
		ItemValues.money -= gumballInfo[gumballSelection]["Cost"]
		
		#var num
		#if type == 0:
			#num = rng.randi_range(0, Events.justMinigames.size()-1)
		#if type == 1:
			#num = rng.randi_range(0, Events.eventList.size()-1)

func spawnDialogueOptionsMelanie(char : String):
	if char == "melanie":
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.melDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.melDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.melDialogue[i]["interacted"]
				caca.arrayToUse = "melanie"
				add_child(caca)
				caca.reparent($Shop/talkOptions/GridContainer)
				dialogueOptionsMelanie.append(caca)
	if char == "melvin":
		for i in FizzyDrink.melvinDialogue.size():
			if FizzyDrink.melvinDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.melvinDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.melvinDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.melvinDialogue[i]["interacted"]
				caca.arrayToUse = "melvin"
				add_child(caca)
				caca.reparent($Melvin/talkOptions/GridContainer)
				dialogueOptionsMelvin.append(caca)

func clearDialogItems():
	for i in dialogueOptionsMelanie.size():
		dialogueOptionsMelanie[i].queue_free()
	dialogueOptionsMelanie.resize(0)
	for i in dialogueOptionsMelvin.size():
		dialogueOptionsMelvin[i].queue_free()
	dialogueOptionsMelvin.resize(0)

func setShopBase(char : String):
	if char == "melanie":
		$Shop/Mel.play("talkBase")
		var openingMessages = [
			"Oh, yeah sure, i got nothing else to do",
			"Normally i couldnt do this, but its not like im selling anyone anything anyway",
			"Hm? need smth?",
			"Ask away, i guess",
			]
		$Shop/ItemName.text = "MELANIE:"
		$Shop/ItemDescription.text = openingMessages[rng.randi_range(0, openingMessages.size()-1)]
		$Shop/ItemExtra.text = ""
	if char == "melvin":
		$Melvin/melvin.play("talkBase")
		var openingMessages = [
			"o- oh! oh yeah! we can talk! sure...",
			"huh? oh- yeah! okay!",
			"can we just go back to you buying things, and me.. not drawing attention to myself??.. haha?",
			"A- Alright!",
			]
		$Melvin/ItemName.text = "MELVIN:"
		$Melvin/ItemDescription.text = openingMessages[rng.randi_range(0, openingMessages.size()-1)]

func melShopToggle() -> void:
	if dialogKey == "none":
		$Shop/ItemDescription.visible_characters = -1
		$Shop/ItemDescription.visible_ratio = 1
		melShopState = !melShopState
		if melShopState == false:
			$Shop/ItemDescription.visible_ratio = 0
			spawnDialogueOptionsMelanie("melanie")
			$Shop/ScrollContainer.position.y = 872
			$Shop/talkOptions.position.y = 112
			setShopBase("melanie")
			$USD.visible = false
			$USDText.visible = false
		if melShopState == true:
			clearDialogItems()
			$Shop/talkOptions.position.y = 872
			$Shop/ScrollContainer.position.y = 112
			$Shop/Mel.play("default")
			$USD.visible = true
			$USDText.visible = true
			$Shop/ItemDescription.visible_characters = -1
			$Shop/ItemDescription.visible_ratio = 1

func melvShopToggle() -> void:
	if dialogKey == "none":
		$Melvin/ItemDescription.visible_characters = -1
		$Melvin/ItemDescription.visible_ratio = 1
		melvinShopState = !melvinShopState
		if melvinShopState == false:
			$Melvin/ItemDescription.visible_ratio = 0
			spawnDialogueOptionsMelanie("melvin")
			$Melvin/ScrollContainer.position.y = 872
			setShopBase("melvin")
			$Melvin/talkOptions.position.y
			$Melvin/talkOptions.position.y = 112
		if melvinShopState == true:
			clearDialogItems()
			$Melvin/talkOptions.position.y = 872
			$Melvin/ScrollContainer.position.y = 112
			$Melvin/melvin.play("default")
			$USD.visible = true
			$USDText.visible = true
			$Melvin/ItemDescription.visible_characters = -1
			$Melvin/ItemDescription.visible_ratio = 1

func dialogueGoAway() -> void:
	var tween = create_tween()
	tween.tween_property($Shrilow/textBox, "scale", Vector2(0,0), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

func _on_section_transitions_animation_finished(anim_name: StringName) -> void:
	can = true

func urWelcomeSaayo():
	for i in ["Jellies", "Mines", "Puppies", "Rooms"]:
		var scene = PackedScene.new()
		var scene_root
		if i == "Jellies":
			scene_root = $Jelly/Control
		if i == "Rooms":
			scene_root = $Jelly/rooms
		if i == "Mines":
			scene_root = $Mines/ScrollContainer/Control/MinesLevel
		if i == "Puppies":
			scene_root = $ShrilowScreen/puppies
		_set_owner(scene_root, scene_root)
		scene.pack(scene_root)
		var path = "user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/"+i+".tscn"
		ResourceSaver.save(scene, path)
	
func _set_owner(node, root):
	if node != root:
		node.owner = root
	for child in node.get_children():
		_set_owner(child, root)

func _on_set_names_timeout() -> void:
	if mines.name != "MinesLevel":
		mines.name = "MinesLevel"
	if jellies.name != "Control":
		jellies.name = "Control"
	if puppies.name != "puppies":
		puppies.name = "puppies"
	if rooms.name != "rooms":
		rooms.name = "rooms"

func _on_timer_timeout() -> void:
	Game.gameTime += 1.0

func _spawnStorage() -> void:
	for i in Jelly.storedJellys.size():
		var cacapoopyGOD2 = load("res://technical/jellies/storedJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jellyNum = i
		caca.jelly = Jelly.storedJellys[i]["Name"]
		caca.money = Jelly.storedJellys[i]["MoneyGain"]
		caca.seconds = Jelly.storedJellys[i]["Seconds"]
		caca.rarity = Jelly.storedJellys[i]["Rarity"]
		add_child(caca)
		caca.reparent($storage/ScrollContainer/GridContainer)
		storage.append(caca)

func _reloadStorage():
	for i in storage.size():
		storage[i].queue_free()
	storage.resize(0)
	_spawnStorage()

func _deleteStorag() -> void:
	for i in storage.size():
		storage[i].queue_free()
	storage.resize(0)

func storageCamShit(type : String):
	if can == true:
		if type == "enter":
			storageReturnA = area
			storageReturnX = $Camera2D.position.x
			storageReturnY = $Camera2D.position.y
			cameraAnimation("storage", -791, -3424, false)
			_spawnStorage()
		if type == "leave":
			cameraAnimation(storageReturnA, storageReturnX, storageReturnY, false)
			var timer2 = Timer.new()
			timer2.wait_time = 3.1
			timer2.one_shot = true
			timer2.autostart = true
			timer2.connect("timeout", changeArea)
			add_child(timer2)
	can = false

func changeArea():
	area = storageReturnA
	$Camera2D/storg.disabled = false
	$Camera2D/storg.visible = true
	$Camera2D/storgImg.visible = true
	_deleteStorag()

func autosave() -> void:
	Game.saveData()
	DirAccess.make_dir_absolute(Game.scenePaths[Game.curFile])
	urWelcomeSaayo()
	$Camera2D/autoPoop.visible = true
	$Camera2D/autoPoop/poopTimer.start()

func killPoop() -> void:
	$Camera2D/autoPoop.visible = false

func marketState(type : String) -> void:
	if type == "enter":
		if $Market/ShopMusic.playing == false:
			$Market/ShopMusic.play()
		$Camera2D/bg.self_modulate = Color(0.1,0.1,0.1,1)
		cameraAnimation("market", 1923, 1167, false)
	if type == "leave":
		$Camera2D/bg.self_modulate = Color(1,1,1,1)
		cameraAnimation("market", 576, 324, false)
	if type == "void":
		if can == true:
			area = "void"
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(186,903), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
			tween.parallel().tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$theVoid.position.x = 1923
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/voidDoorOpen.png")
			can = false
	if type == "voidLeave":
		if can == true:
			area = "market"
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(1922,1167), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
			tween.parallel().tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$theVoid.position.x = 3117
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/voidDoorClosed.png")
			can = false
	if type == "blackmarket":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$BlackMarket.position.x = 1923
			$BlackMarket.position.y = 1167
			$Market/marketDoor.texture = load("res://assets/images/areas/blackMarket/marketDoorOpen.png")
			can = false
	if type == "blackmarketLeave":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$BlackMarket.position.x = 1937
			$BlackMarket.position.y = 1861
			$Market/marketDoor.texture = load("res://assets/images/areas/blackMarket/marketDoorClosed.png")
			can = false
	if type == "PBJ":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(186,903), 1).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			tween.parallel().tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$theVoid.position.x = 1923
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/PBJDoorOpen.png")
			can = false
	if type == "PBJLeave":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(1922,1167), 1).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
			tween.parallel().tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$theVoid.position.x = 3117
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/PBJDoorClosed.png")
			can = false

func canpls():
	can = true

func _Rebirth() -> void:
	can = false
	$Camera2D/AudioStreamPlayer.play()
	$Camera2D/ColorRect.visible = true
	$Camera2D/Timer.start()
	FizzyDrink.stopTheCount = 100
	$Shrilow/Squeak.volume_db = -80
	$Shrilow/Squeak2.volume_db = -80

func rebirth() -> void:
	get_tree().change_scene_to_file("res://scenes/rebirthScene.tscn")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	can = true
