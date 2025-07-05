extends TextureRect

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
