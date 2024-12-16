extends Node

var settings = [
	{
	"name":"Kiwami Mode",
	"type":"boolean",
	"desc":"dont search kiwami in the discord gif search",
	"enabled?":false,
	},
	]

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://settings.cfg")
	
	if err == OK:
		var kiwamiState = config.get_value("Settings", "KiwamiMode")
		Settings.settings[0]["enabled?"] = bool(kiwamiState)

func saveData():
	var config = ConfigFile.new()
	
	config.set_value("Settings", "KiwamiMode", Settings.settings[0]["enabled?"])
	config.save("user://settings.cfg")
