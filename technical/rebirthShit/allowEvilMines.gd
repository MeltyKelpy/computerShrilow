extends Node2D

var numb : int

func getID(num):
	numb = num

func _ready() -> void:
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	if err == OK:
		
		config.set_value("Rebirth", "EvilMinesAvaliable", true)
		Game.evilMines = true
