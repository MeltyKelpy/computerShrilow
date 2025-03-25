extends Node2D

var text = "no text was set\nthat wasnt intended, was it?"
var texture = "trophy"
var achievementID = null

func _ready() -> void:
	$AudioStreamPlayer.play()
	$Notification/Icon.texture = load("res://assets/images/ui/"+texture+"Notification.png")
	$Notification/Icon/Label.text = text

func _process(delta: float) -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	else:
		queue_free()

func _kill():
	queue_free()
