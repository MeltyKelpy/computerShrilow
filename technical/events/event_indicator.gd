extends Node2D

func _process(_delta: float) -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	else:
		queue_free()

func warn(message : String):
	$AnimationPlayer.play("POPUP")
	$eventer/Warning.text = message

func _kill():
	queue_free()
