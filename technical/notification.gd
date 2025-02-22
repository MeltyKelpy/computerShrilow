extends Node2D

var text = "no text was set\nthat wasnt intended, was it?"
var texture = "trophy"
var achievementID = null

func _ready() -> void:
	$Notification/Icon.texture = load("res://assets/images/ui/"+texture+"Notification.png")
	$Notification/Icon/Label.text = text
