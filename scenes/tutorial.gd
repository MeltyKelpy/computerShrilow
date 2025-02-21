extends Node2D

var dialogueLine = 0
var dialougeState = "intro"
var canProg = false
var canClickShrilow = false
var clicks = 0
var money = 0

func _ready() -> void:
	$TXT.text = ""

func _process(delta: float) -> void:
	
	$Clicks.text = "CLICKS: "+str(clicks)
	$USDText.text = str(money)
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5
	
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()
	
	if canProg == true and dialougeState != "intro" and Input.is_action_just_pressed("Click"):
		dialogManagement(dialougeState)
	
	if canProg == true and dialougeState == "intro" and Input.is_action_just_pressed("Click"):
		dialougeState = "HowToClickShrilow"
		dialogManagement(dialougeState)
	
	if clicks == 100 and dialogueLine == 1 and dialougeState == "shop":
		dialogManagement(dialougeState)
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05

func dialogManagement(state):
	dialogueLine += 1
	canProg = false
	match dialougeState:
		"HowToClickShrilow":
			if dialogueLine == 1:
				$TXT.text = "Alright, cool! you got it!"
				canProg = true
			if dialogueLine == 2:
				$TXT.text = "Now, lets get started."
				canProg = true
			if dialogueLine == 3:
				$TXT.text = "You see that boy down there?\nClick him!"
				canClickShrilow = true
		"clickedShril":
			if dialogueLine == 1:
				$TXT.text = "Sweet, you got it!"
				canProg = true
				dialougeState = "shop"
				dialogueLine = 0
		"shop":
			if dialogueLine == 1:
				$TXT.text = "alright, now im just gonna ask you to click him a few more times, we gotta rack up some more cash!"
			if dialogueLine == 2:
				canClickShrilow = false
				$TXT.text = "alright, good, that should be enough!"
				canProg = true
			if dialogueLine == 3:
				$TXT.text = "now, head over to the shop with me!"
				canProg = true

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
	$TXT.text = "Hello!"
	await get_tree().create_timer(2).timeout
	$TXT.text = "Hello!."
	await get_tree().create_timer(1).timeout
	$TXT.text = "Hello!.."
	await get_tree().create_timer(1).timeout
	$TXT.text = "Hello!..."
	await get_tree().create_timer(3).timeout
	$TXT.text = "Oh, Right!"
	await get_tree().create_timer(2).timeout
	$TXT.text = "When i'm not giving instructions, you can click anywhere to progress dialouge!"
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
		clicks += 1
		money += 1

func _on_face_revert_timeout() -> void:
	$Shrilow/Shrilow/ShrilowFace.visible = true
	$Shrilow/Shrilow/StillFace.visible = false
