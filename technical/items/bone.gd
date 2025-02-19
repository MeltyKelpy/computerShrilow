extends Node2D

var ItemID : int

func _ready() -> void:
	reparent($/root)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a Bone! your click power is currently doubled for a limited time.")
	FizzyDrink.clickPowerAdditions += (FizzyDrink.clickPower+FizzyDrink.clickPowerP1+FizzyDrink.clickPowerP1R+FizzyDrink.clickPowerClothingBuffs) * 2
	var cacapoopyGOD2 = preload("res://technical/clock.tscn")
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	caca.create("Bone", 30, "not")

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
	caca2.warn("oops! bone effect all gone")
	FizzyDrink.clickPowerAdditions -= (FizzyDrink.clickPower+FizzyDrink.clickPowerP1+FizzyDrink.clickPowerP1R+FizzyDrink.clickPowerClothingBuffs) * 2
	print(FizzyDrink.clickPower)

func _kill() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	_endEffect()
	await get_tree().create_timer(2).timeout
	_kill()
