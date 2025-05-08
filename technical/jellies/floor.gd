extends TextureRect

var naame : String = "Floor"
var type = ""
var jelly = 0
var maxJells = 0
var posX = 0
var posY = 0
var hi
var ID = 0
var assignedElevator

func _ready():
	$name.text = naame
	$jellies.text = "Type: "+type+" || Jellies: "+str(jelly)+"/"+str(maxJells)

func _process(delta: float) -> void:
	if $name.text == "Lobby":
		$name.editable = false
		$jellies.text = ""

func _on_button_pressed() -> void:
	assignedElevator.loco = $name.text
	assignedElevator.loco_id = ID

func _on_name_text_changed(new_text: String) -> void:
	if $name.text != "Lobby":
		if $name.text != "":
			naame = new_text
			hi.Aname = new_text
		else:
			hi.Aname = "unnamed"
	else:
		$name.text = "???"
