extends Node2D

func _ready() -> void:
	Game.warn("Jerry Seinfeld has been summoned! i hate that guy")
	var cacapoopyGOD2 = load(Events.eventList[1]["AttachedScene"])
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	await get_tree().create_timer(1).timeout

func getID(id):
	pass
