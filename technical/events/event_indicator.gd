extends Node2D

func _process(_delta: float) -> void:
	position.x = $/root/computerShrilow/Camera2D.position.x - 576
	position.y = $/root/computerShrilow/Camera2D.position.y - 324

func warn(message : String):
	$AnimationPlayer.play("POPUP")
	$eventer/Warning.text = message

func _kill():
	queue_free()
