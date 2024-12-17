extends Node2D

var clicks = 0.0
var curClicks = 0.0
var rng = RandomNumberGenerator.new()
var held_object = false
var cameraMoveDir = "center"
var area = "notJellies"
var returnPosCamX = 0
var returnPosCamY = 0
var can = true
var melShopState = true
var melvinShopState = true
var dialougeMode = false
var dialogKey = "none"
var alongTheDialogue = 0

var AnimPosCamX = 0
var AnimPosCamY = 0
var allowing = false

var dialogueOptionsMelanie = []

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
	"Desc":"The Awesome Coin - 4500$\nallows you to get awesomes abit more easily, but for NOTABLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 19%\nRare Chance: 40%\nAwesome Chance: 40%\nQueer Chance: 1%",
	"Cost":4500,
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
	"Desc":"The Queer Coin - $10000\nallows you to get queers abit more easily, but for INSANELY more money.\n\nCommon Chance: 0%\nUncommon Chance: 10%\nRare Chance: 35%\nAwesome Chance: 55%\nQueer Chance: 5%",
	"Cost":10000,
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

func manageScenes():
	dialougeMode = true
	$Shop/ItemDescription.visible_ratio = 0
	clearDialogItems()
	match dialogKey:
		"none":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "u should NOT be seeing this."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "this also worked as a test, which is cool"
			if alongTheDialogue == 2:
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
					if FizzyDrink.melDialogue[i]["dialogKey"] == "CODING" or FizzyDrink.melDialogue[i]["dialogKey"] == "MLP" or FizzyDrink.melDialogue[i]["dialogKey"] == "STILLWAKES" or FizzyDrink.melDialogue[i]["dialogKey"] == "WEED":
						FizzyDrink.melDialogue[i]["unlocked"] = true
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "and also girls, and also boys, one very specific alien boy to be exact"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "i also really like my little pony gen 4, SPECIFICALLY gen 4"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "and also Still Wakes the Deep, thats a really good game and you should check it out i think"
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
				$Shop/ItemDescription.text = "pinkie pie is my favorite, maybe thats generic but i really enjoy her silly personality, its comforting to watch for me"
			if alongTheDialogue == 2:
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
		"STILLWAKES":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "genuinely the best game of 2024, no competition"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "beautiful sound design, genuinely scary, and visually beautiful aswell, what more could you want?"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "it's pretty linear, though. so it depends if thats something you fuck with or not"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "its kind of on the more expensive side, i suppose. if you dont got 50ish bucks laying around then i personally recommend jacksepticeye's playthrough of it, i really enjoyed that one"
			if alongTheDialogue == 4:
				endDialogue()
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

func endDialogue():
	$Shop/ItemDescription.visible_ratio = 0
	dialougeMode = false
	dialogKey = "none"
	alongTheDialogue = 0
	spawnDialogueOptionsMelanie()
	setShopBase()

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
	$Mines.position.y = 648
	generateHoes()

func _process(_delta : float) -> void:
	
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
			if $talkTimer.is_stopped() == true:
				$talkTimer.start()
	if melvinShopState == false:
		if $Melvin/ItemDescription.visible_ratio > 1:
			$Melvin/ItemDescription.visible_ratio = 1
		if $Melvin/ItemDescription.visible_ratio < 1:
			if $talkTimer.is_stopped() == true:
				$talkTimer.start()
	
	if dialougeMode == true:
		$Shop/BackButtonSHOP.disabled = true
		$Shop/BackSHOP.visible = false
	if dialougeMode == false:
		$Shop/BackButtonSHOP.disabled = false
		$Shop/BackSHOP.visible = true
	
	$Journal/jellyName.text = Jelly.jellyName
	$Journal/jellyDesc.text = Jelly.jellyDesc
	
	if get_tree().paused == false:
		$Camera2D/bg.visible = true
	else:
		$Camera2D/bg.visible = false
	
	if $Camera2D.position.x < (-576) and $Camera2D.position.x > (-1324) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(1)
	elif $Camera2D.position.x == (-576) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(2)
	elif $Camera2D.position.x == (-1324) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(1)
	else:
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(2)
	
	if cameraMoveDir == "left" and area == "Jellies":
		$Camera2D.position.x -= 270 * _delta/0.5
	if cameraMoveDir == "right" and area == "Jellies":
		$Camera2D.position.x += 270 * _delta/0.5
	
	if area == "Jellies" and $Camera2D.position.x > (-576):
		$Camera2D.position.x = (-576)
	if area == "Jellies" and $Camera2D.position.x < (-1324):
		$Camera2D.position.x = (-1324)
	
	if FizzyDrink.stopTheCount != 0:
		$noEventsTimer.wait_time = FizzyDrink.stopTheCount
		$noEventsTimer.start($noEventsTimer.time_left + FizzyDrink.stopTheCount)
		FizzyDrink.stopTheCount = 0
		$EventTimer.paused = true
	if $noEventsTimer.time_left == 0:
		$EventTimer.paused = false
	
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
	
	if $Shop/ShopMusic.volume_db < 0 and area == "melanie":
		$Shop/ShopMusic.volume_db += 1 + (1 * _delta)
	if $Shop/ShopMusic.volume_db > -100 and area != "melanie":
		$Shop/ShopMusic.volume_db -= 1 + (1 * _delta)
	
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
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(clicks)
	$USDText.text = str(round(ItemValues.money))
	$Gumball/USDText.text = str(round(ItemValues.money))
	$Melvin/USDText.text = str(round(ItemValues.money))
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	if Input.is_action_just_pressed("eventText"):
		$Camera2D.position.y = 324
		#_event()
		#if $Camera2D.position.x != -1221:
			#cameraAnimation("journal", -791, -1221)
		#if $Camera2D.position.x == -791:
			#cameraAnimation("journal", 576, 324)
	
	if Input.is_action_just_pressed("DebugMode"):
		$DEBUGVALUES.visible = !$DEBUGVALUES.visible
	
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
	ItemValues.money += FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPowerClothingBuffs
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
		ItemValues.money += FizzyDrink.clickPower+FizzyDrink.clickPowerAdditions+FizzyDrink.clickPowerClothingBuffs
		clicks += 1
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
	if can == true:
		can = false
		print("trophies")

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
	if can == true:
		can = false
		$sectionTransitions.play("leaveJellies")

func _on_jellies_button_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("toJellies")

func _on_right_move_mouse_entered() -> void:
	if $Camera2D.position.x < (-576):
		cameraMoveDir = "right"

func _on_left_move_mouse_entered() -> void:
	if $Camera2D.position.x > (-1324):
		cameraMoveDir = "left"

func _on_right_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _on_left_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _signal_jelly():
	area = "Jellies"

func cameraAnimation(Varea, positionX, positionY, allowMove):
	if Varea == "bell":
		if area == "melvin":
			area = "notJellies"
		else:
			area = "melvin"
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MELVIN":
				FizzyDrink.melDialogue[i]["unlocked"] = true
	if area != "melvin":
		area = "notJellies"
	$EventTimer.paused = true
	$Camera2D/bg/icon.play(Varea)
	AnimPosCamX = positionX
	AnimPosCamY = positionY
	$Camera2D/AnimationPlayer.play("open")
	allowing = allowMove

func moveCam():
	$Camera2D.position.x = AnimPosCamX
	$Camera2D.position.y = AnimPosCamY
	print(AnimPosCamY)
	if allowing == false and area == "Jellies":
		area = "notJellies"
	if allowing == true:
		area = "Jellies"

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
		caca.getID(0)
		
		ItemValues.money -= gumballInfo[gumballSelection]["Cost"]
		
		#var num
		#if type == 0:
			#num = rng.randi_range(0, Events.justMinigames.size()-1)
		#if type == 1:
			#num = rng.randi_range(0, Events.eventList.size()-1)

func spawnDialogueOptionsMelanie():
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

func clearDialogItems():
	for i in dialogueOptionsMelanie.size():
		dialogueOptionsMelanie[i].queue_free()
	dialogueOptionsMelanie.resize(0)

func setShopBase():
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

func melShopToggle() -> void:
	if dialogKey == "none":
		$Shop/ItemDescription.visible_characters = -1
		$Shop/ItemDescription.visible_ratio = 1
		melShopState = !melShopState
		if melShopState == false:
			$Shop/ItemDescription.visible_ratio = 0
			spawnDialogueOptionsMelanie()
			$Shop/ScrollContainer.position.y = 872
			$Shop/talkOptions.position.y = 112
			setShopBase()
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

func dialogueGoAway() -> void:
	var tween = create_tween()
	tween.tween_property($Shrilow/textBox, "scale", Vector2(0,0), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

func _on_talk_timer_timeout() -> void:
	if melShopState == false:
		$Shop/type.play()
		$Shop/ItemDescription.visible_characters += 1
	if melvinShopState == false:
		$Shop/type.play()
		$Melvin/ItemDescription.visible_characters += 1

func _on_section_transitions_animation_finished(anim_name: StringName) -> void:
	can = true
