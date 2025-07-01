extends Node2D

var scene = "test"
var talker = ""
var dialogue_progress = -1
var can_prog = false
var processing = false
var waiting_on_finish = false
var dialogue_speed = 0.015

func _scene_management():
	can_prog = false
	
	match scene:
		"test":
			match dialogue_progress:
				-1:
					$ui/icon.texture = load("res://assets/images/ui/diacons/cultistlookingah.png")
				0:
					set_dialogue("Phantom", "hi", "PhantomIcon")
					can_prog = true
				1:
					set_dialogue("???", "hi there btw", "cultistlookingah")
		"market_intro":
			match dialogue_progress:
				-1:
					$colorbg.visible = true
					dialogue_speed = 0.025
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanominous.png")
					$ground/character.modulate = Color(1,1,1,0)
					$ground/character2.texture = load("res://assets/images/areas/blackMarket/opening cutscene/antag.png")
					$ground/character2.position.x = 335.0
					$ui/icon.texture = load("res://assets/images/ui/diacons/cultistlookingah.png")
					var tween = create_tween()
					tween.tween_property($ground/character, "modulate", Color(1,1,1,1), 1)
					await get_tree().create_timer(1.5).timeout
					$AnimationPlayer.play("spawn")
				0:
					set_dialogue("???", "greetings traveller. welcome to my market.", "cultistlookingah")
					can_prog = true
				1:
					set_dialogue("???", "a market, free of QuickTime-Event.. a market free of control.", "cultistlookingah")
					can_prog = true
				2:
					set_dialogue("???", "a market free to use, for all those who wish to use it...", "cultistlookingah")
					can_prog = true
				3:
					set_dialogue("???", "we provide many things that could prove useful to you... such as", "cultistlookingah")
					waiting_on_finish = true
				4:
					dialogue_speed = 0.015
					$sfx.stream = load("res://assets/sounds/lightswitch.ogg")
					$sfx.play()
					set_dialogue("", "  ", "blank")
					await get_tree().create_timer(0.1).timeout
					$colorbg.visible = false
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanshock.png")
					await get_tree().create_timer(2).timeout
					set_dialogue("Antag", "Phantom. what're you doing?", "AntagIcon")
					can_prog = true
				5:
					set_dialogue("", "  ", "blank")
					var tween = create_tween()
					tween.tween_property($ground, "position", Vector2(259,648.0), 3)
					await get_tree().create_timer(3.5).timeout
					set_dialogue("Antag", "Whatever you're doing, its weird. stop it.", "AntagIcon")
					can_prog = true
				6:
					set_dialogue("Phantom", "  ", "PhantomIcon")
					await get_tree().create_timer(2).timeout
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phandying.png")
					dialogue_speed = 0.05
					set_dialogue("Phantom", "god.", "PhantomIcon")
					$ui/talk.visible_characters = 9
					can_prog = true
				7:
					dialogue_speed = 0.01
					set_dialogue("Phantom", "Well, i WAS doing something. until you.", "PhantomIcon")
					can_prog = true
				8:
					dialogue_speed = 0.01
					set_dialogue("Phantom", "RUINED IT", "PhantomIcon")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell0.png")
					can_prog = true
				9:
					dialogue_speed = 0.01
					set_dialogue("Phantom", "This was supposed to be cool intrigue! they were gonna think 'this shop is so freaking cool i loved the opening phantom did!'", "PhantomIcon")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell1.png")
					can_prog = true
				10:
					dialogue_speed = 0.01
					set_dialogue("Phantom", "but you went and RUINED IT ALL", "PhantomIcon")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell0.png")
					can_prog = true
				11:
					dialogue_speed = 0.015
					set_dialogue("Antag", " ", "AntagIcon")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell1.png")
					await get_tree().create_timer(2).timeout
					$ground/character2.texture = load("res://assets/images/areas/blackMarket/opening cutscene/antagstare.png")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanbewildered.png")
					set_dialogue("Antag", "phantom that whole thing was extremely corny.", "AntagIcon")
					await get_tree().create_timer(1.5).timeout
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell0.png")
					set_dialogue("Phantom", "WELL YOU DONT KNOW GOOD WRITING.", "PhantomIcon")
					await get_tree().create_timer(1.5).timeout
					$ground/character2.texture = load("res://assets/images/areas/blackMarket/opening cutscene/antag.png")
					set_dialogue("Antag", "okay phantom.", "AntagIcon")
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanyell1.png")
					can_prog = true
				12:
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phanbewildered.png")
					set_dialogue("Antag", "i'm gonna go back into the shop, just direct them in there, please.", "AntagIcon")
					can_prog = true
				13:
					set_dialogue("Phantom", "...okay", "PhantomIcon")
					can_prog = true
				14:
					set_dialogue("Phantom", " ", "PhantomIcon")
					var tween = create_tween()
					tween.tween_property($ground/character2, "scale", Vector2(0,0), 1.2).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
					var tween2 = create_tween()
					tween2.tween_property($ground/character2, "modulate", Color(1,1,1,0), 1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
					await get_tree().create_timer(0.8).timeout
					var tween3 = create_tween()
					tween3.tween_property($ground, "position", Vector2(584.0,648.0), 2)
					await get_tree().create_timer(2).timeout
					$sfx.stream = load("res://assets/sounds/whipcrack.ogg")
					$sfx.play()
					$ground/character.texture = load("res://assets/images/areas/blackMarket/opening cutscene/phansmile.png")
					await get_tree().create_timer(0.4).timeout
					set_dialogue("Phantom", "you should come to our black market you should come to our black market you should come to our black market you should come to our black market", "PhantomIcon")
					can_prog = true
				15:
					set_dialogue("Phantom", "We can keep talking there! because if you click me, you can talk to me!", "PhantomIcon")
					can_prog = true
				16:
					set_dialogue("Phantom", "please talk to me", "PhantomIcon")
					can_prog = true
				17:
					end_dialogue()
					if get_node_or_null("/root/computerShrilow"):
						$/root/computerShrilow.start_black_market()
						$Panel.visible = false

func end_dialogue():
	$AudioStreamPlayer.play()
	var tween3 = create_tween()
	tween3.tween_property(self, "modulate", Color(1,1,1,0), 0.35).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
	var tween1 = create_tween()
	tween1.tween_property($ground, "scale", Vector2(0,0), 0.4).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
	var tween2 = create_tween()
	tween2.tween_property($ui, "scale", Vector2(0,0), 0.4).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
	await get_tree().create_timer(0.4).timeout
	queue_free()

func _ready() -> void:
	_scene_management()

func _process(delta: float) -> void:
	
	if talker == "Antag":
		$talk.pitch_scale = 0.5
	else:
		$talk.pitch_scale = 1
	
	if can_prog == true and Input.is_action_just_pressed("Click"):
		if $ui/talk.visible_ratio < 1:
			$ui/talk.visible_ratio = 1
		else:
			dialogue_progress += 1
			_scene_management()
	
	if $ui/talk.visible_ratio < 1 and processing == false:
		processing = true
		await get_tree().create_timer(dialogue_speed).timeout
		$ui/talk.visible_characters += 1
		if $ui/talk.visible_ratio < 0.95:
			$talk.play()
		else:
			dialogue_ended()
		processing = false

func dialogue_ended():
	if waiting_on_finish:
		dialogue_progress += 1
		_scene_management()
		waiting_on_finish = false

func set_dialogue(talkerhi : String, text : String, icon : String):
	$ui/talk.visible_ratio = 0
	talker = talkerhi
	var directory = "res://assets/images/ui/diacons/"
	if icon == "AntagIcon" or icon == "PhantomIcon":
		directory = "res://assets/images/areas/blackMarket/market/anphan/"
	if talkerhi != "":
		$ui/talk.text = talker+": "+text
	else:
		$ui/talk.text = text
	$ui/icon.texture = load(directory+icon+".png")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "spawn":
		await get_tree().create_timer(1).timeout
		dialogue_progress += 1
		_scene_management()
