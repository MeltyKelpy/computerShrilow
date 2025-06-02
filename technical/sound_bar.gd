extends CanvasLayer

var volume = 1

func _process(_delta: float) -> void:
	var vol_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(vol_index, ((volume-4)*5)-10)
	
	var mus_index = AudioServer.get_bus_index("Music")
	if (Settings.settings[Settings.get_setting("musicVolume")]["value"]) != 0:
		AudioServer.set_bus_volume_db(mus_index, ((Settings.settings[Settings.get_setting("musicVolume")]["value"]-4)*5)-10)
	else:
		AudioServer.set_bus_volume_db(mus_index, -80)
	
	var sfx_index = AudioServer.get_bus_index("SFX")
	if (Settings.settings[Settings.get_setting("sfxVolume")]["value"]) != 0:
		AudioServer.set_bus_volume_db(sfx_index, ((Settings.settings[Settings.get_setting("sfxVolume")]["value"]-4)*5)-10)
	else:
		AudioServer.set_bus_volume_db(sfx_index, -80)
	
	var ts_index = AudioServer.get_bus_index("TalkSounds")
	if (Settings.settings[Settings.get_setting("tsVolume")]["value"]) != 0:
		AudioServer.set_bus_volume_db(ts_index, ((Settings.settings[Settings.get_setting("tsVolume")]["value"]-4)*5)-10)
	else:
		AudioServer.set_bus_volume_db(ts_index, -80)
	
	if Settings.settings[Settings.get_setting("masterVolume")]["value"] == 0:
		AudioServer.set_bus_volume_db(vol_index, -80)
	
	$VolumeBar.texture = load("res://assets/images/ui/"+str(int(volume))+".png")
	
	if Input.is_action_just_pressed("volDown"):
		$AnimationPlayer.stop()
		$VolumeBar.position.y = 66
		$retractTimer.stop()
		$retractTimer.start()
		Settings.settings[Settings.get_setting("masterVolume")]["value"] = volume
		Settings.saveData()
		if volume > 0:
			volume -= 1
	if Input.is_action_just_pressed("volUp"):
		$AnimationPlayer.stop()
		$VolumeBar.position.y = 66
		$retractTimer.stop()
		$retractTimer.start()
		if volume < 8:
			volume += 1
		Settings.settings[Settings.get_setting("masterVolume")]["value"] = volume
		Settings.saveData()

func _on_retract_timer_timeout() -> void:
	$AnimationPlayer.play("drop")
