extends Node2D

var flooding = true
var rng = RandomNumberGenerator.new()
var clicks = 0
var curClicks = 0
var shake = false

func _ready() -> void:
	flooding = true
	clicks = rng.randi_range(3, 6)
	print(clicks)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if shake == true:
		$Control/cork.position.x = 97 + rng.randf_range(-2.0, 2.0)
	
	if curClicks >= clicks and flooding == true:
		flooding = false
		$Control/cork2.play()
		$Control/AnimationPlayer.play("cork")
	
	if $Control/water.position.y > 324 and flooding == true:
		$Control/water.position.y -= 1
	elif $Control/water.position.y < 972 and flooding == false:
		$Control/water.position.y += 1
	
	if $Control/water.position.y <= 572 and flooding == true:
		FizzyDrink.health -= 0.1
	elif $Control/water.position.y > 572 and flooding == false:
		FizzyDrink.health += 0.5
		$Control/AudioStreamPlayer.volume_db -= 0.1
	
	if $Control/water.position.y == 972 and flooding == false:
		FizzyDrink.health = 100
		queue_free()

func _on_button_pressed() -> void:
	$Control/shakeTimer.stop()
	$Control/shakeTimer.start()
	curClicks += 1
	shake = true

func _on_shake_timer_timeout() -> void:
	shake = false
	curClicks = 0
