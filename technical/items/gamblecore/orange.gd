extends Node2D

func _ready() -> void:
	await get_tree().create_timer(1.5).timeout
	Game.warn("orange")
	$AnimationPlayer.play("orange")
	Interstate._orangeify()

func _process(delta: float) -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	else:
		queue_free()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()

func getID(id):
	pass
