extends Node2D

var animPlayed = false

func _ready() -> void:
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

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "pop":
		$AnimationPlayer.play("title")

func _endEvent():
	$/root/computerShrilow/Jelly/StaticBody2D/CollisionShape2D.disabled = false
	$/root/computerShrilow/Jelly/StaticBody2D/CollisionShape2D2.disabled = false
	var money = 150
	var _money2 = ItemValues.maxMoney * 0.1
	money = money #+ money2
	var cacapoopyGOD = preload("res://technical/resultsScreenMINIGAME.tscn")
	var caca = cacapoopyGOD.instantiate()
	add_child(caca)
	caca.determineResult(true, 5, money)
	caca.reparent($/root)
