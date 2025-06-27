extends Node2D

@export var ItemID : int
@export var ID : int
@export var Aname = "The Court"
@export var type = "The Court"
@export var maxJel = 10
@onready var parent = $/root/computerShrilow/Jelly/rooms
@export var camYpos = 0
@export var camXpos = 0
@export var maxLEFT = 0
@export var maxRIGHT = 0
@export var jellyCount = 0
@export var sideOneScore = 0
@export var sideTwoScore = 0

func getID(num):
	ID = FizzyDrink.amountOfRooms
	ItemID = num
	reparent(parent)
	ItemValues.melvinItems[ItemID]["Owned"] = false
	position.x = -200
	position.y = ((FizzyDrink.amountOfRooms) * 1300) + 1600
	FizzyDrink.amountOfRooms += 1
	maxLEFT = -1456
	maxRIGHT = -65
	camXpos = ($/root/computerShrilow/Jelly.position.x + position.x) - 108
	camYpos = ($/root/computerShrilow/Jelly.position.y + position.y) + 324
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a "+type+" for your jellies!")

func _process(delta: float) -> void:
	$ColorRect/Label.text = str(sideOneScore)
	$ColorRect2/Label.text = str(sideTwoScore)
	if Input.is_action_just_pressed("DebugMode"):
		getID(ID)
		FizzyDrink.scrollLimitLEFT = maxLEFT
		FizzyDrink.scrollLimitRIGHT = maxRIGHT
