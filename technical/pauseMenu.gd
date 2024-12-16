extends Node2D

var toolText = [
	"text here pretend theres text here",
	"im feeling goated",
	"do you like my game",
	]

func _process(delta: float) -> void:
	z_index = 4096
	if Input.is_action_just_pressed("ui_cancel"):
		$AnimationPlayer.play("resume")

func _on_timer_timeout() -> void:
	$tool.text = toolText[randi_range(0, toolText.size()-1)]

func killMenu():
	get_tree().paused = false
	queue_free()

func endMenu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	queue_free()

func _on_back_2_pressed() -> void:
	$AnimationPlayer.play("settingsLeabe")
	Settings.saveData()
	$SettingsScene.kill()

func _on_settings_pressed() -> void:
	$AnimationPlayer.play("settings")
	Settings.loadData()
	$SettingsScene.spawnSettings()

func _on_menu_pressed() -> void:
	$loadingScreen/loading.play("loading")

func _on_resume_pressed() -> void:
	$AnimationPlayer.play("resume")
