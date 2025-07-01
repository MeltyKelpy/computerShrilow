extends Node2D

var timer = Timer.new()
var alreadyBegan = false
var additiveM
var additiveA

func _ready() -> void:
	if (alreadyBegan == false):
		$/root/computerShrilow.shrilowColor("yellow")
		timer.wait_time = 10
		timer.one_shot = false
		timer.autostart = true
		timer.connect("timeout", $/root/computerShrilow.shrilowColor.bind("base"))
		add_child(timer)
		additiveM = FizzyDrink.clickPowerAdditions * 4
		additiveA = FizzyDrink.AUTOclickPowerAdditions * 4
		FizzyDrink.clickPowerAdditions += additiveM
		FizzyDrink.AUTOclickPowerAdditions += additiveA
		alreadyBegan = true

func _on_timer_timeout() -> void:
	FizzyDrink.clickPowerAdditions -= additiveM
	FizzyDrink.AUTOclickPowerAdditions -= additiveA
	queue_free()
