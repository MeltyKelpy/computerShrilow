extends TextureRect

var desc
var ID
var uhmg
var type
var choices = {
	"hello":"example",
	"hello2":"hi guys",
	}
var multiChoiceChoice = 0

func _ready():
	if uhmg != null:
		$button.button_pressed = uhmg

func _process(delta: float) -> void:
	
	if multiChoiceChoice > choices.size()-1:
		multiChoiceChoice = 0
	if multiChoiceChoice < 0:
		multiChoiceChoice = choices.size()-1
	
	var keys = choices.keys()
	$button.text = Settings.settings[ID]["name"]
	$altName.text = Settings.settings[ID]["name"]
	if type == "boolean":
		Settings.settings[ID]["enabled?"] = $button.button_pressed
		$altName.visible = false
		$button.disabled = false
		$button.visible = true
	elif type == "multiChoice":
		choices = Settings.settings[ID]["choices"]
		keys = choices.keys()
		Settings.settings[ID]["selection"] = choices[str(keys[multiChoiceChoice])]
		Settings.settings[ID]["selectionNum"] = multiChoiceChoice
		$multiChoice/display.text = str(keys[multiChoiceChoice])
		$multiChoice.visible = true
		$button.disabled = true
		$button.visible = false
		$altName.visible = true
	else:
		$button.disabled = true
		$button.visible = false
		$altName.visible = true

func _on_kiwami_mode_mouse_entered() -> void:
	FizzyDrink.descriptionSetting = desc

func _on_kiwami_mode_mouse_exited() -> void:
	FizzyDrink.descriptionSetting = ""

func _on_left_pressed() -> void:
	multiChoiceChoice -= 1

func _on_right_pressed() -> void:
	multiChoiceChoice += 1
