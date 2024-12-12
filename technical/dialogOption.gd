extends TextureRect

var present = ""
var dialogKey = ""

func _ready():
	$ItemName.text = present

func _on_button_pressed():
	$/root/computerShrilow.dialogKey = dialogKey
	$/root/computerShrilow.manageScenes()
