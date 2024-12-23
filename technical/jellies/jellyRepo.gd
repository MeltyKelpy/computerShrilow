extends TextureRect

var naame = "Floor"
var type = ""
var jelly = 0
var maxJells = 0
var posX = 0
var posY = 0
var hi
var ID = 0

func _ready():
	$name.text = naame

func _process(delta: float) -> void:
	if $name.text == "Lobby":
		$name.editable = false
		$jellies.text = ""
	else:
		$jellies.text = "Jellies: "+str(hi.jellyCount)+"/"+str(hi.maxJel)

func _on_button_pressed() -> void:
	# THIS SUCKS
	var getParentdot = get_parent()
	var getParentdotdot = getParentdot.get_parent()
	var hihi = getParentdotdot.get_parent()
	hihi.spawnJelly(hi.ID)
	hi.jellyCount += 1
