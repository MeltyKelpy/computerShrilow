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
var baseValue

func _ready():
	if uhmg != null:
		$button.button_pressed = uhmg
	
	if type == "bar":
		$Bar/HSlider.value = Settings.settings[ID]["value"]

func _process(delta: float) -> void:
	
	if multiChoiceChoice > choices.size()-1:
		multiChoiceChoice = 0
	if multiChoiceChoice < 0:
		multiChoiceChoice = choices.size()-1
	
	var keys = choices.keys()
	$button.text = Settings.settings[ID]["name"]
	$altName.text = Settings.settings[ID]["name"]
	$Title.text = Settings.settings[ID]["name"]
	if type == "boolean":
		Settings.settings[ID]["enabled?"] = $button.button_pressed
		$altName.visible = false
		$button.disabled = false
		$button.visible = true
		$Title.visible = false
	elif type == "bar":
		Settings.settings[ID]["value"] = $Bar/HSlider.value
		$Bar/HSlider.max_value = Settings.settings[ID]["max"]
		$Bar.visible = true
		$button.disabled = true
		$button.visible = false
		$altName.visible = true
		$Title.visible = false
	elif type == "multiChoice":
		keys = choices.keys()
		Settings.settings[ID]["selection"] = choices[str(keys[multiChoiceChoice])]
		Settings.settings[ID]["selectionNum"] = multiChoiceChoice
		$multiChoice/display.text = str(keys[multiChoiceChoice])
		$multiChoice.visible = true
		$button.disabled = true
		$button.visible = false
		$altName.visible = true
		$Title.visible = false
	elif type == "category":
		$multiChoice.visible = false
		$button.disabled = true
		$button.visible = false
		$altName.visible = false
		$Title.visible = true
	else:
		$multiChoice.visible = false
		$button.disabled = true
		$button.visible = false
		$altName.visible = true
		$Title.visible = false

func _on_kiwami_mode_mouse_entered() -> void:
	FizzyDrink.descriptionSetting = desc

func _on_kiwami_mode_mouse_exited() -> void:
	FizzyDrink.descriptionSetting = ""

func _on_left_pressed() -> void:
	multiChoiceChoice -= 1
	Settings.saveData()

func _on_right_pressed() -> void:
	multiChoiceChoice += 1
	Settings.saveData()

func _on_button_pressed() -> void:
	Settings.saveData()

func _on_h_slider_value_changed(value: float) -> void:
	Settings.saveData()
	Settings.loadData()
