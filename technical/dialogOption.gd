extends TextureRect

var present = ""
var dialogKey = ""
var interacted = true
var important = false
var arrayToUse = ""
var stupidArray = [{
	"melanie":FizzyDrink.melDialogue,
	"bricks":FizzyDrink.bricksDialogue,
	"melvin":FizzyDrink.melvinDialogue,
	"market":FizzyDrink.marketDialogue,
	}]

func _ready():
	$ItemName.text = present
	if interacted == false:
		modulate = Color(1,1,0.60392156862)
		if important == true:
			modulate = Color(1,0.545,0.51)

func _on_button_pressed():
	$/root/computerShrilow.dialogKey = dialogKey
	$/root/computerShrilow.manageScenes()
	for i in stupidArray[0][arrayToUse].size():
		if stupidArray[0][arrayToUse][i]["dialogKey"] == dialogKey:
			stupidArray[0][arrayToUse][i]["interacted"] = true
