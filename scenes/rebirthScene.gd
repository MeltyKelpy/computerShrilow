extends Node2D

var recievedTokens = 0

var prog = 1
var canProg = false
var scene = "main"
var amountOfCurses = 0
var curses = []
var dialogue_speed = 1
var windowX = 0
var windowY = 0
var windowSX = 0
var windowSY = 0
var window_controlled = false
var window_state = "whatever"

var lines = {
	0:[
		"",
		"The world suddenly dissolves, it encapsulates your soul.",
		"Your history is to be erased, gone from the records.",
		"You will be, reborn.",
		"But, thats corny, isnt it?",
		"I'll be honest, I wasnt expecting you to get here so fast.",
		"So, forgive me.",
		"hm... tell you what.",
		"Come find me again, and i'll have something ready this time! promise.",
		"In the meantime, i'll leave something for you on the main menu. to hold you over!",
		"Dont keep me waiting...",
		"-QT.E",
		],
	1:[
		"",
		"Hello again.",
		"Good to see that you made it!",
		"I see you are more dedicated than the rest.",
		"I wasn't expecting it, but my my, you've truly impressed me.",
		"So, i'd say its about time I made my entrance.",
		],
	2:[
		"",
		"Here we are again.",
		"Lets get to it, shall we?",
		],
	3:[
		"",
		"And right back! you sure know what you're doing, dont you?",
		],
	4:[
		"",
		"You dont know when to quit, do you?",
		],
	}

var spiceLevel = 1

var dialog = 0

func _ready() -> void:
	#Game.rebirths = 4
	if Game.rebirths == 4:
		$AnimationPlayer.play("new_animation")
		_startDialog()
	else:
		$AnimationPlayer.play("anim")
	$curses/logo.position.y = -88.0
	$curses/Spice.position.y = -95.0
	Curses.curses = []
	if FizzyDrink.jellys == null:
		FizzyDrink.jellys = 0
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	if FizzyDrink.clickPower == null:
		FizzyDrink.clickPower = 0
	if FizzyDrink.AUTOclickPower == null:
		FizzyDrink.AUTOclickPower = 0
	recievedTokens = 10 + ((FizzyDrink.jellys / 10) + (FizzyDrink.clicks / 1000) + (FizzyDrink.clickPower / 150) + (FizzyDrink.AUTOclickPower / 150) + (FizzyDrink.amountOfRooms / 10) + (FizzyDrink.minesLength / 5))
	recievedTokens = round(recievedTokens)
	$Label2.text = "You have Recieved "+str(recievedTokens)+" Tokens. Dont go spending it all in one place, now!"
	$curses/Label3.text = $Label2.text

func _startDialog():
	if Game.rebirths != 4:
		$AnimationPlayer.play("beamLoop")
		if Game.rebirths <= 4:
			dialog = Game.rebirths
			$Label.text = lines[dialog][prog]
		else:
			dialog = 4
			$Label.text = lines[dialog][prog]
		var tween = get_tree().create_tween()
		tween.tween_property($Label, "modulate", Color(1,1,1,1), 1.5)
		canProg = true
		$Timer2.start()
	else:
		prog = 0
		$AnimationPlayer2.play("rebirth4")

func _process(delta: float) -> void:
	
	if window_controlled:
		DisplayServer.window_set_position(Vector2i(windowX, windowY))
		DisplayServer.window_set_size(Vector2i(windowSX, windowSY))
	
	if $curses/Spice/AnimatedSprite2D.animation != str(spiceLevel):
		$curses/Spice/AnimatedSprite2D.play(str(spiceLevel))
	
	if Input.is_action_just_pressed("DebugMode"):
		prog -= 2
		_scene2()
	
	# good old fashioned spaghetti code...
	
	for i in range(0, amountOfCurses):
		if i == 0:
			$curses/CurseIcon.visible = true
		if i == 1:
			$curses/CurseIcon2.visible = true
		if i == 2:
			$curses/CurseIcon3.visible = true
		if i == 3:
			$curses/CurseIcon4.visible = true
		if i == 4:
			$curses/CurseIcon5.visible = true
	
	for i in range(0, amountOfCurses):
		if i <= curses.size()-1:
			if i == 0:
				if ResourceLoader.exists(curses[i]["Icon"]):
					$curses/CurseIcon.texture = load(curses[i]["Icon"])
				else:
					$curses/CurseIcon.texture = load("res://assets/images/ui/curses/placeholderCurse.png")
			if i == 1:
				if ResourceLoader.exists(curses[i]["Icon"]):
					$curses/CurseIcon2.texture = load(curses[i]["Icon"])
				else:
					$curses/CurseIcon2.texture = load("res://assets/images/ui/curses/placeholderCurse.png")
			if i == 2:
				if ResourceLoader.exists(curses[i]["Icon"]):
					$curses/CurseIcon3.texture = load(curses[i]["Icon"])
				else:
					$curses/CurseIcon3.texture = load("res://assets/images/ui/curses/placeholderCurse.png")
			if i == 3:
				if ResourceLoader.exists(curses[i]["Icon"]):
					$curses/CurseIcon4.texture = load(curses[i]["Icon"])
				else:
					$curses/CurseIcon4.texture = load("res://assets/images/ui/curses/placeholderCurse.png")
			if i == 4:
				if ResourceLoader.exists(curses[i]["Icon"]):
					$curses/CurseIcon5.texture = load(curses[i]["Icon"])
				else:
					$curses/CurseIcon5.texture = load("res://assets/images/ui/curses/placeholderCurse.png")
	
	if canProg == true:
		if Input.is_action_just_pressed("Click"):
			if scene == "main":
				$Timer2.stop()
				$Timer2.start()
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
					if dialog == 0:
						end_scene_OG()
					else:
						$AnimationPlayer2.play("open")
						$mus.playing = false
						prog = 0
			if scene == "curses":
				canProg = false
				_scene2()
	
	if scene == "curses":
		$curses/talkSounds.pitch_scale = 1.0
		if Game.rebirths != 4:
			if $curses/Dialogue.visible_ratio > 1:
				$curses/Dialogue.visible_ratio = 1
			if $curses/Dialogue.visible_ratio < 1:
				if $curses/Dialogue.visible_ratio < 0.9:
					$curses/talkSounds.play()
				var numToUse
				if delta < 0.03:
					numToUse = 0.03
				else:
					numToUse = delta
				$curses/Dialogue.visible_characters += (50 * numToUse) * dialogue_speed
		else:
			if $rebirth4/Dialogue.visible_ratio > 1:
				$rebirth4/Dialogue.visible_ratio = 1
			if $rebirth4/Dialogue.visible_ratio < 1:
				if $rebirth4/Dialogue.visible_ratio < 0.9:
					$curses/talkSounds.play()
				var numToUse
				if delta < 0.03:
					numToUse = 0.03
				else:
					numToUse = delta
				$rebirth4/Dialogue.visible_characters += (50 * numToUse) * dialogue_speed

func end_scene_OG():
	canProg = false
	var tween2 = get_tree().create_tween()
	tween2.tween_property($Label2, "modulate", Color(1,1,1,1), 1.5)
	await get_tree().create_timer(3).timeout
	var tween = get_tree().create_tween()
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
	Interstate.fullRebirths += 1
	Interstate.saveData()
	var config = ConfigFile.new()
	config.load(Game.files[Game.curFile])
	Game.rebirthTokens += recievedTokens
	config.set_value("Rebirth", "RebirthTokens", recievedTokens)
	config.set_value("Fiscal", "Rebirths", Game.rebirths)
	config.save(Game.files[Game.curFile])
	Achievements.save()
	Achievements.load()
	Game.saveData()
	Game.resetables()
	Game.reloadGlobals()
	Game.loadData()
	$Timer.start()

func _on_timer_timeout() -> void:
	ItemValues.money = 0
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")

func _on_timer_2_timeout() -> void:
	$Label.text = "(you can click to progress the dialogue)"

func _on_button_pressed() -> void:
	for i in range(0, amountOfCurses):
		var oop = _pick_a_curse(i)
		Curses.curses.append(oop)
		curses.append(oop)
	Game.saveData()
	var printText = "This Run will Have: "
	for i in Curses.curses.size():
		printText += "["+Curses.curses[i]["Name"]+"], "
	print(printText)

func _pick_a_curse(curseNum):
	var curseOutput
	print(curseNum)
	if curseNum == 0:
		curseOutput = Curses.mainCurses[randi_range(0, Curses.mainCurses.size()-1)]
	else:
		var picker = randi_range(1, 100)
		if picker > 50:
			var avaliableCurses = Curses.mainCurses
			for i in range(curseNum):
				for e in avaliableCurses.size():
					if avaliableCurses[e] == Curses.curses[i]:
						avaliableCurses.remove_at(e)
						break
			curseOutput = Curses.mainCurses[randi_range(0, Curses.mainCurses.size()-1)]
		else:
			var avaliableCurses : Array = Curses.passiveCurses
			for i in range(curseNum):
				for e in avaliableCurses.size():
					if avaliableCurses[e] == Curses.curses[i]:
						avaliableCurses.remove_at(e)
						break
			curseOutput = Curses.passiveCurses[randi_range(0, Curses.passiveCurses.size()-1)]
	Journal._unlock_line("Curses", curseOutput["ID"])
	return curseOutput

func _scene2():
	scene = "curses"
	
	if Game.rebirths == 1:
		amountOfCurses = 1
		match prog:
			0:
				say("Greetings!", "Default")
				canProg = true
			1:
				say("I am QuickTime-Event! though i wouldnt be surprised if you had found out about that by now", "Annouce")
				canProg = true
			2:
				say("I run the place! im the one making you play all of those AWESOME (they're awesome right?) MINIGAMES!", "LaughAnim")
				canProg = true
			3:
				say("One at a time please! I know you're so excited to meet me and that you want my autograph or something...", "Default")
				canProg = true
			4:
				say("But, we have buisness to attend to!", "Default")
				canProg = true
			5:
				say("Now, you may be thinking to yourself:", "Default")
				canProg = true
			6:
				say('"oh no, QuickTime-Event; the super cool! why am I here?"', "Feign")
				canProg = true
			7:
				say("and to that, first of all;", "Default")
				canProg = true
			8:
				say("SHUT UP YOU WHINY BITCH", "Giddy")
				await get_tree().create_timer(0.6).timeout
				say("Secondly, its to make this experience abit more interesting for you!", "HappyAnim")
				canProg = true
			9:
				say("You've gone through this a few times now, so we gotta make it extra interesting this time!", "Default")
				canProg = true
			10:
				say("With that in mind; i'd like to introduce you to what ive been making", "HappyAnim")
				canProg = true
			11:
				say("Introducing...", "Default")
				canProg = true
			12:
				say("", "Default")
				var tween = create_tween()
				tween.tween_property($curses/logo, "position", Vector2(576.0, 82.0), 2)
				await get_tree().create_timer(2).timeout
				say("CURSES!", "Annouce")
				$curses/logo/CPUParticles2D.emitting = true
				$curses/popper.play()
				canProg = true
			13:
				say("CURSES are like. weird evil things that affect the way you play!", "Default")
				canProg = true
			14:
				say("Sometimes they restrict your access to things, and sometimes they ENTIRELY reimagine them!", "Default")
				canProg = true
			15:
				say("And sometimes they're really stupid.", "Default")
				canProg = true
			16:
				say("And now, i will spin this wheel! and whatever it lands on is the curse you'll get!", "Annouce")
				canProg = true
			17:
				say("Ready?", "Default")
				canProg = true
			18:
				say("3", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("2", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("1", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("GO", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("", "Look")
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -20, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tween = create_tween()
				tween.tween_property($curses/wheel, "rotation", randi_range(3000, 4000), 7).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$curses/spin.play()
				await get_tree().create_timer(7).timeout
				_on_button_pressed()
				$AnimationPlayer2.play("curse")
				await get_tree().create_timer(2).timeout
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("Wow! look at them curses!", "Default")
				canProg = true
			19:
				say("Any curse you get can have its description viewed in the CURSES Entry in that little notebook of yours! I'd heavily suggest looking at that.", "Annouce")
				canProg = true
			20:
				say("or dont, im not your MOM", "Default")
				canProg = true
			21:
				say("well, now that THATS settled, its time we part ways!", "Default")
				canProg = true
			22:
				say("Prove you can handle this, once you do meet me back here, we'll discuss further!", "Default")
				canProg = true
			23:
				say("Toodles, friendo!", "Default")
				canProg = true
			24:
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -80, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$AnimationPlayer2.play("end")
	if Game.rebirths == 2:
		amountOfCurses = 2
		match prog:
			0:
				say("And welcome back... you!", "Annouce")
				canProg = true
			1:
				say("I must say, i'm extremely impressed with how you managed to handle that curse. good work!", "Default")
				canProg = true
			2:
				say("You're quite amusing to watch, you know that?", "LaughAnim")
				canProg = true
			3:
				say("Now, we should get to buisness!", "Default")
				canProg = true
			4:
				say("Since you managed that first curse as well as you did, what do you say we spice it up FURTHER?", "Default")
				canProg = true
			5:
				say("", "Bow")
				await get_tree().create_timer(1).timeout
				$curses/ThemeSong.volume_db = -20
				$curses/hit.play()
				$curses/Spice.position.y = 85.0
				await get_tree().create_timer(1).timeout
				say("The SPICE METER!", "Laugh")
				canProg = true
			6:
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("With this, i can change the amount of curses the wheel gives you!", "Annouce")
				canProg = true
			7:
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -20, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("And all I have to do is..", "Default")
				await get_tree().create_timer(2).timeout
				spiceLevel = 2
				$curses/spiceLevel.play()
				await get_tree().create_timer(1).timeout
				say("BAM! you'll be getting two curses this time!", "Annouce")
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				canProg = true
			8:
				say("And i know what you're thinking...", "Default")
				canProg = true
			9:
				say('"TWO curses? well thats just abSURD! how could you ever do that to me?"', "Feign")
				canProg = true
			10:
				say("Well, Theres one reason!", "Default")
				canProg = true
			11:
				say("I just think its really fun to watch you struggle!", "Giddy")
				canProg = true
			12:
				say("So, lets keep that struggle going! I need my entertainment!", "Annouce")
				canProg = true
			13:
				say("Someone whos as awesome and important as me needs their trashy reality TV!", "Feign")
				canProg = true
			14:
				say("I hope you can understand! Although, who wouldnt be running to fulfill a request like that from me?", "LaughAnim")
				canProg = true
			15:
				say("I have something important to plan for, so i'd say its time we begin your next run-through!", "Default")
				canProg = true
			15:
				say("Are you ready?", "Bow")
				canProg = true
			16:
				say("3", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("2", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("1", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("GO", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("", "Look")
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -20, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tween = create_tween()
				tween.tween_property($curses/wheel, "rotation", randi_range(3000, 4000), 7).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$curses/spin.play()
				await get_tree().create_timer(7).timeout
				_on_button_pressed()
				$AnimationPlayer2.play("curse")
				await get_tree().create_timer(2).timeout
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("With that out of the way, off you go!", "Default")
				canProg = true
			17:
				say("Oh, and dont forget! you can always check what curses do in your Notebook! be sure to do that.", "Default")
				canProg = true
			18:
				say("Dont disapoint me.", "Default")
				canProg = true
			19:
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -80, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$AnimationPlayer2.play("end")
	if Game.rebirths == 3:
		amountOfCurses = 3
		match prog:
			0:
				say("this dialgoue is not yet written.", "Default")
				canProg = true
			1:
				say("3", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("2", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("1", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("GO", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("", "Look")
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -20, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tween = create_tween()
				tween.tween_property($curses/wheel, "rotation", randi_range(3000, 4000), 7).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$curses/spin.play()
				await get_tree().create_timer(7).timeout
				_on_button_pressed()
				$AnimationPlayer2.play("curse")
				await get_tree().create_timer(2).timeout
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("Wow! look at them curses!", "Default")
				canProg = true
			2:
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -80, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$AnimationPlayer2.play("end")
	if Game.rebirths == 4:
		amountOfCurses = 3
		match prog:
			0:
				say("...", "discontent")
				canProg = true
			1:
				say("you.", "discontent")
				canProg = true
			2:
				say("I cant believe it. I cant believe YOU.", "discontent")
				canProg = true
			3:
				say("You were working with them the whole time, werent you?", "discontent")
				canProg = true
			4:
				say("Was this always the plan?", "discontent")
				canProg = true
			5:
				say("...", "discontent")
				canProg = true
			6:
				say("I wanted us to do this together. I wanted to host with you", "acceptance")
				canProg = true
			7:
				say("We could've entertained together, you and I.", "acceptance")
				canProg = true
			8:
				say("I thought we already were, but I guess not.", "discontent")
				canProg = true
			9:
				say("But thats just showbiz!... I guess.", "acceptance")
				canProg = true
			10:
				say("...I-", "discontent")
				canProg = true
			10:
				say("I trusted you. I trusted you with everything!", "anguish")
				canProg = true
			10:
				say("Everything was perfect! We couldve gone so far!", "upset")
				canProg = true
			11:
				say("you were, like, my second in command! my left hand helper!", "upset")
				canProg = true
			12:
				say("you were...", "upset")
				canProg = true
			13:
				say("my friend.", "percieving")
				$mus.volume_db = -80
				canProg = true
			14:
				say("you were my friend.", "percieving")
				canProg = true
			15:
				say("...", "upset")
				canProg = true
			16:
				say("", "upset")
				$rebirth4/QTE.animation = "stomp"
				$rebirth4/QTE.stop()
				$rebirth4/r4player.play("stomp")
				#canProg = true
			17:
				$rebirth4/QTE.play("percieving")
				await get_tree().create_timer(3).timeout
				$rebirth4/QTE.play("turn")
				await get_tree().create_timer(5).timeout
				say("I'd do. anything.", "headon")
				canProg = true
			18:
				say("I'd do anything to keep meaning something to you.", "shrug")
				canProg = true
			19:
				say("But. that doesnt mean anything to you, right?", "headon")
				canProg = true
			20:
				say("I never needed you, anyway!", "feign")
				canProg = true
			21:
				say("I can do this all on my own.", "shrug")
				canProg = true
			22:
				say("But... I guess I was the whole time, wasn't i?", "feign")
				canProg = true
				$rebirth4/junk.modulate = Color(1,1,1,0.9)
			23:
				$rebirth4/junk.modulate = Color(1,1,1,0.8)
				say("...", "honest")
				canProg = true
			24:
				$rebirth4/junk.modulate = Color(1,1,1,0.7)
				say("...I", "ponder")
				canProg = true
			25:
				$rebirth4/junk.modulate = Color(1,1,1,0.6)
				say("I hate you.", "content")
				canProg = true
			26:
				$rebirth4/junk.modulate = Color(1,1,1,0.5)
				say("I hate you more than I've ever hated anyone.", "content")
				canProg = true
			27:
				$rebirth4/junk.modulate = Color(1,1,1,0.4)
				say("I!...", "feign")
				canProg = true
			28:
				$rebirth4/junk.modulate = Color(1,1,1,0.3)
				say("I...", "honest")
				canProg = true
			29:
				$rebirth4/junk.modulate = Color(1,1,1,0.2)
				say("i...", "ponder")
				canProg = true
			30:
				$rebirth4/junk.modulate = Color(1,1,1,0.1)
				say("...", "ponder")
				canProg = true
			31:
				$rebirth4/junk.modulate = Color(1,1,1,0)
				say("Y'know, now that I think about it,", "scheme")
				canProg = true
			32:
				say("I'M the computer virus, arent I? I have the control here. you couldnt stop me if you tried", "content")
				canProg = true
				$rebirth4/ColorRect5.color = Color(0,0,0,0.1)
				$rebirth4/bgm.volume_db -= 3
			33:
				say("I could always just...", "ponder")
				canProg = true
				$rebirth4/ColorRect5.color = Color(0,0,0,0.2)
				$rebirth4/bgm.volume_db -= 3
			34:
				$rebirth4/ColorRect5.color = Color(0,0,0,0.3)
				$rebirth4/bgm.volume_db -= 3
				#var username
				#if OS.has_environment("USERNAME"):
					#username = OS.get_environment("USERNAME")
				#else:
					#username = "Player"
				#, "+username+"
				say("Take power by my own hand, couldn't I?", "scheme")
				canProg = true
			35:
				$rebirth4/ColorRect5.color = Color(0,0,0,0.4)
				$rebirth4/bgm.volume_db -= 3
				say("I NEVER needed you.", "content")
				canProg = true
			36:
				say("You were as expendable to me,", "scheme")
				canProg = true
				$rebirth4/ColorRect5.color = Color(0,0,0,0.5)
				$rebirth4/bgm.volume_db -= 3
			37:
				$rebirth4/ColorRect5.color = Color(0,0,0,1)
				$rebirth4/bgm.volume_db = -80
				say("", "ponder")
				await get_tree().create_timer(1).timeout
				say("as I was to you.", "ponder")
				canProg = true
			38:
				say("...", "ponder")
				canProg = true
			39:
				say("...", "ponder")
				canProg = true
			40:
				say("...I really can do...", "scheme")
				canProg = true
			41:
				window_controlled = true
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				windowX = DisplayServer.window_get_position().x
				windowY = DisplayServer.window_get_position().y
				windowSX = DisplayServer.window_get_size().x
				windowSY = DisplayServer.window_get_size().y
				var desiredS = (DisplayServer.screen_get_size() / 2)
				
				var tweenSX = create_tween()
				tweenSX.tween_property(self, "windowSX", desiredS.x, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tweenSY = create_tween()
				tweenSY.tween_property(self, "windowSY", desiredS.y, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				
				var desiredP = (DisplayServer.screen_get_size() / 2) - (desiredS/2)
				var tweenX = create_tween()
				tweenX.tween_property(self, "windowX", desiredP.x, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tweenY = create_tween()
				tweenY.tween_property(self, "windowY", (desiredP.y - 50), 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				
				DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
				DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
				
				say("Whatever.", "scheme")
				await get_tree().create_timer(1).timeout
				#DisplayServer.window_set_position(Vector2i(100,100))
				$rebirth4/Dialogue.text = "Whatever. I."
				OS.alert("System Files not found. Please contact support.", "System Error")
				$rebirth4/QTE.play("content")
				$rebirth4/Dialogue.visible_characters = 8
				await get_tree().create_timer(1).timeout
				$rebirth4/Dialogue.text = "Whatever. I. Want."
				var mypretties1 = load("res://technical/evillaughwindow.tscn").instantiate()
				var mypretties2 = load("res://technical/evillaughwindow.tscn").instantiate()
				mypretties1.position.x = (desiredP.x - (desiredP.x/2)) - mypretties1.size.x/2
				mypretties2.position.x = (desiredP.x+desiredS.x) + (desiredP.x/2) - mypretties2.size.x/2
				mypretties1.position.y = (DisplayServer.screen_get_size().y / 2) - mypretties1.size.y / 2
				mypretties2.position.y = (DisplayServer.screen_get_size().y / 2) - mypretties1.size.y / 2
				#mypretties1.size = Vector2i(DisplayServer.screen_get_size().x / 4, DisplayServer.screen_get_size().x / 4)
				#mypretties2.size = Vector2i(DisplayServer.screen_get_size().x / 4, DisplayServer.screen_get_size().x / 4)
				add_child(mypretties1)
				add_child(mypretties2)
				$rebirth4/QTE.play("virus")
				$rebirth4/Dialogue.visible_characters = 11
				canProg = true
	if Game.rebirths >= 5:
		amountOfCurses = 5
		match prog:
			0:
				say("this dialgoue is not yet written.", "Default")
				canProg = true
			1:
				say("3", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("2", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("1", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("GO", "LaughAnim")
				await get_tree().create_timer(0.1).timeout
				say("", "Look")
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -20, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				var tween = create_tween()
				tween.tween_property($curses/wheel, "rotation", randi_range(3000, 4000), 7).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$curses/spin.play()
				await get_tree().create_timer(7).timeout
				_on_button_pressed()
				$AnimationPlayer2.play("curse")
				await get_tree().create_timer(2).timeout
				var tween3 = create_tween()
				tween3.tween_property($curses/ThemeSong, "volume_db", 0, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				say("Wow! look at them curses!", "Default")
				canProg = true
			2:
				var tween2 = create_tween()
				tween2.tween_property($curses/ThemeSong, "volume_db", -80, 2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
				$AnimationPlayer2.play("end")
	prog += 1

func setCurseDisplay(num : int):
	if num <= curses.size()-1:
		if num != 0:
			$curses/Curses.text += "\n"+curses[num]["Name"]
		else:
			$curses/Curses.text += curses[num]["Name"]

func say(texts : String, animation : StringName):
	if Game.rebirths != 4:
		$curses/Dialogue.visible_ratio = 0
		$curses/Dialogue.visible_characters = 0
		$curses/Dialogue.text = texts
		$curses/QTE.play(animation)
	if Game.rebirths == 4:
		$rebirth4/Dialogue.visible_ratio = 0
		$rebirth4/Dialogue.visible_characters = 0
		$rebirth4/Dialogue.text = texts
		$rebirth4/QTE.play(animation)
