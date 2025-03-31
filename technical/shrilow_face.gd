extends Node2D

func _process(delta: float) -> void:
	$Cove.texture = load("res://assets/images/computershrilows/shrilowFaces/"+ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]+"/pupilCove.png")
	$Control/leftOrigin/Pupil1.texture = load("res://assets/images/computershrilows/shrilowFaces/"+ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]+"/pupil.png")
	$Control/rightOrigin/Pupil2.texture = load("res://assets/images/computershrilows/shrilowFaces/"+ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]+"/pupil.png")
