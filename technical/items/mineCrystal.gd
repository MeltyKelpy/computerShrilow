extends Node2D

func getID(num):
	pass

func _ready() -> void:
	reparent($/root/computerShrilow/Mines)
	position.x = 1082
	position.y = 564

func _process(delta: float) -> void:
	if FizzyDrink.enabledCrystal == "mine":
		$mineCry.texture = load("res://assets/images/ui/minesCry.png")
	else:
		$mineCry.texture = load("res://assets/images/ui/minesCryOFF.png")

func _on_mine_button_pressed() -> void:
	FizzyDrink.enabledCrystal = "mine"
