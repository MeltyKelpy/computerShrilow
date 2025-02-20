extends Node2D

var readyy = false
var stars = 5
var starsPrev = 5
var gameOver = false
var animPlayed = false
var rng = RandomNumberGenerator.new()
var state = "uninteractable"
var shrilState = "Base"
var letterToCheck = 0

var round = 0

var prevPrompts = [
	null,
	null,
	null,
	null,
	]

var deterministic = [
	]
var prompts = [
	"I cant stop drinking oil. I cant stop drinking it! I cant stop drinking crude oil!",
	"I think QuickTime Event is a cool person",
	"I hope everyone who dies goes to hell, no matter what.",
	"Supercalifragilisticexpealadocious",
	"Theres a man on the wing.",
	"It's beginning to look alot like a white christmas in here",
	"Hawk 1: hi im hawk 1. Hawk 2: uhm. Those who know: Skull",
	"Well, it looks like fredbears is closing again because of a report of a child dying there. It may sound insane, but we're closing down!",
	]
var lastResultDETERMINE = ""
var section = 0

func _ready() -> void:
	Events.justMinigames[4]["Played?"] = true
	$opening/Label.position.y = 5000
	$AnimationPlayer.play("pop")
	$opening/Star1.modulate = Color(1,1,1,0)
	$opening/Star2.modulate = Color(1,1,1,0)
	$opening/Star3.modulate = Color(1,1,1,0)
	$opening/Star4.modulate = Color(1,1,1,0)
	$opening/Star5.modulate = Color(1,1,1,0)

func _allowToMove():
	readyy = true
	startRound()

func startRound():
	round += 1
	if round < 4:
		$typeBox/LineEdit.text = ""
		$typeBox/LineEdit.visible = true
		$typeBox/Show.visible = false
		deterministic.resize(0)
		lastResultDETERMINE = ""
		section = 0
		letterToCheck = 0
		$Game/Text.visible = true
		$Game/Text.text = "Prompt "+str(round)+":"
		$ShowPrompt.start()
	else:
		_fuckYeah()

func starsUpdate():
	if $opening/Star5.animation != "unstar":
		$opening/Star5.play("unstar")
	if $opening/Star4.animation != "unstar":
		$opening/Star4.play("unstar")
	if $opening/Star3.animation != "unstar":
		$opening/Star3.play("unstar")
	if $opening/Star2.animation != "unstar":
		$opening/Star2.play("unstar")
	if $opening/Star1.animation != "unstar":
		$opening/Star1.play("unstar")
	
	if stars >= 1:
		$opening/Star5.play("star")
	if stars >= 2:
		$opening/Star4.play("star")
	if stars >= 3:
		$opening/Star3.play("star")
	if stars >= 4:
		$opening/Star2.play("star")
	if stars >= 5:
		$opening/Star1.play("star")

func _process(_delta: float) -> void:
	$ParallaxBackground.scroll_base_offset.x -= 10 * _delta/0.5
	
	if shrilState == "Base":
		$Game/Shrilow.play("default")
	if shrilState == "typing":
		$Game/Shrilow.play("talk")
	if shrilState == "Backspace":
		$Game/Shrilow.play("backspace")
	if shrilState == "Stupid":
		$Game/Shrilow.play("win")
	
	if state == "contract" and Input.is_action_just_pressed("Enter"):
		state = "interactable"
		$AnimationPlayer.play("title")
	
	if state == "uninteractable":
		pass
	if state == "interactable":
		pass
	
	#if Input.is_action_just_pressed("DebugMode"):
		#_fuckYeah()
	
	if stars != starsPrev:
		starsUpdate()
		starsPrev = stars
	
	if round == 4 and gameOver == false and readyy == true:
		_fuckYeah()
	
	if gameOver == true:
		$AudioStreamPlayer.volume_db -= 1
	

func _itsToSIGN():
	state = "contract"

func _fuckYeah():
	gameOver = true
	$opening/AudioStreamPlayer.play()
	$AnimationPlayer.play("yes")

func _endEvent():
	if stars < 0:
		stars = 0
	var money = 150
	var winOrLose = true
	var cacapoopyGOD = preload("res://technical/resultsScreenMINIGAME.tscn")
	var caca = cacapoopyGOD.instantiate()
	if stars > 0:
		winOrLose = true
		money = (500 + (ItemValues.maxMoney / 100)) * stars
		add_child(caca)
	if stars <= 0:
		winOrLose = false
		money = 100 + (ItemValues.maxMoney / 1000)
		add_child(caca)
	caca.determineResult(winOrLose, stars, money)
	caca.reparent($/root)

func _acceptText(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Enter") and $typeBox/LineEdit.editable == true:
		$typeBox/LineEdit.editable = false
		print("hello mario")
		checkSpelling()

func checkSpelling():
	var full = $Game/exBox/Text.text
	var typed = $typeBox/LineEdit.text
	$typeBox/LineEdit.visible = false
	$typeBox/Show.visible = true
	print(full.length()-1)
	print(letterToCheck)
	if typed.substr(letterToCheck, 1) == full.substr(letterToCheck, 1):
		print("Letter is Correct")
		print(typed.substr(letterToCheck, 1))
		if lastResultDETERMINE == "Correct":
			deterministic[section]["sectionOfText"] = deterministic[section]["sectionOfText"]+typed.substr(letterToCheck, 1)
		else:
			print("starting new dic")
			section += 1
			deterministic.resize(section+1)
			deterministic[section] = {
				"Result":"Correct",
				"sectionOfText":typed.substr(letterToCheck, 1),
			}
			deterministic[section]["sectionOfText"]
			lastResultDETERMINE = "Correct"
	else:
		print("Letter is Wrong")
		if lastResultDETERMINE == "Wrong":
			deterministic[section]["sectionOfText"] = deterministic[section]["sectionOfText"]+typed.substr(letterToCheck, 1)
			lastResultDETERMINE = "Wrong"
		else:
			print("starting new dic")
			section += 1
			deterministic.resize(section+1)
			deterministic[section] = {
				"Result":"Wrong",
				"sectionOfText":typed.substr(letterToCheck, 1),
			}
			lastResultDETERMINE = "Wrong"
	if letterToCheck != full.length()-1:
		letterToCheck += 1
		checkSpelling()
	else:
		if letterToCheck < full.length()-1:
			print(full.length()-1)
			print(letterToCheck)
			stars -= (full.length()-1) - letterToCheck
		showResults()

func showResults():
	$typeBox/Show.text = ""
	var hi = true
	for i in deterministic.size():
		if i != 0:
			if deterministic[i]["Result"] == "Wrong":
				if deterministic[i]["sectionOfText"] == "":
					deterministic[i]["sectionOfText"] = "_"
				$typeBox/Show.text = $typeBox/Show.text + "[color=red]"+deterministic[i]["sectionOfText"]+"[/color]"
				hi = false
				stars -= 1
			if deterministic[i]["Result"] == "Correct":
				$typeBox/Show.text = $typeBox/Show.text + "[color=green]"+deterministic[i]["sectionOfText"]+"[/color]"
	print($typeBox/Show.text)
	if hi == true:
		shrilState = "Stupid"
		$AudioStreamPlayer2.stream = load("res://assets/sounds/cheer.ogg")
	if hi == false:
		shrilState = "Backspace"
		$AudioStreamPlayer2.stream = load("res://assets/sounds/awh.ogg")
	$AudioStreamPlayer2.play()
	$StartNextMatch.start()

func _on_line_edit_text_changed() -> void:
	if Input.is_action_pressed("Backspace"):
		print("hello luigi")
		shrilState = "Backspace"
	else:
		shrilState = "typing"
	$LastType.stop()
	$LastType.start()

func typeTimeout() -> void:
	shrilState = "Base"

func _on_show_prompt_timeout() -> void:
	var tween = create_tween()
	$Game/Text.visible = false
	tween.tween_property($Game/exBox, "modulate", Color(1,1,1,1), 1)
	var prompppt = calcPrompt()
	prevPrompts[round] = prompppt
	$Game/exBox/Text.text = prompts[prompppt]
	#tween.tween_callback($Sprite.queue_free)
	$ShowTextBox.start()

func calcPrompt():
	var ranThruTimes = 0
	var prompppt
	prompppt = rng.randi_range(0, prompts.size()-1)
	for i in [1,2,3]:
		ranThruTimes = i
		if prompppt == prevPrompts[i]:
			calcPrompt()
		elif ranThruTimes == 3:
			return prompppt

func _on_show_text_box_timeout() -> void:
	$typeBox/LineEdit.editable = true
	var tween = create_tween()
	tween.tween_property($typeBox, "modulate", Color(1,1,1,1), 1)

func _on_start_next_match_timeout() -> void:
	shrilState = "Base"
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property($Game/exBox, "modulate", Color(1,1,1,0), 1)
	tween2.tween_property($typeBox, "modulate", Color(1,1,1,0), 1)
	tween.tween_callback(startRound)
