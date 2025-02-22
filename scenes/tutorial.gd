extends Node2D

var dialogueLine = 0
var dialougeState = "intro"
var canProg = false
var can = true
var canClickShrilow = false
var clicks = 0
var area
var canBuy = false
var melShopState = true
var melvinShopState = true
var rebirthIndicated = false

func _ready() -> void:
	$ShrilowScreen/TXT.text = ""
	$Shop/TXT.text = ""
	$Wardrobe/TXT.text = ""
	$Mines/TXT.visible = false
	
	for i in ItemValues.shopTUTORIAL.size():
		var cacapoopyGOD = preload("res://technical/MelaniesItem.tscn")
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		caca.type = "tutorial"
		add_child(caca)
		caca.reparent($Shop/ScrollContainer/GridContainer)
	for i in ClothingObjects.clothesTUTORIAL.size():
		var cacapoopyGOD2 = preload("res://technical/clothingObject.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		caca.arrayToUse = 1
		add_child(caca)
		caca.reparent($Wardrobe/ScrollContainer/GridContainer)

func _process(delta: float) -> void:
	
	if canBuy == true:
		$Shop/Panel.position.y = 675
		$Wardrobe/Panel.position.y = 1338
	else:
		$Shop/Panel.position.y = 236
		$Wardrobe/Panel.position.y = 94
	
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(clicks)
	$USDText.text = str(Game.commizeNumber(round(ItemValues.money)))
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5
	
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()
	
	if canProg == true and dialougeState != "intro" and Input.is_action_just_pressed("Click"):
		dialogManagement(dialougeState)
	
	if $ShrilowScreen/puppies.get_child_count() == 1 and dialougeState == "shop":
		dialogueLine = 0
		dialougeState = "wardrobeExplaination"
		dialogManagement(dialougeState)
	
	if dialougeState == "wardrobeExplaination" and dialogueLine == 7 and ClothingObjects.equippedClothing == 1:
		if Input.is_action_just_pressed("Click"):
			dialogManagement(dialougeState)
	
	if canProg == true and dialougeState == "intro" and Input.is_action_just_pressed("Click"):
		dialougeState = "HowToClickShrilow"
		dialogManagement(dialougeState)
	
	if ItemValues.money == 100 and dialogueLine == 1 and dialougeState == "shop":
		dialogManagement(dialougeState)
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	if melShopState == true:
		$Shop/ItemName.text = ItemValues.itemName
		$Shop/ItemDescription.text = ItemValues.itemDesc
		$Shop/ItemExtra.text = ItemValues.itemExtra
	if melvinShopState == true:
		$Melvin/ItemName.text = ItemValues.itemName
		$Melvin/ItemDescription.text = ItemValues.itemDesc
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	$Shrilow/Shrilow.texture = load(ClothingObjects.clothesTUTORIAL[ClothingObjects.equippedClothing]["Image"])
	
	if ItemValues.money >= 1000000 and rebirthIndicated == false and can == true:
		rebirthIndicated = true
		var cacapoopyGOD3 = preload("res://technical/rebirthNotification.tscn")
		var caca2 = cacapoopyGOD3.instantiate()
		caca2.tutorial = true
		$Camera2D.add_child(caca2)
		$ShrilowScreen/Rebirth.disabled = false
		$ShrilowScreen/Rebirth.visible = true

func _Rebirth() -> void:
	can = false
	$Camera2D/AudioStreamPlayer.play()
	$Camera2D/ColorRect.visible = true
	$Camera2D/Timer.start()
	FizzyDrink.stopTheCount = 100
	$Shrilow/Squeak.volume_db = -80

func dialogManagement(state):
	dialogueLine += 1
	canProg = false
	match dialougeState:
		"HowToClickShrilow":
			if dialogueLine == 1:
				$ShrilowScreen/TXT.text = "Alright, cool! you got it!"
				canProg = true
			if dialogueLine == 2:
				$ShrilowScreen/TXT.text = "Now, lets get started."
				canProg = true
			if dialogueLine == 3:
				$ShrilowScreen/TXT.text = "You see that boy down there?\nClick him!"
				canClickShrilow = true
		"clickedShril":
			if dialogueLine == 1:
				$ShrilowScreen/TXT.text = "Sweet, you got it!"
				canProg = true
				dialougeState = "shop"
				dialogueLine = 0
		"shop":
			if dialogueLine == 1:
				$ShrilowScreen/TXT.text = "alright, now im just gonna ask you to click him a few more times, we gotta rack up some more cash! (100)"
			if dialogueLine == 2:
				canClickShrilow = false
				$ShrilowScreen/TXT.text = "alright, good, that should be enough!"
				canProg = true
			if dialogueLine == 3:
				$ShrilowScreen/TXT.text = "now, head over to the shop with me!"
				$AnimationPlayer.play("pearShop")
			if dialogueLine == 4:
				$Shop/TXT.text = "welcome to the shop! you can buy things from melanie here."
				canProg = true
			if dialogueLine == 5:
				$Shop/TXT.text = "right now, it seems like shes only selling one thing. and we can buy that!"
				canProg = true
			if dialogueLine == 6:
				$Shop/TXT.text = "once you get into the real game, she'll have more to sell, but we can work with this!"
				canProg = true
			if dialogueLine == 7:
				$Shop/TXT.text = "now, buy that greasepuppy! you can also read its description too obviously lol"
				canBuy = true
		"wardrobeExplaination":
			if dialogueLine == 1:
				$Shop/TXT.text = "Alright, now meet me back at the main screen."
			if dialogueLine == 2:
				$ShrilowScreen/TXT.text = "Wow, look at that lil guy!"
				$Shop/TXT.text = ""
				canProg = true
			if dialogueLine == 3:
				$ShrilowScreen/TXT.text = "He'll make you money in the background."
				canProg = true
			if dialogueLine == 4:
				$ShrilowScreen/TXT.text = "Alright, lets move on! whats next?"
				await get_tree().create_timer(1).timeout
				$AnimationPlayer.play("pearGlitch")
				await get_tree().create_timer(1).timeout
				$ShrilowScreen/TXT.text = ""
				await get_tree().create_timer(1).timeout
				$ShrilowScreen/TXT.text = "Oh."
				await get_tree().create_timer(1).timeout
				$ShrilowScreen/TXT.text = ""
				await get_tree().create_timer(2).timeout
				$ShrilowScreen/TXT.text = "We're not gonna talk about that one!"
				canBuy = false
				await get_tree().create_timer(1.5).timeout
				$ShrilowScreen/TXT.text = "Lets try the Wardrobe next instead!"
				$AnimationPlayer.play("pearWard")
				canProg = false
			if dialogueLine == 5:
				$ShrilowScreen/TXT.text = ""
				$Wardrobe/TXT.text = "Welcome to the Wardrobe."
				canProg = true
			if dialogueLine == 6:
				$Wardrobe/TXT.text = "Normally there would be more outfits, but this is all we got right now."
				canProg = true
			if dialogueLine == 7:
				$Wardrobe/TXT.text = "Go ahead and try that other outfit on!"
				canBuy = true
			if dialogueLine == 8:
				$Wardrobe/TXT.text = "fuck. yes."
				canProg = true
			if dialogueLine == 9:
				$Wardrobe/TXT.text = "lookin good bestie!"
				canProg = true
			if dialogueLine == 10:
				$Wardrobe/TXT.text = "This outfit, like many others, has a perk!"
				canProg = true
			if dialogueLine == 11:
				$Wardrobe/TXT.text = "This one in particular will make your clicks worth twice as much."
				canProg = true
			if dialogueLine == 12:
				$Wardrobe/TXT.text = "Alright! Lets head back to the main screen."
			if dialogueLine == 13:
				$ShrilowScreen/TXT.text = "Try clicking Shrilow now!"
				canClickShrilow = true
				canProg = false
			if dialogueLine == 14:
				$ShrilowScreen/TXT.text = "Awesome!!!\nIf you didnt notice, your clicks are now worth 2 instead of one!"
				canProg = true
				canClickShrilow = false
			if dialogueLine == 15:
				$ShrilowScreen/TXT.text = "Alright, ready to move on? I know I am!"
				canProg = true
			if dialogueLine == 16:
				$ShrilowScreen/TXT.text = "Lets try out"
				await get_tree().create_timer(1).timeout
				$ShrilowScreen/TXT.text = "Lets try out."
				await get_tree().create_timer(0.5).timeout
				$ShrilowScreen/TXT.text = "Lets try out.."
				await get_tree().create_timer(0.5).timeout
				$ShrilowScreen/TXT.text = "Lets try out..."
				await get_tree().create_timer(2).timeout
				$ShrilowScreen/TXT.text = "The Mines! sound good?"
				$AnimationPlayer.play("pearMines")
				canProg = false

func _on_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($vlc/Label, "modulate", Color(1,1,1,1), 1)

func _on_timer_2_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($vlc/Label2, "modulate", Color(1,1,1,1), 1)

func begin() -> void:
	$vlc.visible = false
	$AudioStreamPlayer.play()
	await get_tree().create_timer(1).timeout
	$ShrilowScreen/TXT.text = "Hello!"
	await get_tree().create_timer(2).timeout
	$ShrilowScreen/TXT.text = "Hello!."
	await get_tree().create_timer(1).timeout
	$ShrilowScreen/TXT.text = "Hello!.."
	await get_tree().create_timer(1).timeout
	$ShrilowScreen/TXT.text = "Hello!..."
	await get_tree().create_timer(3).timeout
	$ShrilowScreen/TXT.text = "Oh, Right!"
	await get_tree().create_timer(2).timeout
	$ShrilowScreen/TXT.text = "When i'm not giving instructions, you can click anywhere to progress dialouge, try that now!"
	canProg = true

func killIntro():
	$Camera2D/intro.queue_free()

func shrilClicked() -> void:
	if canClickShrilow == true:
		$Shrilow/faceRevert.stop()
		$Shrilow/faceRevert.start()
		$Shrilow.scale.x = 1.2
		$Shrilow.scale.y = 0.85
		$Shrilow/Shrilow/ShrilowFace.visible = false
		$Shrilow/Shrilow/StillFace.visible = true
		$Shrilow/Shrilow/StillFace.texture = load("res://assets/images/computershrilows/shrilowFaces/click.png")
		$Shrilow/Squeak.play()
		if clicks == 0:
			dialougeState = "clickedShril"
			dialogueLine = 0
			dialogManagement(dialougeState)
		if dialougeState == "wardrobeExplaination" and dialogueLine == 13:
			dialogueLine -= 1
			dialogManagement(dialougeState)
		clicks += 1
		ItemValues.money += 1
		if ClothingObjects.equippedClothing == 1:
			ItemValues.money += 1

func _on_face_revert_timeout() -> void:
	$Shrilow/Shrilow/ShrilowFace.visible = true
	$Shrilow/Shrilow/StillFace.visible = false

func _on_shop_button_pressed() -> void:
	if can == true:
		can = false
		print("shop")
		$sectionTransitions.play("toShop")

func _on_back_button_shop_pressed() -> void:
	if can == true:
		if dialougeState == "wardrobeExplaination":
			dialogManagement(dialougeState)
		can = false
		#if melShopState != true:
			#melShopToggle()
		area = "notJellies"
		$sectionTransitions.play("leaveShop")

func _on_section_transitions_animation_finished(anim_name: StringName) -> void:
	can = true
	if dialougeState == "shop" and dialogueLine == 3:
		$Shop/TXT.text = "Hi there! teehee"
		canProg = true
	if dialougeState == "wardrobeExplaination" and dialogueLine == 4:
		$Wardrobe/TXT.text = "Hi again!"
		canProg = true
	if dialougeState == "wardrobeExplaination" and dialogueLine == 12:
		$Wardrobe/TXT.text = ""
		dialogManagement(dialougeState)

func _on_wardrobe_button_pressed() -> void:
	if can == true:
		can = false
		print("wardrobe")
		$sectionTransitions.play("toWard")

func _on_back_button_ward_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("leaveWard")

func _on_back_button_ward2_pressed() -> void:
	if can == true:
		can = false
		$sectionTransitions.play("leaveMines")

func _on_mines_button_pressed() -> void:
	if can == true:
		can = false
		print("mines")
		$sectionTransitions.play("toMines")

func rebirth() -> void:
	get_tree().change_scene_to_file("res://scenes/rebirthSceneEvil.tscn")
