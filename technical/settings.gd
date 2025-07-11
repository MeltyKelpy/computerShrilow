extends Node

var settings = [
	{
	"name":"General",
	"id":"general",
	"type":"category",
	"desc":"General Settings",
	},
	{
	"name":"Master Volume",
	"id":"masterVolume",
	"type":"bar",
	"desc":"Control Master Volume.",
	"value":1,
	"max":8,
	"min":0,
	},
	{
	"name":"Music Volume",
	"id":"musicVolume",
	"type":"bar",
	"desc":"Control Music Volume.",
	"value":8,
	"max":8,
	"min":0,
	},
	{
	"name":"SFX Volume",
	"id":"sfxVolume",
	"type":"bar",
	"desc":"Control SFX Volume.",
	"value":8,
	"max":8,
	"min":0,
	},
	{
	"name":"Talk Sound Volume",
	"id":"tsVolume",
	"type":"bar",
	"desc":"Control Talk Sound Volume.",
	"value":8,
	"max":8,
	"min":0,
	},
	{
	"name":"Text Hint Color",
	"id":"texthint",
	"type":"multiChoice",
	"desc":"select hint text color (default is yellow)",
	"selection":0,
	"choices":{"Yellow":"yellow", "Red":"red", "Green":"green", "Blue":"blue", "Hints Disabled":"none"},
	"selectionNum":0,
	},
	{
	"name":"Menu Transitions",
	"id":"menuTrans",
	"type":"boolean",
	"desc":"Uses menu transitions when going between places",
	"enabled?":true,
	},
	{
	"name":"File Timer",
	"id":"fileTimer",
	"type":"boolean",
	"desc":"Displays file timer",
	"enabled?":false,
	},
	{
	"name":"Accessibility",
	"id":"accessibility",
	"type":"category",
	"desc":"Accessibility Settings",
	},
	{
	"name":"Seperator Type",
	"id":"seperator",
	"type":"multiChoice",
	"desc":"choose how number seperation is displayed in game.",
	"selection":",",
	"choices":{",":",", "Spaces":" ", "Periods":"."},
	"selectionNum":0,
	},
	{
	"name":"Colorblind Mode",
	"id":"colorblindness",
	"type":"multiChoice",
	"desc":"choose colorblind mode\n\nProtanopia - Red-Green (less red)\nDeuteranopia - Green-Red (less green)\nTritanopia - Blue-Yellow (less blue)\nLiteral - Whats a color?",
	"selection":0,
	"choices":{"Default":0, "Protanopia":0, "Deuteranopia":1, "Tritanopia":2, "Literal":3},
	"selectionNum":0,
	},
	{
	"name":"Performance",
	"id":"performance",
	"type":"category",
	"desc":"Performance Settings",
	},
	{
	"name":"Optimize Mines",
	"id":"minesOptimization",
	"type":"boolean",
	"desc":"Optimizes the Mines. Instead of the miners indivdually making money, it'll be calculated on their money per second and have that given to you instead.",
	"enabled?":false,
	},
	{
	"name":"Optimize Jellies",
	"id":"jelliesOptimization",
	"type":"boolean",
	"desc":"Optimizes the Jellies. removes their jelly 2 jelly collision.",
	"enabled?":false,
	},
	{
	"name":"Animations",
	"id":"animationsOptimization",
	"type":"boolean",
	"desc":"Toggle if the Money-Makers (Jellies, Mines, Greasepuppies) should have animations. It may help to disable this if you find the game to be lagging.",
	"enabled?":true,
	},
	{
	"name":"uhm. Stuff?",
	"id":"secretsettings",
	"type":"category",
	"desc":"Uhhhhhhh",
	},
	{
	"name":"Kiwami Mode",
	"id":"kiwami",
	"type":"boolean",
	"desc":"dont search kiwami in the discord gif search",
	"enabled?":false,
	},
	{
	"name":"Saayo Mode",
	"id":"saayo",
	"type":"boolean",
	"desc":"ur welcome",
	"enabled?":false,
	},
	{
	"name":"4baldi Mode",
	"id":"4baldi",
	"type":"boolean",
	"desc":"spellsspells is fat",
	"enabled?":false,
	},
	]

func setting_state(id):
	var output = get_setting(id)
	var desired_output
	
	if output != null:
		if settings[output]["type"] == "boolean":
			desired_output = settings[output]["enabled?"]
		
		if settings[output]["type"] == "multiChoice":
			desired_output = settings[output]["selectionNum"]
		
		return desired_output
	else:
		return false

func get_setting(id):
	var output
	
	for i in settings.size():
		if settings[i]["id"] == id:
			output = i
			break
	
	if output != null:
		return output

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://settings.cfg")
	
	if err == OK:
		var kiwamiState = config.get_value("Settings", "KiwamiMode")
		var SeperatorType = config.get_value("Settings", "SeperatorType")
		var ColorblindMode = config.get_value("Settings", "Colorblind")
		var minesOptimization = config.get_value("Settings", "MinesOptimization", false)
		var jelliesOptimization = config.get_value("Settings", "JelliesOptimization", false)
		var animationOptimization = config.get_value("Settings", "AnimationsOptimization", true)
		var menuTrans = config.get_value("Settings", "menuTrans", true)
		var fileTimer = config.get_value("Settings", "fileTimer", false)
		var saayoMode = config.get_value("Settings", "saayoMode", false)
		var baldiMode = config.get_value("Settings", "baldiMode", false)
		var masterVolume = config.get_value("Settings", "masterVolume", 1)
		var musicVolume = config.get_value("Settings", "musicVolume", 1)
		var sfxVolume = config.get_value("Settings", "sfxVolume", 1)
		var tsVolume = config.get_value("Settings", "tsVolume", 1)
		var texthint = config.get_value("Settings", "texthint")
		
		Settings.settings[get_setting("kiwami")]["enabled?"] = kiwamiState
		Settings.settings[get_setting("minesOptimization")]["enabled?"] = minesOptimization
		Settings.settings[get_setting("jelliesOptimization")]["enabled?"] = jelliesOptimization
		Settings.settings[get_setting("animationsOptimization")]["enabled?"] = animationOptimization
		Settings.settings[get_setting("menuTrans")]["enabled?"] = menuTrans
		Settings.settings[get_setting("fileTimer")]["enabled?"] = fileTimer
		SoundBar.volume = masterVolume
		var sfx_index = AudioServer.get_bus_index("SFX")
		AudioServer.set_bus_volume_db(sfx_index, ((sfxVolume-4)*5)-10)
		var ts_index = AudioServer.get_bus_index("TalkSounds")
		AudioServer.set_bus_volume_db(ts_index, ((tsVolume-4)*5)-10)
		var mus_index = AudioServer.get_bus_index("TalkSounds")
		AudioServer.set_bus_volume_db(mus_index, ((musicVolume-4)*5)-10)
		Settings.settings[get_setting("fileTimer")]["enabled?"] = fileTimer
		Settings.settings[get_setting("saayo")]["enabled?"] = saayoMode
		Settings.settings[get_setting("4baldi")]["enabled?"] = baldiMode
		
		if SeperatorType != null:
			Settings.settings[get_setting("seperator")]["selection"] = SeperatorType[0]
			Settings.settings[get_setting("seperator")]["selectionNum"] = SeperatorType[1]
		else:
			Settings.settings[get_setting("seperator")]["selection"] = ","
			Settings.settings[get_setting("seperator")]["selectionNum"] = 0
		
		if texthint != null:
			Settings.settings[get_setting("texthint")]["selection"] = texthint[0]
			Settings.settings[get_setting("texthint")]["selectionNum"] = texthint[1]
		else:
			Settings.settings[get_setting("texthint")]["selection"] = "yellow"
			Settings.settings[get_setting("texthint")]["selectionNum"] = 0
		
		if ColorblindMode != null:
			Settings.settings[get_setting("colorblindness")]["selection"] = ColorblindMode[0]
			Settings.settings[get_setting("colorblindness")]["selectionNum"] = ColorblindMode[1]
		else:
			Settings.settings[get_setting("colorblindness")]["selection"] = 0
			Settings.settings[get_setting("colorblindness")]["selectionNum"] = 0
		
func saveData():
	var config = ConfigFile.new()
	
	config.set_value("Settings", "KiwamiMode", Settings.settings[get_setting("kiwami")]["enabled?"])
	config.set_value("Settings", "SeperatorType", [Settings.settings[get_setting("seperator")]["selection"],Settings.settings[get_setting("seperator")]["selectionNum"]])
	config.set_value("Settings", "texthint", [Settings.settings[get_setting("texthint")]["selection"],Settings.settings[get_setting("texthint")]["selectionNum"]])
	config.set_value("Settings", "Colorblind", [Settings.settings[get_setting("colorblindness")]["selection"],Settings.settings[get_setting("colorblindness")]["selectionNum"]])
	config.set_value("Settings", "MinesOptimization", Settings.settings[get_setting("minesOptimization")]["enabled?"])
	config.set_value("Settings", "JelliesOptimization", Settings.settings[get_setting("jelliesOptimization")]["enabled?"])
	config.set_value("Settings", "AnimationsOptimization", Settings.settings[get_setting("animationsOptimization")]["enabled?"])
	config.set_value("Settings", "menuTrans", Settings.settings[get_setting("menuTrans")]["enabled?"])
	config.set_value("Settings", "fileTimer", Settings.settings[get_setting("fileTimer")]["enabled?"])
	config.set_value("Settings", "saayoMode", Settings.settings[get_setting("saayo")]["enabled?"])
	config.set_value("Settings", "baldiMode", Settings.settings[get_setting("4baldi")]["enabled?"])
	config.set_value("Settings", "masterVolume", Settings.settings[get_setting("masterVolume")]["value"])
	config.set_value("Settings", "musicVolume", Settings.settings[get_setting("musicVolume")]["value"])
	config.set_value("Settings", "sfxVolume", Settings.settings[get_setting("sfxVolume")]["value"])
	config.set_value("Settings", "tsVolume", Settings.settings[get_setting("tsVolume")]["value"])
	config.save("user://settings.cfg")
