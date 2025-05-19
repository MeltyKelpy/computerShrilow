extends Node2D

var flyers = {
	"electionflyer":{
	"Header":"Odd Flyer",
	"Body":"A Flyer, talks about an upcoming election featuring QuickTime-Event and.. LGE? whoever that is.\n\njust another thing you gotta worry about, i suppose.\n\nWhy are they holding an election? didnt QTE already claim they 'owned our stupid computer asses'?",
	"ImgKey":"res://assets/images/events/laws/election/flyer1.png",
	},
	}

var can = false

func _ready() -> void:
	get_tree().paused = true

func _process(delta: float) -> void:
	if can == true and Input.is_action_just_pressed("Click"):
		get_tree().paused = false
		$AnimationPlayer.play("depop")

func _load(flyer):
	$Head.text = flyers[flyer]["Header"]
	$Body.text = flyers[flyer]["Body"]
	$Flyer.texture = load(flyers[flyer]["ImgKey"])

func _load_can():
	can = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "depop":
		queue_free()
