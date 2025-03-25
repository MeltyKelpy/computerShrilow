extends Node

var timer = Timer.new()
var ItemID : int
var time

func _ready() -> void:
	time = float(ItemValues.marketItems[ItemID]["BaseValue"]+(ItemValues.marketItems[ItemID]["CurUpgrade"]*ItemValues.marketItems[ItemID]["UpgradeIncrease"]))
	if time < 0:
		time = 0.05
	timer.wait_time = time
	timer.one_shot = false
	timer.autostart = true
	timer.connect("timeout", $/root/computerShrilow._on_shrilow_squeak_autoclick)
	add_child(timer)

func getID(num):
	ItemID = num

func _process(_delta: float) -> void:
	var time = float(ItemValues.marketItems[ItemID]["BaseValue"]+(ItemValues.marketItems[ItemID]["CurUpgrade"]*ItemValues.marketItems[ItemID]["UpgradeIncrease"]))
	if time <= 0:
		time = 0.2
	timer.wait_time = time
