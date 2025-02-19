extends TextureRect

var curseID = 0
var curseNum = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	$Label.visible = true

func _on_mouse_exited() -> void:
	$Label.visible = false
