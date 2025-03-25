extends TextureRect

var type = ""
var text = ""

func _ready() -> void:
	texture = load("res://assets/images/ui/"+type+".png")
func _process(delta: float) -> void:
	if type == "titlePiece":
		$Label.visible = true
		$Label.text = text
