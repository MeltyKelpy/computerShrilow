extends Button

var chara = "none"
var rng = RandomNumberGenerator.new()
var time = 2
var click = true

func _process(delta: float) -> void:
	$appearTimer.wait_time = time + 1

func characterSpawn(canMelty):
	var roRng = rng.randi_range(1, 100)
	
	$appearTimer.start()
	
	if canMelty == true:
		if roRng > 30:
			chara = "shrilow"
			$Node2D/Control/char.play("shrilow")
		else:
			chara = "melty"
			$Node2D/Control/char.play("mel")
	else:
		chara = "shrilow"
		$Node2D/Control/char.play("shrilow")
	
	$AnimationPlayer.play("showUp")

func killChar():
	var hi = get_parent()
	$appearTimer.stop()
	if hi.gameOver == false:
		if chara == "shrilow" and click == true:
			$Squeak.play()
			$Node2D/Control/char.play("shrilowBonk")
			click = false
			ItemValues.money += 5
			var cacapoopyGOD = load("res://technical/moneyGet.tscn")
			var caca = cacapoopyGOD.instantiate()
			add_child(caca)
			caca.determine(5)
			caca.position.x = 75
			caca.position.y = 225
			$AnimationPlayer.play("goDown")
		if chara == "melty":
			$Squeak.play()
			$Node2D/Control/char.play("melBonk")
			ItemValues.money -= 5
			hi.stars -= 1
			$AnimationPlayer.play("goDown")

func _on_appear_timer_timeout() -> void:
	var hi = get_parent()
	if hi.gameOver == false:
		$AnimationPlayer.play("goDown")

func resetShit():
	var hi = get_parent()
	if chara == "shrilow" and click == true:
		hi.stars -= 1
	chara = "none"
	$AnimationPlayer.play("RESET")
	click = true
