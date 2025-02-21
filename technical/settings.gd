extends Node

var settings = [
	{
	"name":"Kiwami Mode",
	"type":"boolean",
	"desc":"dont search kiwami in the discord gif search",
	"enabled?":false,
	},
	{
	"name":"Seperator Type",
	"type":"multiChoice",
	"desc":"choose how number seperation is displayed in game.",
	"selection":",",
	"choices":{",":",", "spaces":" "},
	"selectionNum":0,
	},
	]

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://settings.cfg")
	
	if err == OK:
		var kiwamiState = config.get_value("Settings", "KiwamiMode")
		var SeperatorType = config.get_value("Settings", "SeperatorType")
		Settings.settings[0]["enabled?"] = bool(kiwamiState)
		Settings.settings[1]["selection"] = str(SeperatorType)

func saveData():
	var config = ConfigFile.new()
	
	config.set_value("Settings", "KiwamiMode", Settings.settings[0]["enabled?"])
	config.set_value("Settings", "SeperatorType", Settings.settings[1]["selection"])
	config.save("user://settings.cfg")
