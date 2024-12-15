extends Node2D

var ID
var Aname = "Basic Room"
@onready var parent = $/root/computerShrilow/Jelly/rooms
var camYpos = 0
var camXpos = 0
var jellyCount = 0

func getID(num):
	ID = num
	reparent(parent)
	ItemValues.melvinItems[ID]["Owned"] = false
	position.x = -64
	position.y = (FizzyDrink.amountOfRooms * 1300) + 1600
	FizzyDrink.amountOfRooms += 1
	camXpos = ($/root/computerShrilow/Jelly.position.x + position.x) - 108
	camYpos = ($/root/computerShrilow/Jelly.position.y + position.y) + 324

func _process(delta: float) -> void:
	pass
