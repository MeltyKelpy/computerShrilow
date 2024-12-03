extends Node2D

var rng = RandomNumberGenerator.new()
var check = 0
var gamePlayed = false

func getID(num) -> void:
	ItemValues.itemInfomation[num]["Owned"] = false
	loadMinigame()

func loadMinigame():
	for i in range(0, Events.justMinigames.size()):
		if Events.justMinigames[i]["Played?"] == false:
			if gamePlayed == false:
				var cacapoopyGOD2 = load(Events.justMinigames[i]["AttachedScene"])
				var caca = cacapoopyGOD2.instantiate()
				add_child(caca)
				var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
				var caca2 = cacapoopyGOD3.instantiate()
				add_child(caca2)
				caca2.warn(Events.justMinigames[i]["WarningMessage"])
				Events.justMinigames[i]["Played?"] = true
				get_tree().paused = true
				$/root/computerShrilow.returnPosCamX = $/root/computerShrilow/Camera2D.position.x
				$/root/computerShrilow.returnPosCamY = $/root/computerShrilow/Camera2D.position.y
				$/root/computerShrilow/Camera2D.position.x = 576
				$/root/computerShrilow/Camera2D.position.y = 324
				caca.reparent($/root)
				caca.position.x = 0
				caca.position.y = 0
				caca2.position.x = 0
				caca2.position.y = 0
				queue_free()
			gamePlayed = true
		else:
			check += 1
			if check == Events.justMinigames.size()-1:
				queue_free()
