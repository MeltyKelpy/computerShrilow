extends CanvasLayer

var moneyLost
var exitAllowed = false

func _ready() -> void:
	reparent($/root)
	get_tree().paused = true
	moneyLost = 600 + (ItemValues.maxMoney / 100)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and exitAllowed == true:
		FizzyDrink.health = 100
		get_tree().paused = false
		ItemValues.money -= moneyLost
		Interstate.totallost -= moneyLost
		$AnimationPlayer.play("new_animation_2")

func calcCost():
	$Label2.text = "Revive Cost:\n"+str(moneyLost)
	$lose.play()

func allowExit():
	exitAllowed = true

func kill():
	queue_free()
