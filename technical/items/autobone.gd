extends Node2D

var ItemID : int

func _ready() -> void:
	reparent($/root)
	$AnimPlayer.play("POPUP")
	$eventer/Warning.text = "The AUTOBONE Effect has been applied! your autoclicker now gives double the amount of dollars per click for the next 30 seconds."
	FizzyDrink.AUTOclickPowerAdditions += (FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerClothingBuffs) * 2

func getID(num):
	ItemID = num

func _process(delta: float) -> void:
	self.position.x = 0
	self.position.y = 0

func _endEffect() -> void:
	ItemValues.itemInfomation[ItemID]["Owned"] = false
	$eventer/Warning.text = "The AUTOBONE Effect has ended."
	FizzyDrink.AUTOclickPowerAdditions -= (FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerClothingBuffs) * 2

func _kill() -> void:
	queue_free()
