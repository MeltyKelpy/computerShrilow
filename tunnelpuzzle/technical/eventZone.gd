extends Area3D

@export var function : String = "boxKiller"
@export_category("Music Function Shit")
@export var song_u_playin : String = "corridors"
@export var vol : float = 0

func _on_body_entered(body: Node3D) -> void:
	if function == "boxKiller":
		if body is box:
			body.queue_free()
	if function == "musicSwitch":
		if body.name == "Player":
			get_parent().get_parent().song_play(song_u_playin, vol)
