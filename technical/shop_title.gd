extends TextureRect

var type = ""

func _ready() -> void:
	texture = load("res://assets/images/ui/"+type+".png")
