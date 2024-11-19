extends Node2D

var timer = Timer.new()
var alreadyBegan = false

func _ready() -> void:
	if (alreadyBegan == false):
		$/root/computerShrilow.shrilowColor("yellow")
		timer.wait_time = 8
		timer.one_shot = false
		timer.autostart = true
		timer.connect("timeout", $/root/computerShrilow.shrilowColor.bind("base"))
		add_child(timer)
		FizzyDrink.clickPowerAdditions += 4
		alreadyBegan = true

func _on_timer_timeout() -> void:
	FizzyDrink.clickPowerAdditions -= 4
	queue_free()
