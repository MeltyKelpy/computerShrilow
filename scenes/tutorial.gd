extends Node2D

func _process(delta: float) -> void:
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5
	
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($vlc/Label, "modulate", Color(1,1,1,1), 1)

func _on_timer_2_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($vlc/Label2, "modulate", Color(1,1,1,1), 1)

func begin() -> void:
	$vlc.visible = false
	$AudioStreamPlayer.play()

func killIntro():
	$Camera2D/intro.queue_free()
