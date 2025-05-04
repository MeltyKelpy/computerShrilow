extends Node2D

@export var side = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	var hi = get_parent()
	if side == 0:
		hi.sideOneScore += 1
	if side == 1:
		hi.sideTwoScore += 1
	$Hop/cheer.play()
	$Hop/CPUParticles2D.emitting = true
