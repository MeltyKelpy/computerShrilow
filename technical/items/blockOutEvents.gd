extends Node2D

func getID(num) -> void:
	ItemValues.itemInfomation[num]["Owned"] = false
	FizzyDrink.stopTheCount += 1800
	queue_free()
