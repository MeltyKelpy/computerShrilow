extends Node2D

@export var ItemID : int
@export var ID : int
@export var Aname = "Basic Room"
@export var type = "Basic Room"
@export var maxJel = 15
@onready var parent = $/root/computerShrilow/Jelly/rooms
@export var camYpos = 0
@export var camXpos = 0
@export var jellyCount = 0

func getID(num):
	ID = FizzyDrink.amountOfRooms
	reparent(parent)
	ItemValues.melvinItems[num]["Owned"] = false
	position.x = -64
	position.y = (FizzyDrink.amountOfRooms * 1300) + 1600
	FizzyDrink.amountOfRooms += 1
	camXpos = ($/root/computerShrilow/Jelly.position.x + position.x) - 108
	camYpos = ($/root/computerShrilow/Jelly.position.y + position.y) + 324
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a "+type+" for your jellies!")
