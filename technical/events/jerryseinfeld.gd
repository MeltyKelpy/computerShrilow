extends Node2D

var hurt = false
var shake = false
var rng = RandomNumberGenerator.new()
var clicks = 0
var curClicks = 0
var ranCheck = false

func _ready() -> void:
	clicks = rng.randi_range(5, 10)
	print(clicks)
	reparent($/root/computerShrilow/ShrilowScreen)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x = $/root/computerShrilow/ShrilowScreen.position.x
	position.y = $/root/computerShrilow/ShrilowScreen.position.y
	
	if shake == true:
		$jerry.position.y += 1
		$jerry.position.x = 156 + rng.randf_range(-20.0, 20.0)
	
	if curClicks == clicks or curClicks > clicks:
		$jerry.position.y += 2 + (2 * delta)
		$jerry.play("fall")
		if ranCheck == false:
			var awesome = rng.randi_range(1, 30)
			if awesome == 1:
				var cacapoopyGOD2 = load("res://technical/events/jerryseinfeld.tscn")
				var caca = cacapoopyGOD2.instantiate()
				add_child(caca)
				var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
				var caca2 = cacapoopyGOD3.instantiate()
				add_child(caca2)
				caca2.reparent($/root/computerShrilow/ShrilowScreen)
				caca2.warn("Revenge of the Seinfeld....")
				caca.position.y = caca.position.y + $/root/computerShrilow/ShrilowScreen.position.y
				caca.position.x = caca.position.x + $/root/computerShrilow/ShrilowScreen.position.x
			ranCheck = true
		if $jerry.position.y >= 725:
			queue_free()
	else:
		if $jerry.position.y > 105 and hurt == false:
			$jerry.play("climb")
			$jerry/jerryTail.play("noTail")
			$jerry.position.y -= 2 + (2 * delta)
			if $jerry.position.x < 156:
				$jerry.position.x += 1 + (1 * delta)
			if $jerry.position.x > 156:
				$jerry.position.x -= 1 + (1 * delta)
		elif $jerry.position.y <= 105 and hurt == false:
			$jerry.play("steal")
			$jerry/jerryTail.play("tail")
			if ItemValues.money > 100:
				ItemValues.money -= 0.5 * (ItemValues.money / 700)
			else:
				ItemValues.money -= 0.5
		elif hurt == true:
			if $jerry.frame != 1:
				$jerry.play("punch")
			$jerry/jerryTail.play("noTail")

func _on_button_pressed() -> void:
	curClicks += 1
	$jerry.frame = 0
	hurt = true
	shake = true
	$shakeLength.stop()
	$shakeLength.start()
	$resetState.stop()
	$resetState.start()
	$AudioStreamPlayer.stream = load("res://assets/sounds/angryCat"+str(rng.randi_range(1, 4))+".ogg")
	$AudioStreamPlayer.play()

func _on_reset_state_timeout() -> void:
	if curClicks <= clicks:
		hurt = false
		curClicks = 0

func _on_shake_length_timeout() -> void:
	shake = false
