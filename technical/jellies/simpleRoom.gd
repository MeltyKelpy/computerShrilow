extends Node2D

@export var ItemID : int
@export var ID : int
@export var Aname = "Simple Room"
@export var type = "Simple Room"
@export var maxJel = 5
@onready var parent = $/root/computerShrilow/Jelly/rooms
@export var camYpos = 0
@export var camXpos = 0
@export var maxLEFT = 0
@export var maxRIGHT = 0
@export var jellyCount = 0

func getID(num):
	# FUCKKK I HATE MINORS
	ID = FizzyDrink.amountOfRooms
	reparent(parent)
	ItemValues.melvinItems[num]["Owned"] = false
	position.x = -64
	position.y = ((FizzyDrink.amountOfRooms) * 1300) + 1600
	FizzyDrink.amountOfRooms += 1
	maxLEFT = -1320
	maxRIGHT = -1050
	camXpos = ($/root/computerShrilow/Jelly.position.x + position.x) - 108
	camYpos = ($/root/computerShrilow/Jelly.position.y + position.y) + 324
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a "+type+" for your jellies!")

func _process(delta: float) -> void:
	
	if Settings.setting_state("jelliesOptimization"):
		$Chandelier.process_mode = 4
		$Chandelier.visible = false
		$Sprite2D.visible = true
	else:
		$Chandelier.process_mode = 0
		$Chandelier.visible = true
		$Sprite2D.visible = false
	
	if Input.is_action_just_pressed("DebugMode"):
		getID(ID)
		FizzyDrink.scrollLimitLEFT = maxLEFT
		FizzyDrink.scrollLimitRIGHT = maxRIGHT
