extends Node2D

func getID(num):
	pass

func _ready() -> void:
	reparent($/root/computerShrilow/ShrilowScreen)
	position.x = 338
	position.y = 515

func _process(delta: float) -> void:
	if FizzyDrink.enabledCrystal == "shrilow":
		$shrilowCry.texture = load("res://assets/images/ui/shrilowCry.png")
	else:
		$shrilowCry.texture = load("res://assets/images/ui/shrilowCryOFF.png")

func _on_shrilow_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "shrilow"
