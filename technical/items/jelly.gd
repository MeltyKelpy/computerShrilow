extends Node2D

var jellyNum = 0

func getID(num):
	ItemValues.itemInfomation[num]["Owned"] = false

func getJelly(num):
	print(num)
	jellyNum = num
	position.x = 850
	position.y = 582 - (120*jellyNum)

func _ready() -> void:
	reparent($/root/computerShrilow/ShrilowScreen/Control)

func _on_timer_timeout() -> void:
	$Squeak.play()
	$jelly.texture = load("res://assets/images/items/jelly1.png")
	ItemValues.money += 1
	$SecondTimer.start()

func _on_second_timer_timeout() -> void:
	$jelly.texture = load("res://assets/images/items/jelly0.png")
	$FirstTimer.start()
