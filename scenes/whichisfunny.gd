extends Node2D

func _on_button_pressed() -> void:
	$Button.visible = false
	$AnimationPlayer.play("hi")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/interstate.tscn")
