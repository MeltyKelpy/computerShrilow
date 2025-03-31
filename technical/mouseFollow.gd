extends Node2D

@onready var child = get_children()[0]
var maxDistance = 20

func _process(_delta: float) -> void:
	maxDistance = ClothingObjects.clothes[ClothingObjects.equippedClothing]["maxDistance"]
	var mouse_pos = get_local_mouse_position()
	var dir = Vector2.ZERO.direction_to(mouse_pos)
	var dist = mouse_pos.length()
	child.position = dir * min(dist, maxDistance)
