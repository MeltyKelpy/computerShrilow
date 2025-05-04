extends Node2D

func getID(num):
	pass

func _ready() -> void:
	reparent($/root/computerShrilow/ShrilowScreen)
	position.x = 223
	position.y = 515

func _process(delta: float) -> void:
	if FizzyDrink.enabledCrystal == "puppy":
		$Cry.texture = load("res://assets/images/ui/puppyCry.png")
	else:
		$Cry.texture = load("res://assets/images/ui/puppyCryOFF.png")

func _on_shrilow_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "puppy"
