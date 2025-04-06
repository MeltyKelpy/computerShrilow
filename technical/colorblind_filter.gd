extends ColorRect

func _process(delta: float) -> void:
	$ColorRect2.visible = (Settings.settings[Settings.get_setting("colorblindness")]["selectionNum"] > 0) and (Settings.settings[Settings.get_setting("colorblindness")]["selectionNum"] < 4)
	$ColorRect3.visible = Settings.settings[Settings.get_setting("colorblindness")]["selectionNum"] == 4
	$ColorRect2.material.set_shader_parameter("mode", Settings.settings[Settings.get_setting("colorblindness")]["selection"])
	
	if get_node_or_null(^"/root/computerShrilow"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
