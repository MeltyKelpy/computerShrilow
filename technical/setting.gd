extends TextureRect

var desc
var ID
var uhmg

func _ready():
	$button.button_pressed = uhmg

func _process(delta: float) -> void:
	Settings.settings[ID]["enabled?"] = $button.button_pressed

func _on_kiwami_mode_mouse_entered() -> void:
	FizzyDrink.descriptionSetting = desc

func _on_kiwami_mode_mouse_exited() -> void:
	FizzyDrink.descriptionSetting = ""
