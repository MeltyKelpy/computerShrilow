extends CanvasLayer

var volume = 6

func _process(_delta: float) -> void:
	var sfx_index= AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(sfx_index, ((volume-4)*5)-30)
	if volume == 0:
		AudioServer.set_bus_volume_db(sfx_index, -80)
	
	$VolumeBar.texture = load("res://assets/images/ui/"+str(volume)+".png")
	
	if Input.is_action_just_pressed("volDown"):
		$AnimationPlayer.stop()
		$VolumeBar.position.y = 66
		$retractTimer.stop()
		$retractTimer.start()
		if volume > 0:
			volume -= 1
	if Input.is_action_just_pressed("volUp"):
		$AnimationPlayer.stop()
		$VolumeBar.position.y = 66
		$retractTimer.stop()
		$retractTimer.start()
		if volume < 8:
			volume += 1

func _on_retract_timer_timeout() -> void:
	$AnimationPlayer.play("drop")
