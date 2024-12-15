extends Node2D

func _on_button_pressed() -> void:
	$/root/computerShrilow.cameraAnimation("journal", -791, -1221, false)

func _on_button_mouse_entered() -> void:
	$TITLE.visible = true

func _on_button_mouse_exited() -> void:
	$TITLE.visible = false
