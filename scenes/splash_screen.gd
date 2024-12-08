extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("opening")
	$AudioStreamPlayer.play()

func _end():
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")
