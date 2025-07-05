extends Node2D


#shrilow dont get killed in traffic simulator

#use arrow keys to change lanes, dodge massive trucks kill you
var lane = 2

var mybellyisready:bool = false
@export var goforth:bool = false

var readyy: bool = false

#TODO just marked todo so youd have an easier time seeing this melty
#so basically all you gotta do is start up the machine https://www.youtube.com/watch?v=VNdIvPb196s



func _ready() -> void:
	#placeholder in the array melty u can mess with it however u need to
	Events.justMinigames[5]["Played?"] = true
	$AnimationPlayer.play("pop")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and goforth == true:
		mybellyisready = true

#makes it so that when the player presses enter it waits until the next loop to stay on beat
func _on_prelude_finished() -> void:
	if mybellyisready == true:
		$songe.play()
		$CanvasLayer3/open/prelude.stop()
	else:
		$CanvasLayer3/open/prelude.play()

func _allowToMove():
	readyy = true
