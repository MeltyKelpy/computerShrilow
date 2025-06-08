extends Node2D

func _ready() -> void:
	Game.warn("oh. thats 3 jerry seinfelds.")
	for i in range(3):
		var cacapoopyGOD2 = load(Events.eventList[1]["AttachedScene"])
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		await get_tree().create_timer(1).timeout
	queue_free()

func getID(id):
	pass
