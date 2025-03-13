extends Node2D

var recievedTokens = 0

var prog = 1
var canProg = false

var lines = {
	0:["","BOOO"],
	#0:[
		#"",
		#"The world suddenly dissolves, it encapsulates your soul.",
		#"Your history is to be erased, gone from the records.",
		#"You will be, reborn.",
		#"But, thats corny, isnt it?",
		#"I'll be honest, I wasnt expecting you to get here so fast.",
		#"So, forgive me.",
		#"hm... tell you what.",
		#"Come find me again, and i'll have something ready this time! promise.",
		#"Dont keep me waiting...",
		#"-QT.E",
		#],
	1:["","BOOO"],
		#"",
		#"Hello again.",
		#"Good to see that you made it!",
		#"I see you are more dedicated than the rest.",
		#"I wasn't expecting it, but my my, you've truly impressed me.",
		#"So, i'd say its about time I made my entrance.",
		#"Introducing to you.",
		#"The One!",
		#"The Only!",
		#"QuickTime Event!",
		#],
	2:[
		"",
		"welcome back!",
		],
	}

var dialog = 0

func _ready() -> void:
	if FizzyDrink.jellys == null:
		FizzyDrink.jellys = 0
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	if FizzyDrink.clickPower == null:
		FizzyDrink.clickPower = 0
	if FizzyDrink.AUTOclickPower == null:
		FizzyDrink.AUTOclickPower = 0
	recievedTokens = 10 + ((FizzyDrink.jellys / 10) + (FizzyDrink.clicks / 1000) + (FizzyDrink.clickPower / 150) + (FizzyDrink.AUTOclickPower / 150) + (FizzyDrink.amountOfRooms / 10))
	recievedTokens = round(recievedTokens)
	$Label2.text = "You have Recieved "+str(recievedTokens)+" Tokens. Dont go spending it all in one place, now!"

func _startDialog():
	$AnimationPlayer.play("beamLoop")
	if Game.rebirths <= 2:
		dialog = Game.rebirths
		$Label.text = lines[Game.rebirths][prog]
	else:
		dialog = 2
		$Label.text = lines[2][prog]
	var tween = get_tree().create_tween()
	tween.tween_property($Label, "modulate", Color(1,1,1,1), 1.5)
	canProg = true
	$Timer2.start()

func _process(delta: float) -> void:
	if canProg == true:
		if Input.is_action_just_pressed("Click"):
			if $Timer2.is_stopped() == false:
				$Timer2.stop()
			canProg = false
			var tween = get_tree().create_tween()
			tween.tween_property($Label, "modulate", Color(1,1,1,0), 1.5)
			await get_tree().create_timer(1.5).timeout
			if lines[dialog].size()-1 >= prog+1:
				prog += 1
				$Label.text = lines[dialog][prog]
				var tween2 = get_tree().create_tween()
				tween2.tween_property($Label, "modulate", Color(1,1,1,1), 1.5)
				await get_tree().create_timer(1.5).timeout
				canProg = true
			else:
				canProg = false
				var tween2 = get_tree().create_tween()
				tween2.tween_property($Label2, "modulate", Color(1,1,1,1), 1.5)
				await get_tree().create_timer(3).timeout
				tween.tween_property($Label2, "modulate", Color(1,1,1,0), 1.5)
				await get_tree().create_timer(1.5).timeout
				$AnimationPlayer.play("kill")

func restart():
	var dir = DirAccess.open(Game.scenePaths[Game.curFile])
	if dir != null:
		for file in dir.get_files():
			DirAccess.remove_absolute(Game.scenePaths[Game.curFile]+"/"+file)
	DirAccess.remove_absolute(Game.scenePaths[Game.curFile])
	#Game.resetables(true)
	Game.loadData()
	Game.rebirths += 1
	var config = ConfigFile.new()
	config.load(Game.files[Game.curFile])
	Game.rebirthTokens += recievedTokens
	config.set_value("Rebirth", "RebirthTokens", recievedTokens)
	config.set_value("Fiscal", "Rebirths", Game.rebirths)
	config.save(Game.files[Game.curFile])
	if Game.rebirths >= 10 and Achievements.achievements[1]["unlocked?"] == false:
		Game.notify('You unlocked the "10 Lifetimes Past" achievement!\nProve your worth.', "trophy")
		Achievements.achievements[0]["unlocked?"] = true
	if Achievements.achievements[0]["unlocked?"] == false:
		Game.notify('You unlocked the "Rebirth" achievement!\nData Wipe.', "trophy")
		Achievements.achievements[0]["unlocked?"] = true
	Achievements.save()
	Achievements.load()
	Game.saveData()
	Game.resetables()
	Game.loadData()
	$Timer.start()

func _on_timer_timeout() -> void:
	ItemValues.money = 0
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")

func _on_timer_2_timeout() -> void:
	$Label.text = "(you can click to progress the dialogue)"
