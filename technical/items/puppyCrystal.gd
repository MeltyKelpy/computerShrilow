extends Node2D

func getID(num):
	pass

func _ready() -> void:
	reparent($/root/computerShrilow/ShrilowScreen)
	if FizzyDrink.amountOfHomeCrystals == 1:
		position.x = 338
	else:
		position.x = 223
	FizzyDrink.amountOfHomeCrystals += 1
	position.y = 515

func _process(delta: float) -> void:
	if FizzyDrink.enabledCrystal == "puppy":
		$Cry.texture = load("res://assets/images/ui/puppyCry.png")
	else:
		$Cry.texture = load("res://assets/images/ui/puppyCryOFF.png")

func _on_shrilow_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "puppy"
