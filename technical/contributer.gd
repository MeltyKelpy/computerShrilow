extends TextureRect

var parent
var id = 0
var textures

func _process(delta: float) -> void:
	if parent.contributerSel != id:
		modulate = Color(1,1,1,0.5)
	else:
		modulate = Color(1,1,1,1)
	
	texture = load(textures)

func _on_mouse_entered() -> void:
	parent.contributerSel = id

func _on_mouse_exited() -> void:
	parent.contributerSel = 0
