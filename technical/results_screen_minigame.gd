extends Node2D

var resultt = ""
var starr = 0
var cashh = 0
var cashh2 = ItemValues.money
var allowExiting = false
var countingMoney = false
var toCountTo = 0
var baseMoney

func _ready():
	$AnimationPlayer.play("animation")
	baseMoney = ItemValues.money

func determineResult(result : bool, stars : int, cash : int):
	cashh = cash
	starr = stars
	if result == true:
		resultt = "WIN!"
	if result == false:
		resultt = "LOSE."

func _process(_delta: float) -> void:
	if allowExiting == true and Input.is_action_just_pressed("Click"):
		get_tree().paused = false
		$AnimationPlayer.play("leave")
	if countingMoney == true:
		if resultt == "WIN!":
			if cashh <= 20 or Input.is_action_just_pressed("Click"):
				cashh2 = toCountTo
				cashh = 0
				allowExit()
			if cashh2 < toCountTo:
				$resultsscreen/INFO2.text = str(Game.commizeNumber(int(cashh2)))+" + "+str(Game.commizeNumber(int(cashh)))
				cashh2 += 15
				cashh -= 15
			else:
				allowExit()
		elif resultt == "LOSE.":
			if cashh <= 20 or Input.is_action_just_pressed("Click"):
				cashh2 = toCountTo
				cashh = 0
				allowExit()
			if cashh2 > toCountTo:
				$resultsscreen/INFO2.text = str(Game.commizeNumber(int(cashh2)))+" - "+str(Game.commizeNumber(int(cashh)))
				cashh2 -= 15
				cashh -= 15

func _kill():
	queue_free()

func _killMiniGame():
	$resultsscreen/AudioStreamPlayer.play()
	$AnimationPlayer.play("choose")
	$/root/minigame.queue_free()

func _resultsStart():
	if resultt == "WIN!":
		$resultsscreen/cheer.play()
		$resultsscreen/popper.play()
		$resultsscreen/INFO.text = "\n\n\nSTARS:\n"+str(starr)+"/5\n\nMONEY EARNED:\n"
	if resultt == "LOSE.":
		$resultsscreen/lose.play()
		$resultsscreen/INFO.text = "\n\n\nSTARS:\n"+str(starr)+"/5\n\nMONEY LOST:\n"
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
	if resultt == "LOSE.":
		toCountTo = ItemValues.money - cashh
	countingMoney = true

func allowExit():
	$/root/computerShrilow.visible = true
	$resultsscreen/INFO.text = "\n\n\nSTARS:\n"+str(starr)+"/5\n\nTOTAL MONEY:\n"
	$/root/computerShrilow/Camera2D.position.x = $/root/computerShrilow.returnPosCamX
	$/root/computerShrilow/Camera2D.position.y = $/root/computerShrilow.returnPosCamY
	position.x = $/root/computerShrilow.returnPosCamX - 576
	position.y = $/root/computerShrilow.returnPosCamY - 324
	$/root/computerShrilow.visible = true
	if resultt == "LOSE.":
		countingMoney = false
		allowExiting = true
		ItemValues.money = toCountTo
		$resultsscreen/INFO2.visible = false
		$resultsscreen/INFO3.visible = true
		$resultsscreen/INFO3.text = str(Game.commizeNumber(ItemValues.money))
		$resultsscreen/EXIT.visible = true
		if ItemValues.money < 0 and baseMoney < ItemValues.money:
			$resultsscreen/Shrilow.texture = load("res://assets/images/events/shrilowDead.png")
			$AnimationPlayer.play("die")
			$resultsscreen/broke.text = "YOU'RE A FUCKING BROKIEEEEEEEEEEEEEEEEEEE\nclick to go back to your DEBT FILLED LIFE.\n\nloser.\n\nyour DEBT: "+str(Game.commizeNumber(ItemValues.money))
	if resultt == "WIN!":
		countingMoney = false
		ItemValues.money = toCountTo
		$resultsscreen/INFO2.visible = false
		$resultsscreen/INFO3.visible = true
		$resultsscreen/INFO3.text = str(ItemValues.money)
		allowExiting = true
		$resultsscreen/EXIT.visible = true
