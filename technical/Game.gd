extends Node

var files = [
	"user://saveData/file1.cfg",
	"user://saveData/file2.cfg",
	"user://saveData/file3.cfg",
	]

var namee = "SAVE FILE"
var jellies = 0
var rebirths = 0
var gameTime = 0.0

var curFile = 0

var evilMines = false
var MarketJelliesAvaliable = false
var rebirthAutoClicker = false
var RebirthAutoClickerLevel = 3
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
	
	s = get_script()
	set_script(null)
	set_script(s)

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load(files[curFile])
	
	if err == OK:
		var namee = config.get_value("Fiscal", "Name")
		var jellies = config.get_value("Fiscal", "Jellies")
		var rebirths = config.get_value("Fiscal", "Rebirths")
		var time = config.get_value("Fiscal", "Time")
		ItemValues.money = config.get_value("Fiscal", "Money")
		
		var commons = config.get_value("Stats", "commonJellies")
		var uncommons = config.get_value("Stats", "commonJellies")
		var rares = config.get_value("Stats", "commonJellies")
		var awesomes = config.get_value("Stats", "commonJellies")
		var queers = config.get_value("Stats", "commonJellies")
		var blues = config.get_value("Stats", "commonJellies")
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

func saveData():
	var config = ConfigFile.new()
	
	config.load(files[curFile])
	
	# FISCAL
	# shows up on file menu and is considered "main" data
	
	config.set_value("Fiscal", "Name", namee)
	config.set_value("Fiscal", "Money", ItemValues.money)
	config.set_value("Fiscal", "Jellies", jellies)
	config.set_value("Fiscal", "Rebirths", rebirths)
	config.set_value("Fiscal", "Time", gameTime)
	
	# STATS
	
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
		commons.append(Jelly.uncommonJellies[i]["Discovered"])
	for i in Jelly.rareJellies.size():
		commons.append(Jelly.rareJellies[i]["Discovered"])
	for i in Jelly.awesomeJellies.size():
		commons.append(Jelly.awesomeJellies[i]["Discovered"])
	for i in Jelly.queerJellies.size():
		commons.append(Jelly.queerJellies[i]["Discovered"])
	for i in Jelly.blueJellies.size():
		commons.append(Jelly.blueJellies[i]["Discovered"])
	config.set_value("Stats", "commonJellies", commons)
	config.set_value("Stats", "uncommonJellies", uncommons)
	config.set_value("Stats", "rareJellies", rares)
	config.set_value("Stats", "awesomeJellies", awesomes)
	config.set_value("Stats", "queerJellies", queers)
	config.set_value("Stats", "blackMarketJellies", markets)
	config.set_value("Stats", "blueJellies", blues)
	
	# STORY
	
	config.set_value("Story", "DialogueUnlockedMELANIE", gameTime)
	config.set_value("Story", "DialogueUnlockedMELVIN", gameTime)
	config.set_value("Story", "DialogueUnlockedMARKET", gameTime)
	config.set_value("Story", "RebirthIntroPlayed", RebirthIntroPlayed)
	config.set_value("Story", "DialogueUnlockedPBJ", gameTime)
	
	# REBIRTH
	
	config.set_value("Rebirth", "RebirthTokens", rebirthTokens)
	
	config.set_value("Rebirth", "EvilMinesAvaliable", evilMines)
	
	config.set_value("Rebirth", "MarketJelliesAvaliable", MarketJelliesAvaliable)
	
	config.set_value("Rebirth", "RebirthAutoClicker", rebirthAutoClicker)
	config.set_value("Rebirth", "RebirthAutoClickerLevel", RebirthAutoClickerLevel)
	
	config.save(files[curFile])
