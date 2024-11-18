extends Node2D

var clicks = 0
var curClicks = 0

var cacapoopyGOD = preload("res://technical/MelaniesItem.tscn")

func generateHoes():
	for i in ItemValues.itemInfomation.size():
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($Shop/ScrollContainer/GridContainer)

func _ready():
	generateHoes()

func _process(_delta : float) -> void:
	
	$Shop/ItemName.text = ItemValues.itemName
	$Shop/ItemDescription.text = ItemValues.itemDesc
	$Shop/ItemExtra.text = ItemValues.itemExtra
	
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(clicks)
	$ShrilowScreen/USDText.text = str(ItemValues.money)
	
	$ParallaxBackground.scroll_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	if Input.is_action_just_pressed("eventText"):
		var cacapoopyGOD2 = preload("res://technical/events/hitmarker.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
		var caca2 = cacapoopyGOD3.instantiate()
		add_child(caca2)
		caca2.warn("OH NO MR.PRESIDENT, WATCH OUT! THEY'RE GONNA ASSASSINATE YOU!")
		caca.reparent($Shrilow)
		$Shrilow/Hitmarker.position.x = -29
		$Shrilow/Hitmarker.position.y = -303

func _on_shrilow_squeak_autoclick() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	ItemValues.money += 1
	$Shrilow/Squeak2.play()

func _on_shrilow_squeak_pressed() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	if curClicks < 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/click.png")
	if curClicks >= 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/dizzy.png")
	$Shrilow/Squeak.play()
	ItemValues.money += 1
	clicks += 1
	curClicks += 1

func _on_face_revert_timeout() -> void:
	$Shrilow/Shrilow/ShrilowFace.visible = true
	$Shrilow/Shrilow/StillFace.visible = false
	curClicks = 0

func _on_shop_button_pressed() -> void:
	print("shop")
	$sectionTransitions.play("toShop")

func _on_back_button_shop_pressed() -> void:
	$sectionTransitions.play("leaveShop")

func _on_wardrobe_button_pressed() -> void:
	print("wardrobe")

func _on_trophies_button_pressed() -> void:
	print("trophies")
