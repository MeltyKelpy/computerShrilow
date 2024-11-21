extends Node2D

var resultt = ""
var starr = 0
var cashh = 0
var cashh2 = ItemValues.money
var allowExiting = false
var countingMoney = false
var toCountTo = 0

func determineResult(result : bool, stars : int, cash : int):
	cashh = cash
	starr = stars
	if result == true:
		resultt = "WIN!"
	if result == false:
		resultt = "LOSE."

func _process(_delta: float) -> void:
	if resultt == "WIN!":
		$resultsscreen/INFO.text = "\n\n\nSTARS:\n"+str(starr)+"/5\n\nMONEY EARNED:\n"
	if resultt == "LOSE.":
		$resultsscreen/INFO.text = "\n\n\nSTARS:\n"+str(starr)+"/5\n\nMONEY LOST:\n"
	if allowExiting == true and Input.is_action_just_pressed("Click"):
		if ItemValues.money >= 0:
			get_tree().paused = false
			$AnimationPlayer.play("leave")
		else:
			ItemValues.money = 0
			get_tree().quit()
	if countingMoney == true:
		if resultt == "WIN!":
			if cashh2 < toCountTo:
				$resultsscreen/INFO2.text = str(cashh)+" + "+str(cashh2)
				cashh2 += 100
				cashh -= 100
			elif cashh == 0:
				allowExit()
		elif resultt == "LOSE.":
			if cashh2 > toCountTo:
				$resultsscreen/INFO2.text = str(cashh)+" - "+str(cashh2)
				cashh2 -= 100
				cashh -= 100
			elif cashh == 0:
				ItemValues.money = toCountTo
				print(ItemValues.money)
				countingMoney = false
				var timer = Timer.new()
				timer.wait_time = 0.2
				timer.one_shot = true
				timer.autostart = true
				timer.connect("timeout", allowExit)
				add_child(timer)

func _kill():
	queue_free()

func _killMiniGame():
	$/root/minigame.queue_free()
	$AnimationPlayer.play("choose")

func _resultsStart():
	$resultsscreen/RESULT.text = resultt
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", infoDisplay)
	add_child(timer)

func infoDisplay():
	if resultt == "WIN!":
		$resultsscreen/Shrilow.texture = load("res://assets/images/events/shrilowReactionGood.png")
	if resultt == "LOSE.":
		$resultsscreen/Shrilow.texture = load("res://assets/images/events/shrilowReactionBad.png")
	$resultsscreen/INFO2.text = str(cashh)
	$resultsscreen/INFO.visible = true
	$resultsscreen/INFO2.visible = true
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", countMoney)
	add_child(timer)

func countMoney():
	if resultt == "WIN!":
		toCountTo = ItemValues.money + cashh
	else:
		toCountTo = ItemValues.money - cashh
	countingMoney = true

func allowExit():
	if resultt == "LOSE.":
		countingMoney = false
		allowExiting = true
		if ItemValues.money < 0:
			$resultsscreen/Shrilow.texture = load("res://assets/images/events/shrilowDead.png")
			$AnimationPlayer.play("die")
			$resultsscreen/broke.text = "YOU'RE A FUCKING BROKIEEEEEEEEEEEEEEEEEEE\n\nthis is game over, loser.\n\nclick anywhere to CLOSE THE GAME. LOSER.\n\nyour DEBT: "+str(ItemValues.money)
	if resultt == "WIN!":
		countingMoney = false
		ItemValues.money = toCountTo
		$resultsscreen/INFO2.visible = false
		$resultsscreen/INFO3.visible = true
		$resultsscreen/INFO3.text = str(ItemValues.money)
		allowExiting = true
		$resultsscreen/EXIT.visible = true
