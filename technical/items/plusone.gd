extends Node2D

var number : int

func getID(num):
	number = num

func _process(delta: float):
	FizzyDrink.clickPower = 1 + (ItemValues.itemInfomation[number]["CurUpgrade"])
