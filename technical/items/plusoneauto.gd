extends Node2D

var number : int

func getID(num):
	number = num

func _process(_delta: float):
	FizzyDrink.AUTOclickPower = 1 + (ItemValues.itemInfomation[number]["CurUpgrade"])
