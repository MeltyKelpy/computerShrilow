extends Node2D

func _ready() -> void:
	Game.warn("OKAY THATS 12 JERRY SEINFELDS WHAT hELlO?????")
	for i in range(12):
		var cacapoopyGOD2 = load(Events.eventList[1]["AttachedScene"])
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		await get_tree().create_timer(1).timeout
	queue_free()

func getID(id):
	pass
