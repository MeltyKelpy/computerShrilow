extends Node2D

var clicks = 0
var curClicks = 0
var rng = RandomNumberGenerator.new()

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
	generateHoes()

func _process(_delta : float) -> void:
	
	$Shrilow/Shrilow.texture = load(ClothingObjects.clothes[ClothingObjects.equippedClothing]["Image"])
	
	$Shop/ItemName.text = ItemValues.itemName
	$Shop/ItemDescription.text = ItemValues.itemDesc
	$Shop/ItemExtra.text = ItemValues.itemExtra
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(clicks)
	$USDText.text = str(ItemValues.money)
	
	$ParallaxBackground.scroll_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	if Input.is_action_just_pressed("eventText"):
		_event()
	
	if Input.is_action_just_pressed("DebugMode"):
		$DEBUGVALUES.visible = !$DEBUGVALUES.visible
	
	if $DEBUGVALUES.visible == true:
		$DEBUGVALUES/ScrollContainer/Control/Label.text = "DEBUG MODE\n================\n"
	
func _on_shrilow_squeak_autoclick() -> void:
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	$Shrilow/Shrilow/StillFace.visible = true
	ItemValues.money += FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPowerClothingBuffs
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
	ItemValues.money += FizzyDrink.clickPower+FizzyDrink.clickPowerAdditions+FizzyDrink.clickPowerClothingBuffs
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
	$sectionTransitions.play("toWard")

func _on_back_button_ward_pressed() -> void:
	$sectionTransitions.play("leaveWard")

func _on_trophies_button_pressed() -> void:
	print("trophies")

func _on_mines_button_pressed() -> void:
	print("mines")

func _event() -> void:
	var num = rng.randi_range(0, Events.eventList.size()-1)
	_startEvent(num)

func _startEvent(numberPicked) -> void:
	var cacapoopyGOD2 = load(Events.eventList[numberPicked]["AttachedScene"])
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	caca.reparent($Shrilow)
	caca._ready()
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.warn(Events.eventList[numberPicked]["WarningMessage"])

func shrilowColor(color) -> void:
	if color == "base":
		$Shrilow/Shrilow.modulate = Color(1,1,1)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,1)
	if color == "yellow":
		$Shrilow/Shrilow.modulate = Color(1,1,0)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,0)
