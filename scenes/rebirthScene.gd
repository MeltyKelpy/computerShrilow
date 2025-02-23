extends Node2D

var recievedTokens = 0

func _ready() -> void:
	if FizzyDrink.jellys == null:
		FizzyDrink.jellys = 0
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	if FizzyDrink.clickPower == null:
		FizzyDrink.clickPower = 0
	if FizzyDrink.AUTOclickPower == null:
		FizzyDrink.AUTOclickPower = 0
	recievedTokens = 10 + ((FizzyDrink.jellys / 8) + (FizzyDrink.clicks / 1000) + (FizzyDrink.clickPower / 150) + (FizzyDrink.AUTOclickPower / 150))
	if recievedTokens > 50:
		recievedTokens = 50
	$Label2.text = "You have Recieved "+str(recievedTokens)+" Tokens. Dont go spending it all in one place, now!"

func restart():
	var dir = DirAccess.open(Game.scenePaths[Game.curFile])
	if dir != null:
		for file in dir.get_files():
			print(file)
			DirAccess.remove_absolute(Game.scenePaths[Game.curFile]+"/"+file)
	DirAccess.remove_absolute(Game.scenePaths[Game.curFile])
	print(DirAccess.get_directories_at("user://saveData/nodeSaves"))
	#Game.resetables(true)
	Game.reloadGlobals()
	$Timer.start()

func _on_timer_timeout() -> void:
	Game.resetables()
	Game.saveData()
	var config = ConfigFile.new()
	config.load(Game.files[Game.curFile])
	print(recievedTokens)
	Game.rebirths += 1
	config.set_value("Rebirth", "RebirthTokens", recievedTokens)
	config.set_value("Fiscal", "Rebirths", Game.rebirths)
	config.save(Game.files[Game.curFile])
	if Game.rebirths >= 10 and Achievements.achievements[1]["unlocked?"] == false:
		Game.notify('You unlocked the "10 Lifetimes Past" achievement!\nProve your worth.', "trophy")
		Achievements.achievements[0]["unlocked?"] = true
	if Achievements.achievements[0]["unlocked?"] == false:
		Game.notify('You unlocked the "Rebirth" achievement!\nData Wipe.', "trophy")
		Achievements.achievements[0]["unlocked?"] = true
	Game.saveData()
	Game.loadData()
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")
