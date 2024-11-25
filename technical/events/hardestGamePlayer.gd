extends CharacterBody2D

var can = false
var alive = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func allow():
	can = true
	alive = true

func _physics_process(delta: float) -> void:
	
	if can == true:
		if Input.is_action_pressed("ui_up"):
			position.y -= 1.5
		if Input.is_action_pressed("ui_down"):
			position.y += 1.5
		if Input.is_action_pressed("ui_left"):
			position.x -= 1.5
		if Input.is_action_pressed("ui_right"):
			position.x += 1.5
		
	move_and_slide()

func _on_sphere_body_shape_entered() -> void:
	if can == true:
		can = false
		alive = false
		$AnimationPlayer.play("die")

func part2():
	$AnimationPlayer.play("die2")
