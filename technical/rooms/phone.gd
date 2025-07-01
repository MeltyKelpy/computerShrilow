extends Node2D

var cur_screen = "lockscreen"
var state = "playing"
var can = false
var typing = false
var caller_id = 0000
var calling = false
var call_time = 0
var caller_pos = 0
var step_duration : float
var display_number = ""

func _ready() -> void:
	step_duration = (60.0 / 130 / 4)
	for i in FizzyDrink.callers.size():
		if FizzyDrink.callers[i]["unlocked?"] == true:
			var callercreate = preload("res://technical/rooms/phonebox.tscn").instantiate()
			callercreate.parent = self
			callercreate.id = FizzyDrink.callers[i]["id"]
			callercreate.caller = FizzyDrink.callers[i]["name"]
			$phanphone/contacts/ScrollContainer/VBoxContainer.add_child(callercreate)

func make_call():
	caller_pos = 0
	var valid_number = false
	var call_declined = false
	for i in FizzyDrink.callers.size():
		if FizzyDrink.callers[i]["id"] == caller_id:
			valid_number = true
			caller_pos = i
			if FizzyDrink.callers[i].has("maxcalls"):
				if FizzyDrink.callers[i]["timescalled"] < FizzyDrink.callers[i]["maxcalls"]:
					FizzyDrink.callers[caller_pos]["timescalled"] += 1
					break
				else:
					call_declined = true
					break
			else:
				break
	if valid_number == true:
		call_time = 0
		can = false
		if FizzyDrink.callers[caller_pos].has("img"):
			$phanphone/call/phanphone.texture = load("res://assets/images/ui/phantomsphone/"+FizzyDrink.callers[caller_pos]["img"])
		$phanphone/call/title.text = FizzyDrink.callers[caller_pos]["name"]
		if FizzyDrink.callers[caller_pos].has("audio"):
			$call.stream = load("res://assets/images/ui/phantomsphone/calls/"+FizzyDrink.callers[caller_pos]["audio"]+str(FizzyDrink.callers[caller_pos]["timescalled"])+".ogg")
		else:
			$call.stream = load("res://assets/images/ui/phantomsphone/calls/minerkid.ogg")
		$phanphone/call/title2.text = "ringing..."
		$phanphone/call.visible = true
		cur_screen = "call"
		$calling.play()
		await get_tree().create_timer(3).timeout
		if call_declined == false:
			calling = true
			$calltime.start()
			$calling.stop()
			$call.play()
		else:
			$calling.stop()
			_on_call_finished()

func update_call():
	if $calltime.is_stopped() == true:
		$calltime.start()
	var minutes = call_time / 60
	var seconds = call_time
	while seconds >= 60:
		seconds = call_time - 60
	if seconds < 10:
		$phanphone/call/title2.text = str(minutes)+":0"+str(seconds)
	else:
		$phanphone/call/title2.text = str(minutes)+":"+str(seconds)
	var current_position = $call.get_playback_position()
	var current_step = int(current_position / step_duration)
	if Input.is_action_just_pressed("DebugMode"):
		print(current_step)
	match caller_id:
		0420:
			$phanphone/viewfinder/info/title.text = "IN CALL WITH: John Stoner"
			if FizzyDrink.callers[caller_pos]["timescalled"] == 1:
				if current_step == 0:
					$phanphone/viewfinder/info/desc.text = "hey man"
				if current_step == 15:
					$phanphone/viewfinder/info/desc.text = "i'm."
				if current_step == 23:
					$phanphone/viewfinder/info/desc.text = "john stoner"
				if current_step == 38:
					$phanphone/viewfinder/info/desc.text = "i smoke weed"
				if current_step == 48:
					$phanphone/viewfinder/info/desc.text = "like"
				if current_step == 56:
					$phanphone/viewfinder/info/desc.text = "alot"
				if current_step == 64:
					$phanphone/viewfinder/info/desc.text = "d- do you like my phone number?"
				if current_step == 81:
					$phanphone/viewfinder/info/desc.text = "420?"
				if current_step == 90:
					$phanphone/viewfinder/info/desc.text = "get it?"
				if current_step == 97:
					$phanphone/viewfinder/info/desc.text = "like weed?"
				if current_step == 106:
					$phanphone/viewfinder/info/desc.text = "because i smoke that shit."
				if current_step == 118:
					$phanphone/viewfinder/info/desc.text = "i'm high"
				if current_step == 123:
					$phanphone/viewfinder/info/desc.text = "as"
				if current_step == 127:
					$phanphone/viewfinder/info/desc.text = "FUCK."
				if current_step == 139:
					$phanphone/viewfinder/info/desc.text = "i'm john stoner"
				if current_step == 152:
					$phanphone/viewfinder/info/desc.text = "you ever want weed? call me!"
				if current_step == 173:
					$phanphone/viewfinder/info/desc.text = "probably"
		0314:
			$phanphone/viewfinder/info/title.text = "IN CALL WITH: Antag"
		2012:
			$phanphone/viewfinder/info/title.text = "IN CALL WITH: The Miner Kid"
			if FizzyDrink.callers[caller_pos]["timescalled"] == 1:
				if current_step == 0:
					$phanphone/viewfinder/info/desc.text = "Hey its me, The Miner Kid!"
				if current_step == 20:
					$phanphone/viewfinder/info/desc.text = "Are you finally ready to take me up on my offer?"
				if current_step == 47:
					$phanphone/viewfinder/info/desc.text = "What!? Crystals!? how do you know about those??"
				if current_step == 72:
					$phanphone/viewfinder/info/desc.text = "Well I guess you do run mines, dont you?"
				if current_step == 91:
					$phanphone/viewfinder/info/desc.text = "Whaddaya wanna know, huh?"
				if current_step == 106:
					$phanphone/viewfinder/info/desc.text = "Why can you only use one? its a memory issue, how do you not knows that??"
				if current_step == 143:
					$phanphone/viewfinder/info/desc.text = "Well of COURSE its possible to use more than one, but-"
				if current_step == 167:
					$phanphone/viewfinder/info/desc.text = "It just requires alot of power it- its almost not worth it!"
				if current_step == 196:
					$phanphone/viewfinder/info/desc.text = "Besite isnt powerful enough to do it, so we cant just sacrifice a crystal for more crystals or nuthin,"
				if current_step == 235:
					$phanphone/viewfinder/info/desc.text = "You'd need Sapphire for that!"
				if current_step == 255:
					$phanphone/viewfinder/info/desc.text = "Can I get you Sapphire? Well of COURSE I can!"
				if current_step == 293:
					$phanphone/viewfinder/info/desc.text = "But for a price...."
				if current_step == 316:
					$phanphone/viewfinder/info/desc.text = "You gotta let me work in your mines"
				if current_step == 336:
					$phanphone/viewfinder/info/desc.text = "I'm short a job because I got fired last week for letting the ceiling collapse"
				if current_step == 363:
					$phanphone/viewfinder/info/desc.text = "If you get me a job in your mines, I'll get you some Sapphire!"
				if current_step == 390:
					$phanphone/viewfinder/info/desc.text = "How bout that??"
				if current_step == 401:
					$phanphone/viewfinder/info/desc.text = "Dont even answer, I know you're up to it!"
				if current_step == 424:
					$phanphone/viewfinder/info/desc.text = "I'll be in ya minneess"
				if current_step == 439:
					$phanphone/viewfinder/info/desc.text = "Miner Kid Out!"
			if FizzyDrink.callers[caller_pos]["timescalled"] == 2:
				if current_step == 0:
					$phanphone/viewfinder/info/desc.text = "Hi!"
				if current_step == 12:
					$phanphone/viewfinder/info/desc.text = "..Again!"
				if current_step == 32:
					$phanphone/viewfinder/info/desc.text = "I-I'm working!"
				if current_step == 48:
					$phanphone/viewfinder/info/desc.text = "Working hard!"
				if current_step == 74:
					$phanphone/viewfinder/info/desc.text = "Uhm"
				if current_step == 84:
					$phanphone/viewfinder/info/desc.text = "Working hard or hardly working?"
				if current_step == 103:
					$phanphone/viewfinder/info/desc.text = "Can you let me work now"

func make_can():
	can = true

func _process(delta: float) -> void:
	
	$phanphone/manual/Control/Label.text = display_number
	
	if calling == true:
		update_call()
	
	if get_node_or_null("/root/computerShrilow"):
		position.x = $/root/computerShrilow/Camera2D.position.x - 576
		position.y = $/root/computerShrilow/Camera2D.position.y - 324
	
	if cur_screen == "lockscreen":
		var time = Time.get_time_dict_from_system()
		$phanphone/lockscreen/title.text = ("%02d:%02d" % [time.hour, time.minute])
		$phanphone/viewfinder/info/title.text = "PHANTOM'S LOCKSCREEN"
		$phanphone/viewfinder/info/desc.text = "Click the phone to open! press P again to exit this menu."
	if cur_screen == "contacts":
		$phanphone/viewfinder/info/title.text = "PHANTOM'S CONTACTS"
		$phanphone/viewfinder/info/desc.text = "Click a contact to call them, scroll to see more.\n\nthe manual button at the bottom will allow you to manually type in the number to call instead!"
	if cur_screen == "call" and not calling:
		$phanphone/viewfinder/info/title.text = "CALLING "+str(caller_id)+"..."
		$phanphone/viewfinder/info/desc.text = "please wait..."
	
	if get_tree().paused == true and state == "playing":
		state = "paused"
		$AnimationPlayer.play("pause")
	elif get_tree().paused == false and state == "paused":
		state = "playing"
		$AnimationPlayer.play("unpause")
	if can == true and Input.is_action_just_pressed("phantomphone") and typing == false:
		can = false
		$AnimationPlayer.play("kill me")

func _death():
	get_parent().phantom_phoned = false
	queue_free()

func buttons(button: String) -> void:
	if button == "clear":
		display_number = ""
	if button == "manual":
		cur_screen = "manual"
		display_number = ""
		$phanphone/manual/Control.mouse_filter = 0
		$phanphone/contacts.visible = false
		$phanphone/manual.visible = true
	if button == "return":
		cur_screen = "contacts"
		display_number = ""
		$phanphone/manual/Control.mouse_filter = 2
		$phanphone/contacts.visible = true
		$phanphone/manual.visible = false
	if button == "call":
		caller_id = int(display_number)
		display_number = ""
		make_call()
	if button == "open":
		$phanphone/lockscreen/open.mouse_filter = 2
		$phanphone/lockscreen/open.disabled = true
		$phanphone/lockscreen/open.visible = false
		$phanphone/lockscreen/melisabottom.visible = false
		$phanphone/lockscreen/pass.visible = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "phantomtehbest":
		cur_screen = "contacts"
		$phanphone/lockscreen.visible = false
		$phanphone/contacts.visible = true
		$phanphone/contacts/ScrollContainer.mouse_filter = 0
		print(cur_screen)
	else:
		$phanphone/lockscreen/pass/Label.text = "INCORRECT. try again."

func _on_line_edit_editing_toggled(toggled_on: bool) -> void:
	typing = toggled_on

func _on_call_finished() -> void:
	cur_screen = "contacts"
	$calltime.stop()
	$endcall.play()
	$phanphone/call.visible = false
	$phanphone/contacts.visible = true
	calling = false
	can = true

func _on_calltime_timeout() -> void:
	call_time += 1

func number(num_to_add: int) -> void:
	display_number += str(num_to_add)
