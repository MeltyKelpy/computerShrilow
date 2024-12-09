extends Node2D

func _ready() -> void:
	DiscordRPC.app_id = 1160342090039971850
	DiscordRPC.details = "A Computer Game about a Computer Boy"
	DiscordRPC.state = "Developing the game"
	DiscordRPC.large_image = "developing"
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.refresh()
