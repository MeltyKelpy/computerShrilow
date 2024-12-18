extends Sprite2D

var ID = 0

func _ready() -> void:
	
	Game.reloadGlobals()
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[ID])
	
	if err == OK:
		$Icon.visible = true
		$FileName.text = config.get_value("Fiscal", "Name")
		$Desc.text = "Money: "+str(config.get_value("Fiscal", "Money"))+"\nJellies Found: "+str(config.get_value("Fiscal", "Jellies"))+"\nRebirths: "+str(config.get_value("Fiscal", "Rebirths"))+"\nHours Played: "+str(round_to_dec(((config.get_value("Fiscal", "Time") / 60 ) / 60), 1))
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
	
	hi2._on_button_pressed()
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
	
	Game.saveData()

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
