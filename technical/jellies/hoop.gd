extends Node2D

@export var side = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hello. its me., the computer")
	$Hop/cheer.play()
	$Hop/CPUParticles2D.emitting = true
