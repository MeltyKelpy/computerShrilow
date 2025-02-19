extends TextureRect

var timerName = "NULL:3"
var specialClockType = "not"

func create(namer, time, type):
	specialClockType = type
	timerName = namer
	$Timer.wait_time = time
	$Timer.start()
	reparent($/root/computerShrilow/ShrilowScreen/clocks)

func _process(delta: float) -> void:
	if specialClockType == "not":
		$Time.text = str(timerName+"\n")+str(round($Timer.time_left))
	elif specialClockType == "antivirus":
		$Time.text = str(timerName+"\n")+str(round($Timer.time_left))
		if FizzyDrink.riggedElection != 0:
			var timeee = $Timer.time_left + FizzyDrink.riggedElection
			$Timer.stop()
			$Timer.start(timeee)
			FizzyDrink.riggedElection = 0

func _on_timer_timeout() -> void:
	queue_free()
