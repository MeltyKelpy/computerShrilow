extends Node2D

var puzzled = false

func _on_button_pressed() -> void:
	if puzzled == false:
		puzzled = true
		var tunnelpuzzle = load("res://tunnelpuzzle/scenes/tunnelpuzzle.tscn").instantiate()
		$/root.add_child(tunnelpuzzle)
