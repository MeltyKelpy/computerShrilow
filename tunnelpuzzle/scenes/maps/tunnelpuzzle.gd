extends Node3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()
