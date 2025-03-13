extends Sprite2D

var ID = 0
var time_dict = {"H" : 0, "M" : 0, "S" : 0}
var icon = 0

func _ready() -> void:
	Game.reloadGlobals()
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[ID])
	
	if err == OK:
		var time = int(round(config.get_value("Fiscal", "Time")))
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
		$Desc.text = "Money: "+str(Game.commizeNumber(round(config.get_value("Fiscal", "Money"))))+"\nJellies Found: "+str(config.get_value("Fiscal", "Jellies"))+"\nRebirths: "+str(config.get_value("Fiscal", "Rebirths"))+"\nRebirth Tokens: "+str(config.get_value("Rebirth", "RebirthTokens"))+"\nTime Played: "+final+"\nClicks: "+str(config.get_value("Fiscal", "Clicks"))
		icon = config.get_value("Fiscal", "Icon")
	else:
		$Icon.visible = false
		$FileName.text = "FILE "+str(ID+1)
		$Desc.text = ""
		Game.curFile = ID
		icon = 0
	
	for i in config.get_value("Rebirth", "Curses", []).size():
		var fuckyou = [
			$curse1,
			$curse2,
			$curse3,
			$curse4,
			$curse5,
			]
		if config.get_value("Rebirth", "Curses", [])[i]["Icon"] != null and config.get_value("Rebirth", "Curses", [])[i]["Icon"] != "":
			fuckyou[i].texture = load(config.get_value("Rebirth", "Curses", [])[i]["Icon"])
			fuckyou[i].visible = true
		else:
			fuckyou[i].visible = false
	
	print("File "+str(ID+1)+" Loaded, Name: "+$FileName.text)

func _process(delta: float) -> void:
	if icon != null:
		$Icon.texture = load("res://assets/images/ui/saveIcons/"+str(icon)+".png")
	else:
		icon = 0
		$Icon.texture = load("res://assets/images/ui/saveIcons/0.png")

func _on_load_pressed() -> void:
	Game.curFile = ID
	var hi1 = get_parent()
	var hi2 = hi1.get_parent()
	
	hi2._on_button_pressed("game")
	Game.loadData()
	var config = ConfigFile.new()
	var err = config.load(Game.files[ID])
	if $FileName.text == "":
		config.set_value("Fiscal", "Name", "UNNAMED FILE")
		Game.saveData()
	else:
		Game.namee = $FileName.text
		config.set_value("Fiscal", "Name", $FileName.text)
		Game.saveData()
	print("Opening File "+str(ID+1)+", Name: "+config.get_value("Fiscal", "Name"))

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
		config.set_value("Fiscal", "Name", "UNNAMED FILE")
	else:
		Game.loadData()
		Game.namee = $FileName.text
		config.set_value("Fiscal", "Name", $FileName.text)
		Game.saveData()

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func changeIcon(changeBy: int) -> void:
	if icon == null:
		icon = 0
	icon += changeBy
	if FileAccess.file_exists("res://assets/images/ui/saveIcons/"+str(icon)+".png"):
		pass
	else:
		icon = 0
	
	var config = ConfigFile.new()
	
	Game.curFile = ID
	
	Game.loadData()
	Game.icon = icon
	config.set_value("Fiscal", "Icon", icon)
	Game.saveData()
