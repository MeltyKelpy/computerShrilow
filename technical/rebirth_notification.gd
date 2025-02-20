extends Node2D

var living = true
var can = false

func _ready():
	get_tree().paused = true

func _process(_delta: float) -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		position.x = -576
		position.y = -324
	else:
		queue_free()
	
	$PopUp/Desc.text = "You have reached "+str(1000000 + (1000000 * Game.rebirths))+" Dollars, this means you are now able to REBIRTH.\n\nThe option has been presented to you. Click the cross above Shrilow to REBIRTH. Once you have done so, you will lose all progress (Excluding your Jelly Journal, File Playtime, and anything else specified you'll keep.) \n\nHOWEVER, you will be able to access more things to make you gain money EVEN faster.\nYou May REBIRTH, If you so wish."
	
	if living == true:
		if $mus.volume_db < 1:
			$mus.volume_db += 1 + (_delta * 1)
	else:
		if $mus.volume_db > -100:
			$mus.volume_db -= 1 + (_delta * 1)
	
	if can == true and Input.is_action_just_pressed("Click"):
		$AnimationPlayer.play("unpop")
		living = false
		can = false

func _kill():
	get_tree().paused = false
	queue_free()

func _can():
	can = true
