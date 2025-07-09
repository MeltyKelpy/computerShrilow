extends Window

func _ready() -> void:
	DiscordRPC.app_id = 1160342090039971850
	DiscordRPC.details = "tunnelpuzzle!"
	DiscordRPC.state = "exploring the C: drive"
	DiscordRPC.large_image = "tunnelpuzzle"
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.refresh()

func song_play(song, volume):
	$AudioStreamPlayer.stream = load("res://assets/music/"+song+".ogg")
	$AudioStreamPlayer.volume_db = volume
	$AudioStreamPlayer.play()
