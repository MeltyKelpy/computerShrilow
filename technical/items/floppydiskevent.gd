extends Node2D

var rng = RandomNumberGenerator.new()

func getID(num) -> void:
	ItemValues.itemInfomation[num]["Owned"] = false
	self.reparent($/root)
	loadMinigame()

func loadMinigame():
	if get_tree() != null:
		var num = rng.randi_range(0, Events.justMinigames.size()-1)
		var cacapoopyGOD2 = load(Events.justMinigames[num]["AttachedScene"])
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
		var caca2 = cacapoopyGOD3.instantiate()
		add_child(caca2)
		caca2.warn(Events.justMinigames[num]["WarningMessage"])
		Events.justMinigames[num]["Played?"] = true
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
