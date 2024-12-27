extends Sprite2D

var ID = 0
var hours = 0
var minutes = 0
var seconds = 0
var time_dict = {"H" : 0, "M" : 0, "S" : 0}

func _ready() -> void:
	Game.reloadGlobals()
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[ID])
	
	if err == OK:
		var time = config.get_value("Fiscal", "Time")
		while time >= 60:
			time -= 60
			time_dict["M"] += 1
		time_dict["S"] = time
		while time_dict["M"] >= 60:
			time_dict["M"] -= 60
			time_dict["H"] += 1
		var finH
		if time_dict["H"] < 10:
			finH = "0"+str(time_dict["H"])
		else:
			finH = time_dict["H"]
		var finM
		if time_dict["M"] < 10:
			finM = "0"+str(time_dict["M"])
		else:
			finM = time_dict["M"]
		var finS
		if time_dict["S"] < 10:
			finS = "0"+str(time_dict["S"])
		else:
			finS = time_dict["S"]
		var final = str(finH) + ":" + str(finM) + ":" + str(finS)
		$Icon.visible = true
		$FileName.text = config.get_value("Fiscal", "Name")
		$Desc.text = "Money: "+str(config.get_value("Fiscal", "Money"))+"\nJellies Found: "+str(config.get_value("Fiscal", "Jellies"))+"\nRebirths: "+str(config.get_value("Fiscal", "Rebirths"))+"\nRebirth Tokens: "+str(config.get_value("Rebirth", "RebirthTokens"))+"\nTime Played: "+final+"\nClicks: "+str(config.get_value("Fiscal", "Clicks"))
	else:
		$Icon.visible = false
		$FileName.text = "FILE "+str(ID+1)
		$Desc.text = ""
		Game.curFile = ID
	
	print("File "+str(ID+1)+" Loaded, Name: "+$FileName.text)

func _on_load_pressed() -> void:
	Game.curFile = ID
	var hi1 = get_parent()
	var hi2 = hi1.get_parent()
	
	hi2._on_button_pressed("game")
	Game.loadData()

func _on_delete_pressed() -> void:
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[ID])
	
	if err == OK:
		print(ID)
		print(Game.scenePaths[ID])
		var dir = DirAccess.open(Game.scenePaths[ID])
		if dir != null:
			for file in dir.get_files():
				print(file)
				DirAccess.remove_absolute(Game.scenePaths[ID]+"/"+file)
	DirAccess.remove_absolute(Game.scenePaths[ID])
	print(DirAccess.get_directories_at("user://saveData/nodeSaves"))
		
	DirAccess.remove_absolute(Game.files[ID])
	_ready()

func _on_file_name_text_changed(new_text: String) -> void:
	var config = ConfigFile.new()
	
	Game.curFile = ID
	
	var err = config.load(Game.files[ID])
	
	if $FileName.text == "":
		Game.namee = "Unnamed File"
	else:
		Game.namee = $FileName.text

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
