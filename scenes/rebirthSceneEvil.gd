extends Node2D

var recievedTokens = 0

func _ready() -> void:
	if FizzyDrink.jellys == null:
		FizzyDrink.jellys = 0
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	if FizzyDrink.clickPower == null:
		FizzyDrink.clickPower = 0
	if FizzyDrink.AUTOclickPower == null:
		FizzyDrink.AUTOclickPower = 0
	recievedTokens = 10 + ((FizzyDrink.jellys / 8) + (FizzyDrink.clicks / 1000) + (FizzyDrink.clickPower / 150) + (FizzyDrink.AUTOclickPower / 150))
	if recievedTokens > 50:
		recievedTokens = 50
	$Label2.text = "You have Recieved "+str(recievedTokens)+" Tokens. Dont go spending it all in one place, now!"

func restart():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	Game.notify("Deleted Achievement Unlocked: No-Life\nI better you feel really achomplished right now, huh?", "trophy")

func _on_timer_timeout() -> void:
	pass
