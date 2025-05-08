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
	if FizzyDrink.enabledCrystal == "shrilow":
		$shrilowCry.texture = load("res://assets/images/ui/shrilowCry.png")
	else:
		$shrilowCry.texture = load("res://assets/images/ui/shrilowCryOFF.png")

func _on_shrilow_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "shrilow"
