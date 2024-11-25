extends Node2D

var ItemID : int

func _ready() -> void:
	reparent($/root)
	$AnimPlayer.play("POPUP")
	$eventer/Warning.text = "The BONE Effect has been applied! you now gain double the amount of dollars per click for the next 30 seconds."
	FizzyDrink.clickPowerAdditions += (FizzyDrink.clickPower+FizzyDrink.clickPowerClothingBuffs) * 2

func getID(num):
	ItemID = num

func _process(_delta: float) -> void:
	self.position.x = 0
	self.position.y = 0

func _endEffect() -> void:
	ItemValues.itemInfomation[ItemID]["Owned"] = false
	$eventer/Warning.text = "The BONE Effect has ended."
	FizzyDrink.clickPowerAdditions -= (FizzyDrink.clickPower+FizzyDrink.clickPowerClothingBuffs) * 2
	print(FizzyDrink.clickPower)

func _kill() -> void:
	queue_free()
