extends Node2D

func _on_button_pressed() -> void:
	$/root/computerShrilow.cameraAnimation("gumballMachine", -791, -1984)

func _on_button_mouse_entered() -> void:
	$TITLE.visible = true

func _on_button_mouse_exited() -> void:
	$TITLE.visible = false
