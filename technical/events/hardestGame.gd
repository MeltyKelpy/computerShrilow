extends Node2D

var readyy = false
var stars = 5
var starsPrev = 5
var gameOver = false
var animPlayed = false

func _ready() -> void:
	$opening/Label.position.y = 5000
	$AnimationPlayer.play("pop")
	$opening/Star1.modulate = Color(1,1,1,0)
	$opening/Star2.modulate = Color(1,1,1,0)
	$opening/Star3.modulate = Color(1,1,1,0)
	$opening/Star4.modulate = Color(1,1,1,0)
	$opening/Star5.modulate = Color(1,1,1,0)
	PhysicsServer2D.set_active(true)

func _allowToMove():
	$HardestGamePlayer.allow()
	PhysicsServer2D.set_active(true)

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
		$HardestGamePlayer.visible = false

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("DebugMode"):
		_endEvent()
	
	if stars != starsPrev:
		starsUpdate()
		starsPrev -= 1
	
	if gameOver == true:
		$AudioStreamPlayer.volume_db -= 1

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "pop":
		$AnimationPlayer.play("title")

func _endEvent():
	gameOver = true
	var money = 150
	var winOrLose = true
	var cacapoopyGOD = preload("res://technical/resultsScreenMINIGAME.tscn")
	var caca = cacapoopyGOD.instantiate()
	if stars > 0:
		winOrLose = true
		money = (50 + (ItemValues.maxMoney / 1000)) * stars
		add_child(caca)
	if stars <= 0:
		winOrLose = false
		money = 200 + (ItemValues.maxMoney / 1000)
		add_child(caca)
	caca.determineResult(winOrLose, stars, money)
	caca.reparent($/root)

func _on_sphere_body_shape_entered(body: Node2D) -> void:
	if $HardestGamePlayer.alive == true:
		stars -= 1
		$HardestGamePlayer._on_sphere_body_shape_entered()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if animPlayed == false:
		$AnimationPlayer.play("yes")
		$opening/AudioStreamPlayer.play()
		animPlayed = true
	$HardestGamePlayer/AnimationPlayer.play("win")
