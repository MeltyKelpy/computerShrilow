extends Node2D

var cur_screen = "lockscreen"
var state = "playing"
var can = false
var typing = false
var caller_id = 0000
var calling = false
var call_time = 0

var callers = [
	{"name":"Antag","id":0314,"unlocked?":true},
	{"name":"The Miner Kid","id":2012,"unlocked?":false},
	{"name":"QuickTime-Event","id":2006,"unlocked?":false},
	{"name":"Melanie","id":0962,"unlocked?":false},
	{"name":"OJSTheCoder","id":2636,"unlocked?":false},
	{"name":"KlutzyBugzyx3","id":0222,"unlocked?":false},
	{"name":"MeltyKelpy","id":0315,"unlocked?":false},
	]

func _ready() -> void:
	for i in callers.size():
		var callercreate = preload("res://technical/rooms/phonebox.tscn").instantiate()
		callercreate.parent = self
		callercreate.id = callers[i]["id"]
		callercreate.caller = callers[i]["name"]
		$phanphone/contacts/ScrollContainer/VBoxContainer.add_child(callercreate)

func make_call():
	print("hi")
	var valid_number = false
	for i in callers.size():
		print(callers[i]["id"])
		print(caller_id)
		if callers[i]["id"] == caller_id:
			valid_number = true
			break
	if valid_number == true:
		var callers2 = {
			0314:{"name":"Antag", "img":load("res://assets/images/ui/phantomsphone/antagvinyet.png")},
			2012:{"name":"The Miner Kid", "img":load("res://assets/images/ui/phantomsphone/minerkidvinyet.png"), "audio":load("res://assets/images/ui/phantomsphone/calls/minerkid.ogg")},
		}
		call_time = 0
		$phanphone/call/phanphone.texture = callers2[caller_id]["img"]
		$phanphone/call/title.text = callers2[caller_id]["name"]
		$call.stream = callers2[caller_id]["audio"]
		$phanphone/call/title2.text = "ringing..."
		$phanphone/call.visible = true
		cur_screen = "call"
		await get_tree().create_timer(2).timeout
		calling = true
		$call.play()

func update_call():
	match caller_id:
		0314:
			print("hi")
		2012:
			$phanphone/viewfinder/info/title.text = "IN CALL WITH: The Miner Kid"
			$phanphone/viewfinder/info/desc.text = ""

func make_can():
	can = true

func _process(delta: float) -> void:
	
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
