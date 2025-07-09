extends Area3D

@export var attached_door : Node3D
var personal_prog = false

func _on_body_entered(body: Node3D) -> void:
	if body is box:
		if attached_door != null:
			if personal_prog == false:
				attached_door.progress += 1
				personal_prog = true

func _on_body_exited(body: Node3D) -> void:
	if body is box:
		if attached_door != null:
			if personal_prog == true:
				attached_door.progress -= 1
				personal_prog = false
