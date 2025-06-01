extends Node

var files = [
	"user://saveData/file1.cfg",
	"user://saveData/file2.cfg",
	"user://saveData/file3.cfg",
	]

var scenePaths = [
	"user://saveData/nodeSaves/file1",
	"user://saveData/nodeSaves/file2",
	"user://saveData/nodeSaves/file3",
	]

var namee = "SAVE FILE"
var jellies = 0
var gumballsBought = 0
var platinumGumballsBought = 0
var rebirths = 0
var gameTime = 0.0
var icon = 0
var saveFileClicks = 0
var gameVersion = "00.02.82"

var rebirthJellyProtocol = []

var boxed = false

var curFile = 0

var evilMines = false
var RebirthIntroPlayed = false
var rebirthTokens = 0

func reloadGlobals():
	var s 
	s = Jelly.get_script()
	Jelly.set_script(null)
	Jelly.set_script(s)
	
	s = FizzyDrink.get_script()
	FizzyDrink.set_script(null)
	FizzyDrink.set_script(s)
	
	s = ItemValues.get_script()
	ItemValues.set_script(null)
	ItemValues.set_script(s)
	
	s = ClothingObjects.get_script()
	ClothingObjects.set_script(null)
	ClothingObjects.set_script(s)
	
	s = Achievements.get_script()
	Achievements.set_script(null)
	Achievements.set_script(s)
	
	s = Curses.get_script()
	Curses.set_script(null)
	Curses.set_script(s)
	
	s = Journal.get_script()
	Journal.set_script(null)
	Journal.set_script(s)

func reset():
	var s = get_script()
	set_script(null)
	set_script(s)

func unlock_outfit(ID):
	var output
	for i in ClothingObjects.clothes.size():
		if ClothingObjects.clothes[i]["Name"] == ID:
			output = i
			break
	if output != null:
		if ClothingObjects.clothes[output]["Unlocked"] == false:
			ClothingObjects.clothes[output]["Unlocked"] = true
			await get_tree().create_timer(6).timeout
			Game.notify("AND, you've also unlocked an outfit...", "trophy")

func unlock_achievement(id : String):
	var achievementID
	for i in Achievements.achievements.size():
		if Achievements.achievements[i]["ID"] == id:
			achievementID = i
			break
	if achievementID != null:
		if Achievements.achievements[achievementID]["unlocked?"] == false:
			Achievements.achievements[achievementID]["unlocked?"] = true
			Game.notify('you got the "'+Achievements.achievements[achievementID]["name"]+'" achievement!\n'+Achievements.achievements[achievementID]["desc"], "trophy")

func achievement_unlocked(id):
	var achievementID
	for i in Achievements.achievements.size():
		if Achievements.achievements[i]["ID"] == id:
			achievementID = i
			break
	if achievementID != null:
		return Achievements.achievements[achievementID]["unlocked?"]

func _find_achievement(id):
	var achievementID = false
	for i in Achievements.achievements.size():
		if Achievements.achievements[i]["ID"] == id:
			achievementID = i
			break
	return achievementID

func commizeNumber(value: int) -> String:
	# Convert value to string.
	var str_value: String = str(value)
	
	# Check if the value is positive or negative.
	# Use index 0(excluded) if positive to avoid comma before the 1st digit.
	# Use index 1(excluded) if negative to avoid comma after the - sign.
	var loop_end: int = 0 if value > -1 else 1
	
	# Loop backward starting at the last 3 digits,
	# add comma then, repeat every 3rd step.
	var config = ConfigFile.new()
	
	var err = config.load("user://settings.cfg")
	
	for i in range(str_value.length()-3, loop_end, -3):
		if err == OK:
			str_value = str_value.insert(i, Settings.settings[Settings.get_setting("seperator")]["selection"])
		else:
			str_value = str_value.insert(i, ",")
	
	# Return the formatted string.
	return str_value

func notify(text : String, hashtagicon : String):
	var cacapoopyGOD3 = preload("res://technical/notification.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	caca2.texture = hashtagicon
	caca2.text = text
	$/root.add_child(caca2)

func flyer(flyer : String):
	var cacapoopyGOD3 = preload("res://technical/flyer.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	$/root.add_child(caca2)
	caca2._load(flyer)

func warn(text : String):
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn(text)

func inform(text : String):
	var cacapoopyGOD3 = preload("res://technical/informational.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	caca2.text = text
	$/root.add_child(caca2)

func load():
	loadData()

func save():
	saveData()

func contains_curse(ID):
	for i in range(Curses.curses.size()):
		if Curses.curses[i]["ID"] == ID:
			return true
	return false

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load(files[curFile])
	
	if err == OK:
		config.set_value("Fiscal", "gameVersion", gameVersion)
		namee = config.get_value("Fiscal", "Name")
		jellies = config.get_value("Fiscal", "Jellies")
		Jelly.storedJellys = config.get_value("Fiscal", "StoredJellies")
		rebirths = config.get_value("Fiscal", "Rebirths")
		gameTime = config.get_value("Fiscal", "Time")
		icon = config.get_value("Fiscal", "Icon")
		FizzyDrink.clicks = config.get_value("Fiscal", "Clicks")
		ItemValues.money = config.get_value("Fiscal", "Money")
		ClothingObjects.equippedClothing = config.get_value("Fiscal", "Clothing")
		FizzyDrink.jellys = config.get_value("Fiscal", "AmountOfJellies")
		FizzyDrink.amountOfRooms = config.get_value("Fiscal", "AmountOfRooms", 0)
		gumballsBought = config.get_value("Fiscal", "ballsBought", 0)
		platinumGumballsBought = config.get_value("Fiscal", "platBallsBought", 0)
		if config.get_value("Rebirth", "RebirthBoxTokens") != null:
			boxed = config.get_value("Rebirth", "RebirthBoxTokens")
		else:
			boxed = false
		Curses.curses = []
		Curses.curses = config.get_value("Rebirth", "Curses", [])
		
		if config.get_value("Journal", "journalShit") != null:
			if config.get_value("Journal", "journalShit").size() == Journal.entriesText.size():
				for i in Journal.entriesText.size():
					for e in Journal.entriesText[Journal.entriesText.keys()[i]].size():
						var that_one_fucking_array = Journal.entriesText[Journal.entriesText.keys()[i]]
						if e == 0:
							that_one_fucking_array[e] = config.get_value("Journal", "journalShit")[Journal.entriesText.keys()[i]]["locked"]
						else:
							that_one_fucking_array[e]["revealed?"] = config.get_value("Journal", "journalShit")[Journal.entriesText.keys()[i]][that_one_fucking_array[e]["id"]]
		
		if typeof(config.get_value("Story", "DialogueDoneMELANIE")) == 19:
			for i in config.get_value("Story", "DialogueDoneMELANIE").size():
				FizzyDrink.melDialogue[i]["unlocked"] = config.get_value("Story", "DialogueUnlockedMELANIE")[i]
				FizzyDrink.melDialogue[i]["interacted"] = config.get_value("Story", "DialogueDoneMELANIE")[i]
			for i in config.get_value("Story", "DialogueDoneBRICKS").size():
				FizzyDrink.bricksDialogue[i]["unlocked"] = config.get_value("Story", "DialogueUnlockedBRICKS")[i]
				FizzyDrink.bricksDialogue[i]["interacted"] = config.get_value("Story", "DialogueDoneBRICKS")[i]
			for i in config.get_value("Story", "DialogueDoneMELVIN").size():
				FizzyDrink.melvinDialogue[i]["unlocked"] = config.get_value("Story", "DialogueUnlockedMELVIN")[i]
				FizzyDrink.melvinDialogue[i]["interacted"] = config.get_value("Story", "DialogueDoneMELVIN")[i]
			for i in config.get_value("Story", "DialogueDoneMARKET").size():
				FizzyDrink.marketDialogue[i]["unlocked"] = config.get_value("Story", "DialogueUnlockedMARKET")[i]
				FizzyDrink.marketDialogue[i]["interacted"] = config.get_value("Story", "DialogueDoneMARKET")[i]
		
		var lazy = {
			"Autoclick":"autoClickerUpgrade",
			"Plus One":"PlusOneUpgrade",
			"Plus One Auto":"PlusOneAUTOUpgrade",
			"Shrilow Crystal":"shrilowCry",
			"Puppy Crystal":"puppyCry",
			"Jelly Crystal":"jellyCry",
			"Mine Crystal":"mineCry",
			}
		for i in ["Autoclick", "Plus One", "Plus One Auto", "Shrilow Crystal", "Jelly Crystal", "Mine Crystal", "Puppy Crystal"]:
			for e in ItemValues.itemInfomation.size():
				if ItemValues.itemInfomation[e].has("Name"):
					if ItemValues.itemInfomation[e]["Name"] == i:
						print(ItemValues.itemInfomation[e]["CurUpgrade"])
						print(config.get_value("Shop", lazy[i]))
						ItemValues.itemInfomation[e]["CurUpgrade"] = config.get_value("Shop", lazy[i])
		FizzyDrink.enabledCrystal = config.get_value("Shop", "selectedCrystal")
		
		var lazymarket = {
			"MARKETCLICKER":"RebirthAutoClickerLevel",
			"Persistent Plus One":"PresistantPlusOne",
			"Plus One MC":"PlusOneMC",
			"Antag Jelly":"AntagJelly",
			"Phantom Jelly":"PhantomJelly",
			}
		for i in ["MARKETCLICKER", "Persistent Plus One", "Plus One MC", "Antag Jelly", "Phantom Jelly"]:
			for e in ItemValues.marketItems.size():
				if ItemValues.marketItems[e].has("Name"):
					if ItemValues.marketItems[e]["Name"] == i:
						ItemValues.marketItems[e]["CurUpgrade"] = config.get_value("Rebirth", lazymarket[i])
		evilMines = config.get_value("Rebirth", "EvilMinesAvaliable", false)
		rebirthJellyProtocol = config.get_value("Rebirth", "rebirthJellyProtocol")
		
		
		var myPretties = config.get_value("Shop", "PurchasesShop", [])
		
		if myPretties.size() == ItemValues.itemInfomation.size():
			for i in ItemValues.itemInfomation.size():
				if ItemValues.itemInfomation[i].has("Purchased"):
					ItemValues.itemInfomation[i]["Purchased"] = myPretties[i]
		
		var myPretties2 = config.get_value("Rebirth", "PurchasesReb", [])
		
		if myPretties2.size() == ItemValues.itemInfomation.size():
			for i in ItemValues.marketItems.size():
				if ItemValues.marketItems[i].has("Purchased"):
					ItemValues.marketItems[i]["Purchased"] = myPretties2[i]
		
		var minigameStars = config.get_value("Fiscal", "minigameStars", null)
		if minigameStars != null:
			for i in minigameStars.size():
				Events.justMinigames[i]["BestStars"] = minigameStars[i]
		
		var minigamePlayed = config.get_value("Fiscal", "minigamePlayed", null)
		if minigamePlayed != null:
			for i in minigamePlayed.size():
				Events.justMinigames[i]["Played?"] = minigamePlayed[i]
		
		# config.set_value("Stats", "amountOfMines", FizzyDrink.minesLength)
		FizzyDrink.minesLength = config.get_value("Stats", "amountOfMines")
		FizzyDrink.greasepuppies = config.get_value("Stats", "greasepuppies")
		var commons = config.get_value("Stats", "commonJellies")
		var uncommons = config.get_value("Stats", "uncommonJellies")
		var rares = config.get_value("Stats", "rareJellies")
		var awesomes = config.get_value("Stats", "awesomeJellies")
		var queers = config.get_value("Stats", "queerJellies")
		var blues = config.get_value("Stats", "blueJellies")
		for i in Jelly.commonJellies.size():
			if commons.size()-1 >= i:
				Jelly.commonJellies[i]["Discovered"] = commons[i]
		for i in Jelly.uncommonJellies.size():
			if uncommons.size()-1 >= i:
				Jelly.uncommonJellies[i]["Discovered"] = uncommons[i]
		for i in Jelly.rareJellies.size():
			if rares.size()-1 >= i:
				Jelly.rareJellies[i]["Discovered"] = rares[i]
		for i in Jelly.awesomeJellies.size():
			if awesomes.size()-1 >= i:
				Jelly.awesomeJellies[i]["Discovered"] = awesomes[i]
		for i in Jelly.queerJellies.size():
			if queers.size()-1 >= i:
				Jelly.queerJellies[i]["Discovered"] = queers[i]
		for i in Jelly.blueJellies.size():
			if blues.size()-1 >= i:
				Jelly.blueJellies[i]["Discovered"] = blues[i]
		
		var awesome = config.get_value("Stats", "ownedClothes", [])
		if awesome.size() < ClothingObjects.clothes.size():
			awesome.resize(ClothingObjects.clothes.size())
		for i in ClothingObjects.clothes.size():
			if awesome[i] != null:
				ClothingObjects.clothes[i]["Owned"] = awesome[i]
			else:
				ClothingObjects.clothes[i]["Owned"] = false
		
		var awesome2 = config.get_value("Stats", "unlockedClothes", [])
		if awesome2.size() < ClothingObjects.clothes.size():
			awesome2.resize(ClothingObjects.clothes.size())
		for i in ClothingObjects.clothes.size():
			if awesome2[i] != null:
				ClothingObjects.clothes[i]["Unlocked"] = awesome2[i]
		
		rebirthTokens = config.get_value("Rebirth", "RebirthTokens")
		
		saveFileClicks = config.get_value("Achievements", "All-Time-Clicks", 0)
		
		if Game.saveFileClicks == null:
			Game.saveFileClicks = 0
		
		Achievements.load()

func saveData():
	
	DirAccess.make_dir_absolute("user://saveData")
	DirAccess.make_dir_absolute("user://saveData/nodeSaves")
	
	var config = ConfigFile.new()
	
	config.load(files[curFile])
	
	# NON RESETING // REBIRTH STUFF
	# including shows up on file menu and is considered "main" data (FISCAL)
	
	config.set_value("Fiscal", "gameVersion", gameVersion)
	config.set_value("Fiscal", "Name", namee)
	config.set_value("Fiscal", "Jellies", jellies)
	config.set_value("Fiscal", "Rebirths", rebirths)
	config.set_value("Fiscal", "Time", gameTime)
	config.set_value("Fiscal", "Clicks", FizzyDrink.clicks)
	config.set_value("Fiscal", "Icon", icon)
	
	config.set_value("Rebirth", "RebirthTokens", rebirthTokens)
	config.set_value("Rebirth", "Curses", Curses.curses)
	config.set_value("Rebirth", "RebirthBoxTokens", boxed)
	config.set_value("Rebirth", "EvilMinesAvaliable", evilMines)
	
	var entryStatsToSave = {}
	for i in Journal.entriesText.size():
		var shit = {}
		for e in Journal.entriesText[Journal.entriesText.keys()[i]].size():
			var motherfuckingarray = Journal.entriesText[Journal.entriesText.keys()[i]]
			if e == 0:
				shit["locked"] = motherfuckingarray[e]
			else:
				shit[motherfuckingarray[e]["id"]] = motherfuckingarray[e]["revealed?"]
		entryStatsToSave[Journal.entriesText.keys()[i]] = shit
	config.set_value("Journal", "journalShit", entryStatsToSave)
	
	var minigameStars = []
	for i in Events.justMinigames.size():
		minigameStars.append(Events.justMinigames[i]["BestStars"])
	config.set_value("Fiscal", "minigameStars", minigameStars)
	
	var minigamePlayed = []
	for i in Events.justMinigames.size():
		minigamePlayed.append(Events.justMinigames[i]["Played?"])
	config.set_value("Fiscal", "minigamePlayed", minigamePlayed)
	
	var lazymarket = {
		"MARKETCLICKER":"RebirthAutoClickerLevel",
		"Persistent Plus One":"PresistantPlusOne",
		"Plus One MC":"PlusOneMC",
		"Antag Jelly":"AntagJelly",
		"Phantom Jelly":"PhantomJelly",
		}
	for i in ["MARKETCLICKER", "Persistent Plus One", "Plus One MC", "Antag Jelly", "Phantom Jelly"]:
		for e in ItemValues.marketItems.size():
			if ItemValues.marketItems[e].has("Name"):
				if ItemValues.marketItems[e]["Name"] == i:
						config.set_value("Rebirth", lazymarket[i], ItemValues.marketItems[e]["CurUpgrade"])
	config.set_value("Rebirth", "rebirthJellyProtocol", rebirthJellyProtocol)
	config.set_value("Story", "RebirthIntroPlayed", RebirthIntroPlayed)
	config.set_value("Fiscal", "ballsBought", gumballsBought)
	config.set_value("Fiscal", "platBallsBought", platinumGumballsBought)
	
	var commons = []
	var uncommons = []
	var rares = []
	var awesomes = []
	var queers = []
	var markets = []
	var blues = []
	for i in Jelly.commonJellies.size():
		commons.append(Jelly.commonJellies[i]["Discovered"])
	for i in Jelly.uncommonJellies.size():
		uncommons.append(Jelly.uncommonJellies[i]["Discovered"])
	for i in Jelly.rareJellies.size():
		rares.append(Jelly.rareJellies[i]["Discovered"])
	for i in Jelly.awesomeJellies.size():
		awesomes.append(Jelly.awesomeJellies[i]["Discovered"])
	for i in Jelly.queerJellies.size():
		queers.append(Jelly.queerJellies[i]["Discovered"])
	for i in Jelly.blueJellies.size():
		blues.append(Jelly.blueJellies[i]["Discovered"])
	config.set_value("Stats", "commonJellies", commons)
	config.set_value("Stats", "uncommonJellies", uncommons)
	config.set_value("Stats", "rareJellies", rares)
	config.set_value("Stats", "awesomeJellies", awesomes)
	config.set_value("Stats", "queerJellies", queers)
	config.set_value("Stats", "blackMarketJellies", markets)
	config.set_value("Stats", "blueJellies", blues)
	
	# REBIRTH RESETING
	
	var lazy = {
		"Autoclick":"autoClickerUpgrade",
		"Plus One":"PlusOneUpgrade",
		"Plus One Auto":"PlusOneAUTOUpgrade",
		"Shrilow Crystal":"shrilowCry",
		"Jelly Crystal":"jellyCry",
		"Mine Crystal":"mineCry",
		"Puppy Crystal":"puppyCry",
		}
	for i in ["Autoclick", "Plus One", "Plus One Auto", "Shrilow Crystal", "Jelly Crystal", "Mine Crystal", "Puppy Crystal"]:
		for e in ItemValues.itemInfomation.size():
			if ItemValues.itemInfomation[e].has("Name"):
				if ItemValues.itemInfomation[e]["Name"] == i:
					config.set_value("Shop", lazy[i], ItemValues.itemInfomation[e]["CurUpgrade"])
	
	var shopPurchases = []
	shopPurchases.resize(ItemValues.itemInfomation.size())
	for i in ItemValues.itemInfomation.size():
		if ItemValues.itemInfomation[i].has("Purchased"):
			shopPurchases[i] = (ItemValues.itemInfomation[i]["Purchased"])
	config.set_value("Shop", "PurchasesShop", shopPurchases)
	
	var marketPurchases = []
	marketPurchases.resize(ItemValues.marketItems.size())
	for i in ItemValues.marketItems.size():
		if ItemValues.marketItems[i].has("Purchased"):
			marketPurchases[i] = (ItemValues.marketItems[i]["Purchased"])
	config.set_value("Rebirth", "PurchasesReb", marketPurchases)
	
	config.set_value("Fiscal", "AmountOfJellies", FizzyDrink.jellys)
	config.set_value("Fiscal", "AmountOfRooms", FizzyDrink.amountOfRooms)
	config.set_value("Fiscal", "Money", ItemValues.money)
	config.set_value("Fiscal", "StoredJellies", Jelly.storedJellys)
	config.set_value("Fiscal", "Clothing", ClothingObjects.equippedClothing)
	config.set_value("Stats", "amountOfMines", FizzyDrink.minesLength)
	config.set_value("Stats", "greasepuppies", FizzyDrink.greasepuppies)
	
	var clothing = []
	for i in ClothingObjects.clothes.size(): 
		clothing.append(ClothingObjects.clothes[i]["Owned"])
	config.set_value("Stats", "ownedClothes", clothing)
	
	var clothingUn = []
	for i in ClothingObjects.clothes.size(): 
		clothingUn.append(ClothingObjects.clothes[i]["Unlocked"])
	config.set_value("Stats", "unlockedClothes", clothingUn)
	
	var my_fuckin_dialogue_LOL = [
		{"array":FizzyDrink.melDialogue,"notation":"MELANIE"},
		{"array":FizzyDrink.bricksDialogue,"notation":"BRICKS"},
		{"array":FizzyDrink.melvinDialogue,"notation":"MELVIN"},
		{"array":FizzyDrink.marketDialogue,"notation":"MARKET"},
		]
	
	var outputArrayUnlocked = []
	var outputArrayDone = []
	
	for e in my_fuckin_dialogue_LOL.size():
		outputArrayUnlocked = []
		outputArrayDone = []
		for i in my_fuckin_dialogue_LOL[e]["array"].size():
			var notation = my_fuckin_dialogue_LOL[e]["notation"]
			outputArrayUnlocked.append(my_fuckin_dialogue_LOL[e]["array"][i]["unlocked"])
			outputArrayDone.append(my_fuckin_dialogue_LOL[e]["array"][i]["interacted"])
			if i == my_fuckin_dialogue_LOL[e]["array"].size()-1:
				config.set_value("Story", "DialogueUnlocked"+notation, outputArrayUnlocked)
				config.set_value("Story", "DialogueDone"+notation, outputArrayDone)
	
	config.set_value("Shop", "selectedCrystal", FizzyDrink.enabledCrystal)
	config.set_value("Achievements", "All-Time-Clicks", saveFileClicks)
	
	config.save(files[curFile])
	
	Achievements.save()
	#resetables(false)

func resetables():
	var config = ConfigFile.new()
	
	config.load(files[curFile])
	
	config.set_value("Fiscal", "Money", 0)
	config.set_value("Fiscal", "StoredJellies", [])
	config.set_value("Fiscal", "Clothing", 0)
	config.set_value("Fiscal", "AmountOfRooms", 0)
	config.set_value("Stats", "amountOfMines", 1)
	config.set_value("Stats", "greasepuppies", 0)
	config.set_value("Fiscal", "Icon", icon)
	var clothing = []
	for i in ClothingObjects.clothes.size(): 
		if i <= 1:
			ClothingObjects.clothes[i]["Owned"] = true
		else:
			ClothingObjects.clothes[i]["Owned"] = false
	config.set_value("Stats", "ownedClothes", clothing)
	config.set_value("Shop", "autoClickerUpgrade", 0)
	config.set_value("Shop", "PlusOneUpgrade", 0)
	config.set_value("Shop", "PlusOneAUTOUpgrade", 0)
	config.set_value("Shop", "shrilowCry", 0)
	config.set_value("Shop", "jellyCry", 0)
	config.set_value("Shop", "mineCry", 0)
	config.set_value("Shop", "puppyCry", 0)
	config.set_value("Shop", "selectedCrystal", "none")
	config.set_value("Story", "DialogueUnlockedMELANIE", [])
	config.set_value("Story", "DialogueDoneMELANIE", [])
	config.set_value("Story", "DialogueUnlockedMELVIN", [])
	config.set_value("Story", "DialogueDoneMELVIN", [])
	
	config.save(files[curFile])
