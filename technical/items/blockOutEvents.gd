extends Node2D

func _ready():
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.position.x = 0
	caca2.position.y = 0
	caca2.warn("You bought an Antivirus!")

func getID(num) -> void:
	ItemValues.itemInfomation[num]["Owned"] = false
	if Game.contains_curse("quicktime"):
		FizzyDrink.stopTheCount += 60
	else:
		FizzyDrink.stopTheCount += 1800
	queue_free()
