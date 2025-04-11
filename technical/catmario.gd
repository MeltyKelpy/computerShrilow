extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var readyy = false
var flying = false

func movingEnabled():
	readyy = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if readyy == true:
		if not is_on_floor():
			if flying == false:
				velocity += get_gravity() * delta
		#
		# goodbye my sweet boy.
		#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			#velocity.y = JUMP_VELOCITY
		
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 0.1
			flying = true
		else:
			flying = false
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
