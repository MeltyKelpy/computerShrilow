extends Node2D

func _process(delta: float) -> void:
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5

func endMenu():
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")

func _on_start_pressed() -> void:
	$loadingScreen/loading.play("loading")
