extends TextureRect

@export var naame : String = "Floor"
var type = ""
var posX = 0
var posY = 0
var hi
var ID = 0
var assignedElevator

func _ready():
	$name.text = naame

func _process(delta: float) -> void:
	if $name.text == "Lobby":
		$name.editable = false
		$jellies.text = ""
	else:
		$jellies.text = "Type: "+type+" || Jellies: "+str(hi.jellyCount)+"/"+str(hi.maxJel)

func _on_button_pressed() -> void:
	if assignedElevator != null:
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
