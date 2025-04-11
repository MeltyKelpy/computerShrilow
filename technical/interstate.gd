extends Node

var fullTime = 0
var saayoModeUnlocked = false
var baldiModeUnlocked = false

func _ready() -> void:
	var config = ConfigFile.new()
	
	var err = config.load("user://interstate.cfg")
	
	if err != OK:
		saveData()

func saveData():
	var config = ConfigFile.new()
	
	config.load("user://interstate.cfg")
	
	config.set_value("Stats", "Time", fullTime)
	config.set_value("Game", "saayoModeUnlocked", saayoModeUnlocked)
	config.set_value("Game", "baldiModeUnlocked", baldiModeUnlocked)
	
	config.save("user://interstate.cfg")

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://interstate.cfg")
	
	if err == OK:
		fullTime = config.get_value("Stats", "Time")
		saayoModeUnlocked = config.get_value("Game", "saayoModeUnlocked")
		baldiModeUnlocked = config.get_value("Game", "baldiModeUnlocked")

func _on_timer_timeout() -> void:
	fullTime += 1

func _on_auto_save_timer_timeout() -> void:
	saveData()
