extends Node

var timer = Timer.new()
signal interact

func _ready() -> void:
	timer.wait_time = ItemValues.itemInfomation[0]["BaseValue"]+(ItemValues.itemInfomation[0]["CurUpgrade"]*ItemValues.itemInfomation[0]["UpgradeIncrease"])
	timer.one_shot = false
	timer.autostart = true
	timer.connect("timeout", $/root/computerShrilow._on_shrilow_squeak_autoclick)
	add_child(timer)

func _process(delta: float) -> void:
	timer.wait_time = ItemValues.itemInfomation[0]["BaseValue"]+(ItemValues.itemInfomation[0]["CurUpgrade"]*ItemValues.itemInfomation[0]["UpgradeIncrease"])
