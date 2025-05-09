extends Control

var money = 0

func _process(delta: float) -> void:
	$moneybox/moneylabel.text = str(money)
