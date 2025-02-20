extends Node2D

var ItemID : int
var additive = 0

func _ready() -> void:
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought an Auto-Bone! your auto-clicker's power is currently doubled for a limited time.")
	FizzyDrink.AUTOclickPowerAdditions += (FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerP1+FizzyDrink.AUTOclickPowerP1R+FizzyDrink.AUTOclickPowerClothingBuffs)
	additive = FizzyDrink.AUTOclickPowerAdditions
	var cacapoopyGOD2 = preload("res://technical/clock.tscn")
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	caca.create("Auto-bone", 30, "not")

func getID(num):
	ItemID = num

func _process(_delta: float) -> void:
	self.position.x = 0
	self.position.y = 0

func _endEffect() -> void:
	ItemValues.itemInfomation[ItemID]["Owned"] = false
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("oops! auto-bone effect all gone")
	FizzyDrink.AUTOclickPowerAdditions -= additive

func _kill() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	_endEffect()
	await get_tree().create_timer(2).timeout
	_kill()
