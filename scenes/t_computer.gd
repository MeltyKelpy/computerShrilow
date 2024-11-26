extends Node2D

var clicks = 0.0
var curClicks = 0.0
var rng = RandomNumberGenerator.new()
var held_object = false
var cameraMoveDir = "center"
var area = "notJellies"

var cacapoopyGOD = preload("res://technical/MelaniesItem.tscn")

func generateHoes():
	for i in ItemValues.itemInfomation.size():
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($Shop/ScrollContainer/GridContainer)
	for i in ClothingObjects.clothes.size():
		var cacapoopyGOD2 = preload("res://technical/clothingObject.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($Wardrobe/ScrollContainer/GridContainer)

func _ready():
	$Mines.position.y = 648
	generateHoes()

func _process(_delta : float) -> void:
	
	if $Camera2D.position.x < (-576):
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(1)
	elif $Camera2D.position.x == (-576):
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(2)
	else:
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(2)
	
	if cameraMoveDir == "left":
		$Camera2D.position.x -= 10
	if cameraMoveDir == "right":
		$Camera2D.position.x += 10
	
	if area == "Jellies" and $Camera2D.position.x > (-576):
		$Camera2D.position.x = (-576)
	
	if FizzyDrink.stopTheCount != 0:
		$noEventsTimer.wait_time = FizzyDrink.stopTheCount
		$noEventsTimer.start($noEventsTimer.time_left + FizzyDrink.stopTheCount)
		FizzyDrink.stopTheCount = 0
		$EventTimer.paused = true
	if $noEventsTimer.time_left == 0:
		$EventTimer.paused = false
	
	if FizzyDrink.health >= 100:
		$Shrilow/ProgressBar.visible = false
	else:
		$Shrilow/ProgressBar.visible = true
	$Shrilow/ProgressBar.value = FizzyDrink.health
	if FizzyDrink.health <= 0:
		var cacapoopyGOD2 = load("res://technical/death.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
	
	$Mines/ScrollContainer/Control.custom_minimum_size.y = (648 * FizzyDrink.minesLength) + 100
	
	#$Mines/MinesBackground.position.y = $Mines/ScrollContainer.scroll_vertical
	
	$Shrilow/Shrilow.texture = load(ClothingObjects.clothes[ClothingObjects.equippedClothing]["Image"])
	
	$Shop/ItemName.text = ItemValues.itemName
	$Shop/ItemDescription.text = ItemValues.itemDesc
	$Shop/ItemExtra.text = ItemValues.itemExtra
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(clicks)
	$USDText.text = str(ItemValues.money)
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	if Input.is_action_just_pressed("eventText"):
		_event()
	
	if Input.is_action_just_pressed("DebugMode"):
		$DEBUGVALUES.visible = !$DEBUGVALUES.visible
	
	if $DEBUGVALUES.visible == true:
		$DEBUGVALUES/ScrollContainer/Control/Label.text = "DEBUG MODE\n================\nEvent Timer: "+str($EventTimer.time_left)+"\nStop Events Timer: "+str($noEventsTimer.time_left)
	
func _on_shrilow_squeak_autoclick() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	ItemValues.money += FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPowerClothingBuffs
	$Shrilow/Squeak2.play()

func _on_shrilow_squeak_pressed() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$faceRevert2.stop()
	$faceRevert2.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	if curClicks < 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/click.png")
	if curClicks >= 150:
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/dizzy.png")
	$Shrilow/Squeak.play()
	ItemValues.money += FizzyDrink.clickPower+FizzyDrink.clickPowerAdditions+FizzyDrink.clickPowerClothingBuffs
	clicks += 1
	curClicks += 1

func _on_face_revert_timeout() -> void:
	$Shrilow/Shrilow/ShrilowFace.visible = true
	$Shrilow/Shrilow/StillFace.visible = false

func _on_shop_button_pressed() -> void:
	print("shop")
	$sectionTransitions.play("toShop")

func _on_back_button_shop_pressed() -> void:
	$sectionTransitions.play("leaveShop")

func _on_wardrobe_button_pressed() -> void:
	print("wardrobe")
	$sectionTransitions.play("toWard")

func _on_back_button_ward_pressed() -> void:
	$sectionTransitions.play("leaveWard")

func _on_back_button_ward2_pressed() -> void:
	$sectionTransitions.play("leaveMines")

func _on_trophies_button_pressed() -> void:
	print("trophies")

func _on_mines_button_pressed() -> void:
	print("mines")
	$sectionTransitions.play("toMines")

func _event() -> void:
	var num = rng.randi_range(0, Events.eventList.size()-1)
	_startEvent(num)

func _startEvent(numberPicked) -> void:
	var cacapoopyGOD2 = load(Events.eventList[numberPicked]["AttachedScene"])
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.warn(Events.eventList[numberPicked]["WarningMessage"])
	if Events.eventList[numberPicked]["Type"] == "Minigame":
		get_tree().paused = true
		caca.position.x = $Camera2D.position.x - 576
		caca.position.y = $Camera2D.position.y - 324
		caca.reparent($/root)
	if Events.eventList[numberPicked]["Type"] == "Generic":
		caca.reparent($ShrilowScreen)
		caca.position.y = caca.position.y + $ShrilowScreen.position.y
		caca.position.x = caca.position.x + $ShrilowScreen.position.x

func shrilowColor(color) -> void:
	if color == "base":
		$Shrilow/Shrilow.modulate = Color(1,1,1)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,1)
	if color == "yellow":
		$Shrilow/Shrilow.modulate = Color(1,1,0)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,0)

func _on_face_revert_2_timeout() -> void:
	curClicks = 0

func _on_back_button_jelly_pressed() -> void:
	area = "notJellies"
	$sectionTransitions.play("leaveJellies")

func _on_jellies_button_pressed() -> void:
	$sectionTransitions.play("toJellies")

func _on_right_move_mouse_entered() -> void:
	if $Camera2D.position.x < (-576):
		cameraMoveDir = "right"

func _on_left_move_mouse_entered() -> void:
	cameraMoveDir = "left"
	print("hi")

func _on_right_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _on_left_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _signal_jelly():
	area = "Jellies"
