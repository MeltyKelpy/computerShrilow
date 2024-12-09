extends Node2D

var ID = 0

func _ready():
	reparent($/root/computerShrilow/ShrilowScreen)

func getPuppy(hi):
	position.x = 850
	position.y = 544 + (-199 * hi)

func getID(num):
	ID = num
	ItemValues.itemInfomation[num]["Owned"] = false

func _on_timer_timeout() -> void:
	$AudioListener2D.play()
	ItemValues.money += 1
	$puppy.texture = load("res://assets/images/items/gp1.png")
	$Timer2.start()

func _on_timer_2_timeout() -> void:
	$puppy.texture = load("res://assets/images/items/gp0.png")
	$Timer.start()
