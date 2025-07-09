extends Node3D

var amount_of_levers = 0
var progress = -1
var anim_played = false
var anim_played2 = true

func _process(delta: float) -> void:
	if amount_of_levers > 0 and progress == -1:
		progress = 0
	
	if amount_of_levers == progress and anim_played == false:
		anim_played = true
		anim_played2 = false
		$AnimationPlayer.play("open")
	elif amount_of_levers != progress and anim_played2 == false:
		anim_played = false
		anim_played2 = true
		$AnimationPlayer.play("close")
