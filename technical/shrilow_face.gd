extends Node2D

@onready var rightOriginBase = $Control/rightOrigin.position
@onready var leftOriginBase = $Control/leftOrigin.position
@export var force_eyes = ""

func _process(delta: float) -> void:
	var eyePath = ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]
	if force_eyes == "":
		eyePath = ClothingObjects.clothes[ClothingObjects.equippedClothing]["eyes"]
	else:
		eyePath = force_eyes
	var covePath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupilCove.png"
	var pupilPath = "res://assets/images/computershrilows/faces/"+eyePath+"/pupil.png"
	var backupCove = load("res://assets/images/computershrilows/faces/baseEyes/pupilCove.png")
	var backupPupil = load("res://assets/images/computershrilows/faces/baseEyes/pupil.png")
	
	if eyePath == "legacyEyes":
		$Control/rightOrigin.position.x = 124.0
		$Control/rightOrigin.position.y = 24.0
		$Control/leftOrigin.position.x = 39.0
		$Control/leftOrigin.position.y = 24.0
	else:
		$Control/leftOrigin.position = leftOriginBase
		$Control/rightOrigin.position = rightOriginBase
	
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
