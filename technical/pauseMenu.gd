extends Node2D

var toolText = [
	"text here pretend theres text here",
	"im feeling goated",
	"do you like my game",
	"bladeninja",
	"The king of curses drained all his efforts and energy because of his opponent who was very strong",
	"make it so that way you can breed the jellies - ghost",
	]
var savePressedTimes = 0

var dying = false

func _ready():
	$AudioStreamPlayer.play()
	$SFXCan.play()
	Interstate.saveData()

func _process(delta: float) -> void:
	
	$save.disabled = (get_node_or_null("/root/computerShrilow") == null)
	if $save.disabled == true:
		$save.add_theme_constant_override("outline_size", 0) 
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	$file.text = "CURRENT FILE: "+config.get_value("Fiscal", "Name")
	
	if dying == false and $AudioStreamPlayer.volume_db < -5:
		$AudioStreamPlayer.volume_db += 1 + (1 * delta)
	elif dying == true and $AudioStreamPlayer.volume_db > -100:
		$AudioStreamPlayer.volume_db -= 1 + (1 * delta)
	else:
		$AudioStreamPlayer.volume_db -= 1 + (1 * delta)
	if not get_node_or_null("/root/computerShrilow") == null:
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	else:
		$file.visible = false
	z_index = 4000
	if Input.is_action_just_pressed("ui_cancel"):
		$AnimationPlayer.play("resume")

func _on_timer_timeout() -> void:
	$tool.text = toolText[randi_range(0, toolText.size()-1)]

func killMenu():
	get_tree().paused = false
	queue_free()

func endMenu():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	queue_free()
	Game.reset()
	Game.reloadGlobals()
	get_tree().paused = false

func _on_back_2_pressed() -> void:
	$AnimationPlayer.play("settingsLeabe")
	Settings.saveData()
	$SFXCan.play()
	$SettingsScene.kill()

func _on_settings_pressed() -> void:
	$SFXPick.play()
	$AnimationPlayer.play("settings")
	Settings.loadData()
	$SettingsScene.spawnSettings()

func _on_menu_pressed() -> void:
	dying = true
	$SFXPick.play()
	$loadingScreen/loading.play("loading")

func _on_resume_pressed() -> void:
	dying = true
	$SFXCan.play()
	$AnimationPlayer.play("resume")

func _on_save_pressed() -> void:
	Game.saveData()
	if savePressedTimes == 0:
		Game.notify("Game has been saved!\nLike, genuinely, you dont need to press it again", "save")
	if savePressedTimes == 1:
		Game.notify("Game has been saved!\nBut, you knew that already.", "save")
	if savePressedTimes > 1:
		Game.notify("alright.", "save")
	savePressedTimes += 1
	DirAccess.make_dir_absolute(Game.scenePaths[Game.curFile])
	$/root/computerShrilow.urWelcomeSaayo()

func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()

func _on_wow_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($VideoStreamPlayer, "modulate", Color(1,1,1,0.3), 2)
