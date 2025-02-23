extends Node2D

var text = "no text was set\nthat wasnt intended, was it?"
var texture = "trophy"
var achievementID = null

func _ready() -> void:
	$AudioStreamPlayer.play()
	$Notification/Icon.texture = load("res://assets/images/ui/"+texture+"Notification.png")
	$Notification/Icon/Label.text = text

func _kill():
	queue_free()
