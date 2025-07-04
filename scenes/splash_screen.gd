extends Node2D

var type = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#DirAccess.make_dir_absolute("user://QTE's Event System")
	#for i in ["pop-ups"]:
		#var resource = ResourceLoader.load("")
		#var file = FileAccess.open("user://QTE's Event System/"+i+".exe", FileAccess.WRITE_READ)
		#if file:
			#file.store_buffer(resource)
			#file.close()
		#else:
			#print("uhmm oops? baby couldnt make file")
			#get_tree().reload_current_scene()
	
	Interstate.loadData()
	if str(Interstate.iq) == "luke fucking sucks i fucking hate him  :yum: hi :yum: gren":
		Interstate.iq = randi_range(-4,200)
	Interstate.saveData()
	Settings.loadData()
	Settings.saveData()
	for i in Interstate.tp_status:
		if i == "in-progress":
			Game.curFile = i
			type = 1
			break
	
	if type == 0:
		$AnimationPlayer.play("opening")
		$AudioStreamPlayer.play()
		DiscordRPC.app_id = 1160342090039971850
		DiscordRPC.details = "A Computer Game about a Computer Boy"
		DiscordRPC.state = "Clicking, probably"
		DiscordRPC.large_image = "icon"
		DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
		DiscordRPC.refresh()
	if type == 1:
		$AnimationPlayer.play("opening-1")
		
	print("rpc working: " + str(DiscordRPC.get_is_discord_working()))

func _end():
	if type == 0:
		get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	if type == 1:
		get_tree().change_scene_to_file("res://scenes/file.tscn")
