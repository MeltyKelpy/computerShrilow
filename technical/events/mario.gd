extends Node2D

var animPlayed = false
var chance
var loser = ""

func _ready() -> void:
	var date_dict = Time.get_date_dict_from_system()
	var weekday_number = date_dict["weekday"]
	
	chance = randi_range(weekday_number, 6)
	
	if chance == 6:
		$RigidBody2D/AudioStreamPlayer2D.volume_db = 20
		$RigidBody2D/AudioStreamPlayer2D.stream = load("res://assets/sounds/hellofriends.ogg")
	
	$AnimationPlayer.play("pop")

func _introOver():
	$catmario.movingEnabled()
	PhysicsServer2D.set_active(true)

func _process(_delta: float) -> void:
	#print($RigidBody2D.position.y)
	
	if Input.is_action_just_pressed("DebugMode"):
		_endEvent()
	
	if $RigidBody2D.position.y > 520 and $RigidBody2D.position.y < 540:
		$RigidBody2D/AudioStreamPlayer2D.play()
	if $RigidBody2D.position.y > 800:
		if animPlayed == false:
			$AnimationPlayer.play("yes")
			$opening/AudioStreamPlayer.play()
			animPlayed = true
			loser = "gumba"
	if $RigidBody2D.position.y < 800 and $catmario.position.y > 890:
		if animPlayed == false:
			animPlayed = true
			$AudioStreamPlayer.stop()
			loser = "player"
			funniest_shit()
	if $RigidBody2D.position.y > 800 and $catmario.position.y > 890:
		loser = "both"
		if animPlayed == false:
			$AnimationPlayer.play("yes")
			$opening/AudioStreamPlayer.play()
			animPlayed = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "pop":
		$AnimationPlayer.play("title")

func _endEvent():
	var money = 150
	var _money2 = ItemValues.maxMoney * 0.1
	money = money #+ money2
	var cacapoopyGOD = preload("res://technical/resultsScreenMINIGAME.tscn")
	var caca = cacapoopyGOD.instantiate()
	add_child(caca)
	caca.determineResult(true, 5, money)
	caca.reparent($/root)

func funniest_shit():
	print(loser)
	if loser == "both":
		$ColorRect2/death2.visible = true
	if loser == "player":
		$ColorRect2/death.texture = load("res://assets/images/events/death2.png")
	$AudioStreamPlayer.stop()
	$AnimationPlayer.play("fuck")
