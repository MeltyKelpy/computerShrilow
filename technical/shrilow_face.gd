extends Node2D

func _process(delta: float) -> void:
	var eyePath = ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]
	var covePath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupilCove.png"
	var pupilPath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupil.png"
	var backupCove = load("res://assets/images/computershrilows/faces/baseEyes/pupilCove.png")
	var backupPupil = load("res://assets/images/computershrilows/faces/baseEyes/pupil.png")
	
	if Settings.setting_state("saayo") == false and Settings.setting_state("4baldi") == false:
		$Control.size.y = 51.0
		$Cove.visible = true
	elif Settings.setting_state("saayo") == true:
		covePath = "res://assets/images/computershrilows/faces/saayoEyes/pupilCove.png"
		$Control.size.y = 85.0
		$Cove.visible = true
	elif Settings.setting_state("4baldi") == true:
		$Cove.visible = false
	
	if Settings.setting_state("saayo") == false and Settings.setting_state("4baldi") == false:
		$Control.visible = true
	elif Settings.setting_state("saayo") == true:
		pupilPath = "res://assets/images/computershrilows/faces/saayoEyes/pupil.png"
		$Control.visible = true
	elif Settings.setting_state("4baldi") == true:
		$Control.visible = false
	
	var cove = load(covePath)
	var pupil = load(pupilPath)
	
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
