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
var characterAppearTime = 2
@onready var wackiholes = [
	$WhackilowHole1,
	$WhackilowHole2,
	$WhackilowHole3,
	$WhackilowHole4,
	$WhackilowHole5,
	$WhackilowHole6,
	$WhackilowHole7,
	$WhackilowHole8,
	$WhackilowHole9,
	]

func _ready() -> void:
	Events.justMinigames[3]["Played?"] = true
	$opening/Label.position.y = 5000
	$AnimationPlayer.play("pop")
	$opening/Star1.modulate = Color(1,1,1,0)
	$opening/Star2.modulate = Color(1,1,1,0)
	$opening/Star3.modulate = Color(1,1,1,0)
	$opening/Star4.modulate = Color(1,1,1,0)
	$opening/Star5.modulate = Color(1,1,1,0)

func _allowToMove():
	$gameTimer.start()
	$charTimer.start()
	readyy = true

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
	
	$charTimer.wait_time = characterAppearTime
	
	if readyy == true:
		$opening/Label.text = "Time left: "+str(int($gameTimer.time_left))
	else:
		$opening/Label.text = "Time left: "+str(int($gameTimer.wait_time))
	
	if state == "contract" and Input.is_action_just_pressed("ui_accept"):
		state = "interactable"
		$AnimationPlayer.play("title")
	
	if state == "uninteractable":
		pass
	if state == "interactable":
		pass
	
	if Input.is_action_just_pressed("DebugMode"):
		_fuckYeah()
	
	if stars != starsPrev:
		starsUpdate()
		starsPrev = stars
	
	if $gameTimer.time_left == 0 and gameOver == false and readyy == true:
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
		money = (100 + (ItemValues.maxMoney / 1000)) * stars
		add_child(caca)
	if stars <= 0:
		winOrLose = false
		money = 300 + (ItemValues.maxMoney / 1000)
		add_child(caca)
	caca.determineResult(winOrLose, stars, money)
	caca.reparent($/root)

func _on_char_timer_timeout() -> void:
	if gameOver == false:
		var rrnngg = rng.randi_range(0, wackiholes.size() - 1)
		var hi
		characterAppearTime -= 0.070
		if characterAppearTime < 0.3:
			characterAppearTime = 0.3
		wackiholes[rrnngg].time = characterAppearTime
		if wackiholes[rrnngg].chara == "none":
			if $gameTimer.time_left <= 20:
				hi = true
			else:
				hi = false
			wackiholes[rrnngg].characterSpawn(hi)
		$charTimer.start()
