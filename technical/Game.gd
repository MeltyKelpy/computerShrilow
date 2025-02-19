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
var rebirths = 0
var gameTime = 0.0

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
	
	s = get_script()
	set_script(null)
	set_script(s)

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load(files[curFile])
	
	if err == OK:
		namee = config.get_value("Fiscal", "Name")
		jellies = config.get_value("Fiscal", "Jellies")
		Jelly.storedJellys = config.get_value("Fiscal", "StoredJellies")
		rebirths = config.get_value("Fiscal", "Rebirths")
		gameTime = config.get_value("Fiscal", "Time")
		FizzyDrink.clicks = config.get_value("Fiscal", "Clicks")
		ItemValues.money = config.get_value("Fiscal", "Money")
		ClothingObjects.equippedClothing = config.get_value("Fiscal", "Clothing")
		FizzyDrink.jellys = config.get_value("Fiscal", "AmountOfJellies")
		
		ItemValues.itemInfomation[0]["CurUpgrade"] = config.get_value("Shop", "autoClickerUpgrade")
		ItemValues.itemInfomation[1]["CurUpgrade"] = config.get_value("Shop", "PlusOneUpgrade")
		ItemValues.itemInfomation[2]["CurUpgrade"] = config.get_value("Shop", "PlusOneAUTOUpgrade")
		ItemValues.itemInfomation[9]["CurUpgrade"] = config.get_value("Shop", "shrilowCry")
		ItemValues.itemInfomation[10]["CurUpgrade"] = config.get_value("Shop", "jellyCry")
		ItemValues.itemInfomation[11]["CurUpgrade"] = config.get_value("Shop", "mineCry")
		FizzyDrink.enabledCrystal = config.get_value("Shop", "selectedCrystal")
		
		ItemValues.marketItems[0]["CurUpgrade"] = config.get_value("Rebirth", "RebirthAutoClickerLevel")
		ItemValues.marketItems[1]["CurUpgrade"] = config.get_value("Rebirth", "PresistantPlusOne")
		ItemValues.marketItems[2]["CurUpgrade"] = config.get_value("Rebirth", "PlusOneMC")
		ItemValues.marketItems[3]["Owned"] = config.get_value("Rebirth", "EvilMinesAvaliable")
		evilMines = config.get_value("Rebirth", "EvilMinesAvaliable")
		ItemValues.marketItems[4]["CurUpgrade"] = config.get_value("Rebirth", "AntagJelly")
		ItemValues.marketItems[5]["CurUpgrade"] = config.get_value("Rebirth", "PhantomJelly")
		
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
			Jelly.commonJellies[i]["Discovered"] = commons[i]
		for i in Jelly.uncommonJellies.size():
			Jelly.uncommonJellies[i]["Discovered"] = uncommons[i]
		for i in Jelly.rareJellies.size():
			Jelly.rareJellies[i]["Discovered"] = rares[i]
		for i in Jelly.awesomeJellies.size():
			Jelly.awesomeJellies[i]["Discovered"] = awesomes[i]
		for i in Jelly.queerJellies.size():
			Jelly.queerJellies[i]["Discovered"] = queers[i]
		for i in Jelly.blueJellies.size():
			Jelly.blueJellies[i]["Discovered"] = blues[i]
		
		var awesome = config.get_value("Stats", "ownedClothes")
		for i in ClothingObjects.clothes.size():
			if awesome.size() < ClothingObjects.clothes.size():
				awesome.resize(ClothingObjects.clothes.size())
			ClothingObjects.clothes[i]["Owned"] = awesome[i]
		
		rebirthTokens = config.get_value("Rebirth", "RebirthTokens")

func saveData():
	
	DirAccess.make_dir_absolute("user://saveData")
	DirAccess.make_dir_absolute("user://saveData/nodeSaves")
	
	var config = ConfigFile.new()
	
	config.load(files[curFile])
	
	# NON RESETING // REBIRTH STUFF
	# including shows up on file menu and is considered "main" data (FISCAL)
	
	config.set_value("Fiscal", "Name", namee)
	config.set_value("Fiscal", "Jellies", jellies)
	config.set_value("Fiscal", "Rebirths", rebirths)
	config.set_value("Fiscal", "Time", gameTime)
	config.set_value("Fiscal", "Clicks", FizzyDrink.clicks)
	
	config.set_value("Rebirth", "RebirthTokens", rebirthTokens)
	config.set_value("Rebirth", "RebirthAutoClickerLevel", ItemValues.marketItems[0]["CurUpgrade"])
	config.set_value("Rebirth", "PresistantPlusOne", ItemValues.marketItems[1]["CurUpgrade"])
	config.set_value("Rebirth", "PlusOneMC", ItemValues.marketItems[2]["CurUpgrade"])
	config.set_value("Rebirth", "EvilMinesAvaliable", ItemValues.marketItems[3]["Owned"])
	config.set_value("Rebirth", "AntagJelly", ItemValues.marketItems[4]["CurUpgrade"])
	config.set_value("Rebirth", "PhantomJelly", ItemValues.marketItems[5]["CurUpgrade"])
	config.set_value("Story", "DialogueUnlockedMARKET", gameTime)
	config.set_value("Story", "DialogueDoneMARKET", gameTime)
	config.set_value("Story", "RebirthIntroPlayed", RebirthIntroPlayed)
	config.set_value("Story", "DialogueUnlockedPBJ", gameTime)
	
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
	
	config.set_value("Fiscal", "AmountOfJellies", FizzyDrink.jellys)
	config.set_value("Fiscal", "Money", ItemValues.money)
	config.set_value("Fiscal", "StoredJellies", Jelly.storedJellys)
	config.set_value("Fiscal", "Clothing", ClothingObjects.equippedClothing)
	config.set_value("Stats", "amountOfMines", FizzyDrink.minesLength)
	config.set_value("Stats", "greasepuppies", FizzyDrink.greasepuppies)
	var clothing = []
	for i in ClothingObjects.clothes.size(): 
		clothing.append(ClothingObjects.clothes[i]["Owned"])
	config.set_value("Stats", "ownedClothes", clothing)
	config.set_value("Shop", "autoClickerUpgrade", ItemValues.itemInfomation[0]["CurUpgrade"])
	config.set_value("Shop", "PlusOneUpgrade", ItemValues.itemInfomation[1]["CurUpgrade"])
	config.set_value("Shop", "PlusOneAUTOUpgrade", ItemValues.itemInfomation[2]["CurUpgrade"])
	config.set_value("Story", "DialogueUnlockedMELANIE", gameTime)
	config.set_value("Story", "DialogueDoneMELANIE", gameTime)
	config.set_value("Story", "DialogueUnlockedMELVIN", gameTime)
	config.set_value("Story", "DialogueDoneMELVIN", gameTime)
	config.set_value("Shop", "shrilowCry", ItemValues.itemInfomation[9]["CurUpgrade"])
	config.set_value("Shop", "jellyCry", ItemValues.itemInfomation[10]["CurUpgrade"])
	config.set_value("Shop", "mineCry", ItemValues.itemInfomation[11]["CurUpgrade"])
	config.set_value("Shop", "selectedCrystal", FizzyDrink.enabledCrystal)
	
	config.save(files[curFile])
	
	#resetables(false)

func resetables():
	var config = ConfigFile.new()
	
	config.load(files[curFile])
	
	config.set_value("Fiscal", "AmountOfJellies", 0)
	config.set_value("Fiscal", "Money", 0)
	config.set_value("Fiscal", "StoredJellies", [])
	config.set_value("Fiscal", "Clothing", 0)
	config.set_value("Stats", "amountOfMines", 1)
	config.set_value("Stats", "greasepuppies", 0)
	var clothing = []
	for i in ClothingObjects.clothes.size(): 
		clothing.append(ClothingObjects.clothes[i]["Owned"])
	config.set_value("Stats", "ownedClothes", clothing)
	config.set_value("Shop", "autoClickerUpgrade", 0)
	config.set_value("Shop", "PlusOneUpgrade", 0)
	config.set_value("Shop", "PlusOneAUTOUpgrade", 0)
	config.set_value("Shop", "shrilowCry", 0)
	config.set_value("Shop", "jellyCry", 0)
	config.set_value("Shop", "mineCry", 0)
	config.set_value("Shop", "selectedCrystal", "none")
	config.set_value("Story", "DialogueUnlockedMELANIE", [])
	config.set_value("Story", "DialogueDoneMELANIE", [])
	config.set_value("Story", "DialogueUnlockedMELVIN", [])
	config.set_value("Story", "DialogueDoneMELVIN", [])
	
	config.save(files[curFile])
