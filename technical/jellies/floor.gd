extends TextureRect

var naame = "Floor"
var jelly = 0
var posX = 0
var posY = 0
var hi

func _ready():
	$name.text = naame
	$jellies.text = str(jelly)

func _process(delta: float) -> void:
	if $name.text == "Lobby":
		$name.editable = false

func _on_button_pressed() -> void:
	$/root/computerShrilow.cameraAnimation("elevator", posX, posY, true)

func _on_name_text_changed(new_text: String) -> void:
	if $name.text != "Lobby":
		if $name.text != "":
			naame = new_text
			hi.Aname = new_text
		else:
			hi.Aname = "unnamed"
