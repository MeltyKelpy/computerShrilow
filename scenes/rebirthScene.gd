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
	DirAccess.remove_absolute(Game.scenePaths[Game.curFile])
	print(DirAccess.get_directories_at("user://saveData/nodeSaves"))
	DirAccess.remove_absolute(Game.files[Game.curFile])
	#Game.resetables(true)
	Game.reloadGlobals()
	$Timer.start()

func _on_timer_timeout() -> void:
	Game.resetables()
	Game.saveData()
	var config = ConfigFile.new()
	
	config.load(Game.files[Game.curFile])
	config.set_value("Rebirth", "RebirthTokens", recievedTokens)
	config.set_value("Fiscal", "Rebirths", Game.rebirths + 1)
	config.save(Game.files[Game.curFile])
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")
