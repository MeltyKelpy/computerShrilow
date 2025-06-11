extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Interstate.loadData()
	if Interstate.iq == "luke fucking sucks i fucking hate him  :yum: hi :yum: gren":
		Interstate.iq = randi_range(-4,200)
	Interstate.saveData()
	Settings.loadData()
	Settings.saveData()
	$AnimationPlayer.play("opening")
	$AudioStreamPlayer.play()
	DiscordRPC.app_id = 1160342090039971850
	DiscordRPC.details = "A Computer Game about a Computer Boy"
	DiscordRPC.state = "Clicking, probably"
	DiscordRPC.large_image = "icon"
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.refresh()
	print("rpc working: " + str(DiscordRPC.get_is_discord_working()))

func _end():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
