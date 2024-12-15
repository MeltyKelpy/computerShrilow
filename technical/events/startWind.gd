extends Node2D

func _ready() -> void:
	var cacapoopyGOD2 = preload("res://technical/events/popupWindow.tscn")
	var caca1 = cacapoopyGOD2.instantiate()
	var caca2 = cacapoopyGOD2.instantiate()
	var caca3 = cacapoopyGOD2.instantiate()
	var caca4 = cacapoopyGOD2.instantiate()
	var caca5 = cacapoopyGOD2.instantiate()
	add_child(caca1)
	add_child(caca2)
	add_child(caca3)
	add_child(caca4)
	add_child(caca5)
	queue_free()
