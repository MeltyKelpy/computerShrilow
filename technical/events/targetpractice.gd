extends Node2D

var readyy = false
var stars = 5
var starsPrev = 5
var gameOver = false
var animPlayed = false
var rng = RandomNumberGenerator.new()
var state = "uninteractable"

func _ready() -> void:
	Events.justMinigames[6]["Played?"] = true
	$opening/Label.position.y = 5000
	$AnimationPlayer.play("pop")
	$opening/Star1.modulate = Color(1,1,1,0)
	$opening/Star2.modulate = Color(1,1,1,0)
	$opening/Star3.modulate = Color(1,1,1,0)
	$opening/Star4.modulate = Color(1,1,1,0)
	$opening/Star5.modulate = Color(1,1,1,0)

func _allowToMove():
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
	
	if state == "contract" and Input.is_action_just_pressed("Click"):
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
	
	if stars == 0 and gameOver == false and readyy == true:
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
		money = (100 + (ItemValues.maxMoney / 100)) * stars
	if stars <= 0:
		winOrLose = false
		money = 300 + (ItemValues.maxMoney / 100)
	add_child(caca)
	caca.determineResult(winOrLose, stars, money)
	caca._setId(Events.find_minigame("Target Practice"))
	caca.reparent($/root)
