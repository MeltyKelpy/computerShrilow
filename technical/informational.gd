extends Node2D

var text = "whoops! no text inputted. sorry!!!!\n\nif you see this message ever, you've encountered a major bug. please report it to me! (disc: meltykelpy) or put it in the discord server."
var can = false

func _ready() -> void:
	get_tree().paused = true
	$Control/icon2/Label.text = text

func _process(delta: float) -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	else:
		queue_free()
	if can == true and Input.is_action_just_pressed("Click"):
		$AnimationPlayer.play("unpop")
		await get_tree().create_timer(1).timeout
		get_tree().paused = false
		queue_free()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "pop":
		await get_tree().create_timer(1).timeout
		can = true
