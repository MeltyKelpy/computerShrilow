extends Node2D

func warn(message : String):
	$AnimationPlayer.play("POPUP")
	$eventer/Warning.text = message

func _kill():
	queue_free()
