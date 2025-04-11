extends Node

var fullTime = 0

func saveData():
	var config = ConfigFile.new()
	
	config.set_value("Stats", "Time", fullTime)
	
	config.save("user://interstate.cfg")

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://interstate.cfg")
	
	if err == OK:
		fullTime = config.get_value("Stats", "Time")

func _on_timer_timeout() -> void:
	fullTime += 1

func _on_auto_save_timer_timeout() -> void:
	saveData()
