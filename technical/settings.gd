extends Node

var settings = [
	#{
	#"name":"General",
	#"id":"general",
	#"type":"category",
	#"desc":"General Settings",
	#},
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
	]

func setting_state(id):
	var output
	var desired_output
	
	for i in settings.size():
		if settings[i]["id"] == id:
			output = i
			break
	
	if settings[output]["type"] == "boolean":
		desired_output = settings[output]["enabled?"]
	
	if settings[output]["type"] == "multiChoice":
		desired_output = settings[output]["selectionNum"]
	
	return desired_output

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
		
		Settings.settings[get_setting("kiwami")]["enabled?"] = kiwamiState
		Settings.settings[get_setting("minesOptimization")]["enabled?"] = minesOptimization
		Settings.settings[get_setting("jelliesOptimization")]["enabled?"] = jelliesOptimization
		Settings.settings[get_setting("animationsOptimization")]["enabled?"] = animationOptimization
		
		if SeperatorType != null:
			Settings.settings[get_setting("seperator")]["selection"] = SeperatorType[0]
			Settings.settings[get_setting("seperator")]["selectionNum"] = SeperatorType[1]
		else:
			Settings.settings[get_setting("seperator")]["selection"] = ","
			Settings.settings[get_setting("seperator")]["selectionNum"] = 0
		
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
	config.set_value("Settings", "Colorblind", [Settings.settings[get_setting("colorblindness")]["selection"],Settings.settings[get_setting("colorblindness")]["selectionNum"]])
	config.set_value("Settings", "MinesOptimization", Settings.settings[get_setting("minesOptimization")]["enabled?"])
	config.set_value("Settings", "JelliesOptimization", Settings.settings[get_setting("jelliesOptimization")]["enabled?"])
	config.set_value("Settings", "AnimationsOptimization", Settings.settings[get_setting("animationsOptimization")]["enabled?"])
	config.save("user://settings.cfg")
