extends Node2D

var readyy = false
var stars = 5
var starsPrev = 5
var gameOver = false
var animPlayed = false
var winsRo = 0
var winsYou = 0
var turn = 1
var rng = RandomNumberGenerator.new()
var state = "uninteractable"
var roState = "idle"
var yourPick = "empty"
var hisPick = "empty"
var roChoiceWeight = [{
	3:"scissoers",
	2:"rock",
	1:"paper",
	}]
var counters = [{
	"scissoers":"rock",
	"rock":"paper",
	"paper":"scissoers",
	}]
var lastWinner = "ro"
var playerLastPlay = "scissoers"

func _ready() -> void:
	Events.justMinigames[2]["Played?"] = true
	$opening/Label.position.y = 5000
	$AnimationPlayer.play("pop")
	$opening/Star1.modulate = Color(1,1,1,0)
	$opening/Star2.modulate = Color(1,1,1,0)
	$opening/Star3.modulate = Color(1,1,1,0)
	$opening/Star4.modulate = Color(1,1,1,0)
	$opening/Star5.modulate = Color(1,1,1,0)

func _allowToMove():
	pass

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
	
	if stars == 0:
		_endEvent()

func _process(_delta: float) -> void:
	
	$nameStats/You/choice.texture = load("res://assets/images/events/roshambo/icons/"+yourPick+".png")
	$nameStats/roShambo/choice.texture = load("res://assets/images/events/roshambo/icons/"+hisPick+".png")
	
	$roShambo.play(roState)
	
	
	if turn == 6:
		$TURN.visible = false
		$wins.visible = false
		if animPlayed == false:
			$AnimationPlayer.play("yes")
			state = "uninteractable"
			$opening/AudioStreamPlayer.play()
			animPlayed = true
	else:
		$wins.text = "TURN: "+str(turn)+"\n\nWINS:\nROSHAMBO: "+str(winsRo)+"\nYOU: "+str(winsYou)
	
	if state == "contract" and Input.is_action_just_pressed("ui_accept"):
		state = "interactable"
		$AnimationPlayer.play("title")
	
	if state == "uninteractable":
		$pickButton.visible = false
		$pickButton.disabled = true
		$nameStats/You/pick.visible = false
	if state == "interactable":
		$pickButton.visible = true
		$pickButton.disabled = false
		$nameStats/You/pick.visible = true
	
	if Input.is_action_just_pressed("DebugMode"):
		stars -= 1
	
	if stars != starsPrev:
		starsUpdate()
		starsPrev -= 1
	
	if gameOver == true:
		$AudioStreamPlayer.volume_db -= 1

func _itsToSIGN():
	state = "contract"

func _endEvent():
	gameOver = true
	var money = 150
	var winOrLose = true
	var cacapoopyGOD = preload("res://technical/resultsScreenMINIGAME.tscn")
	var caca = cacapoopyGOD.instantiate()
	if stars > 2:
		winOrLose = true
		money = 100 * stars
		add_child(caca)
	if stars <= 2:
		winOrLose = false
		money = 600 + (ItemValues.maxMoney / 10000)
		add_child(caca)
	caca.determineResult(winOrLose, stars, money)
	caca.reparent($/root)

func runRoChoice():
	if turn == 1:
		roChoiceWeight[0][3] = "scissoers"
		roChoiceWeight[0][2] = "paper"
		roChoiceWeight[0][1] = "rock"
	elif lastWinner == "ro":
		roChoiceWeight[0][3] = counters[0][counters[0][playerLastPlay]]
		roChoiceWeight[0][2] = playerLastPlay
		roChoiceWeight[0][1] = counters[0][playerLastPlay]
	elif lastWinner == "you":
		roChoiceWeight[0][3] = playerLastPlay
		roChoiceWeight[0][2] = counters[0][counters[0][playerLastPlay]]
		roChoiceWeight[0][1] = counters[0][playerLastPlay]
	
	roState = "ponder"
	$PonderTime.start()

func _on_pick_button_pressed() -> void:
	if state == "interactable" and yourPick != "empty":
		state = "uninteractable"
		runRoChoice()

func _on_pick_choose_pressed() -> void:
	if state == "interactable":
		if yourPick == "empty":
			yourPick = "rock"
		elif yourPick == "rock":
			yourPick = "paper"
		elif yourPick == "paper":
			yourPick = "scissoers"
		elif yourPick == "scissoers":
			yourPick = "rock"

func _on_ponder_time_timeout() -> void:
	var toChoose = rng.randi_range(1, 100)
	print(toChoose)
	
	if toChoose >= 50 and yourPick != roChoiceWeight[0][3]:
		hisPick = roChoiceWeight[0][3]
	elif toChoose >= 25 and yourPick != roChoiceWeight[0][2]:
		hisPick = roChoiceWeight[0][2]
	elif toChoose >= 0 and yourPick != roChoiceWeight[0][1]:
		hisPick = roChoiceWeight[0][1]
	else:
		hisPick = roChoiceWeight[0][3]
	
	roState = "choose"
	
	if hisPick == counters[0][yourPick]:
		lastWinner = "ro"
		winsRo += 1
		stars -= 1
	else:
		lastWinner = "you"
		winsYou += 1
	var timer = Timer.new()
	timer.wait_time = 0.5
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", react)
	add_child(timer)

func react():
	$AnimationPlayer.play(lastWinner)
	if lastWinner == "you":
		$reactionAudio.stream = load("res://assets/sounds/poppeer.ogg")
		$reactionAudio.play()
		roState = "lose"
		$TURN.text = "You Win!"
	if lastWinner == "ro":
		$reactionAudio.stream = load("res://assets/sounds/awh.ogg")
		$reactionAudio.play()
		roState = "idle"
		$TURN.text = "Ro Wins!"
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", reset)
	add_child(timer)

func killTurnText():
	$TURN.text = ""

func reset():
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", killTurnText)
	add_child(timer)
	hisPick = "empty"
	yourPick = "empty"
	roState = "idle"
	turn += 1
	$TURN.text = "Turn "+str(turn)
	state = "interactable"
