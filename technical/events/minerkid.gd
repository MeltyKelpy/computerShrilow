extends Node2D

var phoneCalling = false

var minute = 0
var second = 0
var chosen = "accept"
var streamTo = ""
var caller = "minerkid"
var parent
var clocked_in = false

func _ready() -> void:
	reparent($/root/computerShrilow/Camera2D)
	position.x = -577
	position.y = -324

func _process(delta: float) -> void:
	manageSubtitles()
	if second < 10:
		$miner/time.text = str(minute)+":0"+str(second)
	else:
		$miner/time.text = str(minute)+":"+str(second)
	if phoneCalling == true and $phonecall.volume_db <= 0:
		$phonecall.volume_db += 5 + (5 * delta)
	if $phonecall.volume_db > 0:
		$phonecall.volume_db = 0

func swapTo(call):
	caller = call
	if caller == "minerkid":
		$miner.texture = load("res://assets/images/events/theminerkid/isCalling.png")
	if caller == "doctor":
		$miner/thing/onCall.text = "ON CALL WITH:\nTHE DOCTOR"
		$miner.texture = load("res://assets/images/events/theminerkid/isCallingHOUSE.png")

func manageSubtitles():
	var time = $minerKid.get_playback_position()
	if streamTo == "res://assets/sounds/minerkid0.mp3":
		if time >= 0 and time <= 1.1:
			$miner/thing/transcript.text = "hey, its me!"
		elif time >= 1.1 and time <= 2.3:
			$miner/thing/transcript.text = "the miner kid!"
		elif time >= 2.3 and time <= 4.6:
			$miner/thing/transcript.text = "i like to mine. mine mine mine! im the miner!"
		elif time >= 5.6 and time <= 7:
			$miner/thing/transcript.text = "i mine in the mines!"
		elif time >= 7.16 and time <= 9.61:
			$miner/thing/transcript.text = "i'm the kid miner! you should let me mine in your mines."
		elif time >= 9.61 and time <= 13.75:
			$miner/thing/transcript.text = "i love mining! let me mine. let me mine. i wont collapse the ceiling this time."
		elif time >= 13.75 and time <= 15.77:
			$miner/thing/transcript.text = "let me mine! consider my offer."
		elif time >= 15.77 and time <= 17.63:
			$miner/thing/transcript.text = "my boss is calling me now,"
		elif time >= 17.63 and time <= 19.51:
			$miner/thing/transcript.text = "heh, gotta go mine!"
		elif time >= 19.51 and time <= 20.68:
			$miner/thing/transcript.text = "because"
		elif time >= 20.68:
			$miner/thing/transcript.text = "because im the miner kid"
	
	if streamTo == "res://assets/sounds/decline0.mp3":
		if time >= 0 and time <= 1.56:
			$miner/thing/transcript.text = "i dont like that you did that."
		elif time >= 1.56 and time <= 3.61:
			$miner/thing/transcript.text = "you're making me quite upset."
		elif time >= 3.61:
			$miner/thing/transcript.text = "i am summoning 3 jerry seinfelds on you."
	
	if streamTo == "res://assets/sounds/doctorcall.ogg":
		if time >= 0 and time <= 2.6:
			$miner/thing/transcript.text = "hi there, I am calling regarding your 'Shrilow'."
		elif time >= 2.6 and time <= 7.6:
			$miner/thing/transcript.text = "its mandated in quicklaw under section 31 that you take your shrilow in for a doctor's appointment."
		elif time >= 7.6 and time <= 11.58:
			$miner/thing/transcript.text = "and i ALWAYS abide by the laws of the GREEN WHITE AND RED... FREEDOM-PUTER..."
		elif time >= 11.58 and time <= 15.50:
			$miner/thing/transcript.text = "in like 10 minutes or sum'in, i'll be taking him to have his appointment."
			if clocked_in == false:
				parent.timer_3.start()
				var cacapoopyGOD2 = preload("res://technical/clock.tscn")
				var caca = cacapoopyGOD2.instantiate()
				add_child(caca)
				caca.create("Dr's Appointment", 600, "not")
				clocked_in = true
		elif time >= 15.50 and time <= 17.75:
			$miner/thing/transcript.text = "i will grab him by a big hook and steal him"
		elif time >= 17.75 and time <= 18.99:
			$miner/thing/transcript.text = "you better be okay with that"
		elif time >= 18.99 and time <= 19.50:
			$miner/thing/transcript.text = "ok?"
		elif time >= 19.50 and time <= 20.20:
			$miner/thing/transcript.text = "ok."
		elif time >= 20.20 and time <= 21.50:
			$miner/thing/transcript.text = "I apologize for the lack of"
		elif time >= 21.50:
			$miner/thing/transcript.text = "more mouse bites."

func _on_theminerkid_timeout() -> void:
	$phonecall.play()
	phoneCalling = true
	$AnimationPlayer.play("pop")

func accept() -> void:
	$omi.visible = false
	chosen = "accept"
	$miner/call.disabled = true
	$miner/decline.disabled = true
	if caller == "minerkid":
		streamTo = "res://assets/sounds/minerkid0.mp3"
		$miner.texture = load("res://assets/images/events/theminerkid/inCall.png")
	if caller == "doctor":
		streamTo = "res://assets/sounds/doctorcall.ogg"
		$miner.texture = load("res://assets/images/events/theminerkid/inCallHOUSE.png")
	$countTheWays.start()
	$phonecall.stop()
	$minerKid.stream = load(streamTo)
	$minerKid.play()
	$miner/time.visible = true
	$miner/thing.visible = true

func decline() -> void:
	if caller == "minerkid":
		chosen = "decline"
		$miner/call.disabled = true
		$miner/decline.disabled = true
		streamTo = "res://assets/sounds/decline0.mp3"
		$phonecall.stop()
		$minerKid.stream = load(streamTo)
		$minerKid.play()
		$miner/thing.visible = true
		$miner.texture = load("res://assets/images/events/theminerkid/inCall.png")
		#queue_free()
	else:
		$omi.visible = true

func addSecond() -> void:
	if phoneCalling == true:
		second += 1
		if second == 60:
			minute += 1
			second = 0
		$countTheWays.start()

func audioEnded() -> void:
	if chosen == "decline":
		var cacapoopyGOD2 = load(Events.eventList[1]["AttachedScene"])
		var caca = cacapoopyGOD2.instantiate()
		var caca2 = cacapoopyGOD2.instantiate()
		var caca3 = cacapoopyGOD2.instantiate()
		add_child(caca)
		add_child(caca2)
		add_child(caca3)
	phoneCalling = false
	$miner/thing.visible = false
	$AnimationPlayer.play_backwards("pop")
	$kill.start()

func kill() -> void:
	queue_free()
