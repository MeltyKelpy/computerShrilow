extends TextureRect

var timerName = "NULL:3"
var specialClockType = "not"
var hours = 0
var minutes = 0
var seconds = 0
var time_dict = {"H" : 0, "M" : 0, "S" : 0}

func create(namer, _time, type):
	specialClockType = type
	timerName = namer
	reparent($/root/computerShrilow/ShrilowScreen/clocks)

func _process(delta: float) -> void:
	var time = round($Timer.time_left)
	time_dict = {"H" : 0, "M" : 0, "S" : 0}
	while time >= 60:
		time -= 60
		time_dict["M"] += 1
		time_dict["S"] = time
	while time_dict["M"] >= 60:
		time_dict["M"] -= 60
		time_dict["H"] += 1
	var finH
	if time_dict["H"] < 10:
		finH = "0"+str(time_dict["H"])
	else:
		finH = time_dict["H"]
	var finM
	if time_dict["M"] < 10:
		finM = "0"+str(time_dict["M"])
	else:
		finM = time_dict["M"]
	var finS
	if time_dict["S"] < 10:
		finS = "0"+str(time_dict["S"])
	else:
		finS = time_dict["S"]
	var final = str(finH) + ":" + str(finM) + ":" + str(finS)
	
	$Time.text = str(timerName+"\n")+str(final)
	if specialClockType == "antivirus":
		if FizzyDrink.riggedElection != 0:
			var timeee = $Timer.time_left + FizzyDrink.riggedElection
			$Timer.stop()
			$Timer.start(timeee)
			FizzyDrink.riggedElection = 0

func _on_timer_timeout() -> void:
	queue_free()
