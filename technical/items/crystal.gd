extends Node2D

func getID(num):
	pass

func _ready() -> void:
	reparent($/root/computerShrilow/Jelly)
	position.x = 255
	position.y = 486

func _process(delta: float) -> void:
	if FizzyDrink.enabledCrystal == "jelly":
		$crystal.texture = load("res://assets/images/areas/jellies/crystalON.png")
	else:
		$crystal.texture = load("res://assets/images/areas/jellies/crystalOFF.png")

func _on_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "jelly"

func _on_button_mouse_entered() -> void:
	$TITLE.visible = true

func _on_button_mouse_exited() -> void:
	$TITLE.visible = false
