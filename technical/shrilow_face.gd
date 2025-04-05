extends Node2D

func _process(delta: float) -> void:
	var eyePath = ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]
	var covePath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupilCove.png"
	var pupilPath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupil.png"
	var cove = load(covePath)
	var pupil = load(pupilPath)
	var backupCove = load("res://assets/images/computershrilows/faces/baseEyes/pupilCove.png")
	var backupPupil = load("res://assets/images/computershrilows/faces/baseEyes/pupil.png")
	
	if ResourceLoader.exists(covePath):
		$Cove.texture = cove
	else:
		$Cove.texture = backupCove
	
	if ResourceLoader.exists(pupilPath):
		$Control/leftOrigin/Pupil1.texture = pupil
		$Control/rightOrigin/Pupil2.texture = pupil
	else:
		$Control/leftOrigin/Pupil1.texture = backupPupil
		$Control/rightOrigin/Pupil2.texture = backupPupil
