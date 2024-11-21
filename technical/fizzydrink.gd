extends Node

var clickPower = 1
var clickPowerAdditions = 0
var clickPowerClothingBuffs = 0

var AUTOclickPower = 1
var AUTOclickPowerAdditions = 0
var AUTOclickPowerClothingBuffs = 0

var minesLength = 1

func updateClothes() -> void:
	clickPowerClothingBuffs = 0
	AUTOclickPowerClothingBuffs = 0
	if ClothingObjects.clothes[ClothingObjects.equippedClothing]["Name"] == "Very Real Different Suit":
		clickPowerClothingBuffs = 1
		AUTOclickPowerClothingBuffs = 1
