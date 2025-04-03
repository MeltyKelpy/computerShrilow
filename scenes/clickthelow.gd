extends Node2D

func _on_button_pressed() -> void:
	$Sprite2D.texture = load("res://assets/images/computershrilows/New_Drawing1.png")
	$Label.text = "look what you've done."
