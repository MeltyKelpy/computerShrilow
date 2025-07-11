extends Node2D

@onready var amount_of_slides = $slides.get_child_count()
var curSlide = 0

var slideAttributes = {
	0:["animated", false],
	1:["animated", false],
	2:["animated", false, false],
	3:["animated", false],
	4:["animated", false],
	6:["animated", false],
	7:["animated", false],
	8:["animated", false],
	9:["animated", false],
	10:["animated", false],
	11:["animated", false],
	12:["animated", false],
	13:["animated", false],
	14:["animated", false],
	15:["animated", false],
	16:["animated", false],
	17:["animated", false],
	18:["animated", false],
	19:["animated", false],
	20:["animated", false],
	22:["animated", false],
	23:["animated", false],
	24:["animated", false],
	}

var canInteractWithSlide = false

func _ready() -> void:
	Interstate.tutorialDone = true
	Interstate.saveData()
	$covah.visible = true
	$pageNum.text = ""
	for i in $slides.get_children():
		i.visible = false

func _animated_slide_handling(slide):
	
	canInteractWithSlide = false
	
	slideAttributes[slide][1] = true
	
	match slide:
		0:
			await get_tree().create_timer(1).timeout
			$"slides/0/Title".visible = true
			await get_tree().create_timer(2.5).timeout
			$"slides/0/Subtitle".visible = true
			await get_tree().create_timer(3).timeout
			$"slides/0/AltText".visible = true
			_exist_the_lows()
		1:
			await get_tree().create_timer(1).timeout
			$"slides/1/Title".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/1/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			var tween = create_tween()
			tween.tween_property($"slides/1/img", "rotation_degrees", 0, 1).set_trans(Tween.TRANS_QUART)
			var tween2 = create_tween()
			tween2.tween_property($"slides/1/img", "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_QUART)
			await get_tree().create_timer(2).timeout
			$"slides/1/Subtitle2".visible = true
			await get_tree().create_timer(1).timeout
			_exist_the_lows()
		2:
			await get_tree().create_timer(1).timeout
			$"slides/2/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/2/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/2/Subtitle3".visible = true
			var tween = create_tween()
			tween.tween_property($"slides/2/shrilowNode", "position", Vector2(575,648), 1).set_trans(Tween.TRANS_QUART)
			await get_tree().create_timer(2).timeout
			$"slides/2/Subtitle4".visible = true
			canInteractWithSlide = true
		3:
			await get_tree().create_timer(1).timeout
			$"slides/3/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/3/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$sfx.stream = load("res://assets/sounds/poppeer.ogg")
			$sfx.play()
			$"slides/3/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/3/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		4:
			await get_tree().create_timer(1).timeout
			$"slides/4/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/4/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/4/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/4/Subtitle4".visible = true
			await get_tree().create_timer(3).timeout
			$"slides/4/Subtitle5".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/4/Subtitle6".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		6:
			await get_tree().create_timer(1).timeout
			$"slides/6/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$sfx.stream = load("res://assets/sounds/poppeer.ogg")
			$sfx.play()
			$"slides/6/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/6/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		7:
			await get_tree().create_timer(1).timeout
			$"slides/7/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/7/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/7/Subtitle3".visible = true
			await get_tree().create_timer(1).timeout
			var tween = create_tween()
			tween.tween_property($"slides/7/Melanie", "position", Vector2(576.0,324.0), 1).set_trans(Tween.TRANS_QUART)
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		8:
			await get_tree().create_timer(1).timeout
			$"slides/8/Title".visible = true
			var tween = create_tween()
			tween.tween_property($"slides/8/shit", "position", Vector2(-3.0,-10), 1).set_trans(Tween.TRANS_QUART)
			var tween2 = create_tween()
			tween2.tween_property($"slides/8/shit", "modulate", Color(1,1,1,1), 0.8).set_trans(Tween.TRANS_QUART)
			tween.tween_property($"slides/8/shit2", "position", Vector2(-3.0,-10), 1).set_trans(Tween.TRANS_QUART)
			tween2.tween_property($"slides/8/shit2", "modulate", Color(1,1,1,1), 0.8).set_trans(Tween.TRANS_QUART)
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		9:
			await get_tree().create_timer(1).timeout
			$"slides/9/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$sfx.stream = load("res://assets/sounds/poppeer.ogg")
			$sfx.play()
			$"slides/9/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/9/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		10:
			await get_tree().create_timer(1).timeout
			$"slides/10/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/10/noteboo".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/10/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		11:
			await get_tree().create_timer(1).timeout
			$"slides/11/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/11/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		12:
			await get_tree().create_timer(1).timeout
			$"slides/12/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$sfx.stream = load("res://assets/sounds/poppeer.ogg")
			$sfx.play()
			$"slides/12/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/12/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/12/AltText".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		13:
			await get_tree().create_timer(1).timeout
			$"slides/13/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/13/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/13/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/13/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		14:
			await get_tree().create_timer(1).timeout
			$"slides/14/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/14/img".visible = true
			$"slides/14/Timer".start()
			await get_tree().create_timer(2).timeout
			$"slides/14/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/14/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/14/img2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/14/Subtitle4".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/14/Subtitle5".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		15:
			await get_tree().create_timer(1).timeout
			$"slides/15/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/15/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/15/AltText".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/15/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/15/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/15/Subtitle4".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		16:
			await get_tree().create_timer(1).timeout
			$"slides/16/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$sfx.stream = load("res://assets/sounds/poppeer.ogg")
			$sfx.play()
			$"slides/16/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/16/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/16/AltText".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		17:
			await get_tree().create_timer(1).timeout
			$"slides/17/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/img2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/Subtitle4".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/17/AltText".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		18:
			await get_tree().create_timer(1).timeout
			$"slides/18/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/18/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/18/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/18/AltText".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		19:
			await get_tree().create_timer(1).timeout
			$"slides/19/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/19/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/19/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/19/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/19/Subtitle4".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		20:
			await get_tree().create_timer(1).timeout
			$"slides/20/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/20/tvBack".visible = true
			$"slides/20/img".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/20/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/20/AltText".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/20/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/20/img2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		22:
			await get_tree().create_timer(1).timeout
			$"slides/22/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/22/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_exist_the_lows()
		23:
			await get_tree().create_timer(1).timeout
			$"slides/23/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/23/Subtitle3".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/23/Subtitle2".visible = true
			await get_tree().create_timer(2).timeout
			_slide_swap(1)
		24:
			$pageNum.visible = false
			$music.stop()
			$"slides/24/ColorRect3".visible = true
			$"slides/24/Subtitle".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/24/AnimationPlayer".play("popout")

func _exist_the_lows():
	var tween = create_tween()
	tween.tween_property($TheLows, "position", Vector2(0,0), 0.75).set_trans(Tween.TRANS_QUART)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		var cacapoopyGOD2 = preload("res://technical/pauseMenu.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		caca.reparent($/root)
		get_tree().paused = true
	
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()
	
	if $"slides/2/shrilowNode".scale.x > 1:
		$"slides/2/shrilowNode".scale.x -= 0.05
	if $"slides/2/shrilowNode".scale.x < 1:
		$"slides/2/shrilowNode".scale.x += 0.05
	if $"slides/2/shrilowNode".scale.y < 1:
		$"slides/2/shrilowNode".scale.y += 0.05
	if $"slides/2/shrilowNode".scale.y > 1:
		$"slides/2/shrilowNode".scale.y -= 0.05

func _slide_swap(amount):
	var prevSlide = curSlide
	
	curSlide += amount
	if curSlide < 0:
		curSlide = 0
	if curSlide > amount_of_slides-1:
		curSlide = amount_of_slides-1
	
	$"slides/21/Jelly".visible = (curSlide == 21)
	
	if not prevSlide == curSlide:
		$sfx.stream = load("res://assets/sounds/projecterclick.ogg")
		$sfx.play()
	
	$pageNum.visible = true
	$pageNum.text = str(curSlide+1)
	for i in $slides.get_children():
		i.visible = false
	var currentSlideNode = $slides.get_node(str(curSlide))
	currentSlideNode.visible = true
	
	if not slideAttributes.has(curSlide):
		slideAttributes[curSlide] = ["non-animated", true]
	
	if slideAttributes[curSlide][0] == "animated" and slideAttributes[curSlide][1] == false:
		$TheLows.position.y = 122.0
		_animated_slide_handling(curSlide)
	else:
		_exist_the_lows()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	_slide_swap(0)
	$projecterhum.play()
	await get_tree().create_timer(1).timeout
	$music.play()

func slideInteraction(interaction: String) -> void:
	if interaction == "clickShrilow" and canInteractWithSlide == true:
		$"slides/2/shrilowNode/Shrilow/Squeak".play()
		$"slides/2/shrilowNode".scale.x = 1.2
		$"slides/2/shrilowNode".scale.y = 0.85
		$"slides/2/shrilowNode/Shrilow".texture = load("res://assets/images/computershrilows/shrilowBases/shrilowBase-clicked.png")
		$"slides/2/shrilowNode/Shrilow/ShrilowFace".visible = false
		$"slides/2/shrilowNode/Shrilow/faceRevert".start()
		if slideAttributes[2][2] == false:
			slideAttributes[2][2] = true
			$"slides/2/Subtitle".visible = false
			$"slides/2/Subtitle2".visible = false
			$"slides/2/Subtitle3".visible = false
			$"slides/2/Subtitle4".visible = false
			$"slides/2/Subtitle5".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/2/Subtitle6".visible = true
			await get_tree().create_timer(2).timeout
			$"slides/2/Subtitle7".visible = true
			await get_tree().create_timer(3).timeout
			_exist_the_lows()

func _on_face_revert_timeout() -> void:
	$"slides/2/shrilowNode/Shrilow".texture = load("res://assets/images/computershrilows/shrilowBases/shrilowBase.png")
	$"slides/2/shrilowNode/Shrilow/ShrilowFace".visible = true

func _on_timer_timeout() -> void:
	$"slides/14/img".texture = load("res://assets/images/areas/mines/Shrilow1.png")
	$"slides/14/Timer2".start()

func _on_timer_2_timeout() -> void:
	$"slides/14/img".texture = load("res://assets/images/areas/mines/Shrilow0.png")
	$"slides/14/Timer".start()

func _on_sfx_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
