extends Node2D


func determine(muns):
	$money/money.text = str(muns)

func kill():
	queue_free()
