extends TextureRect

var parent
var caller = "Phantom"
var id = 0000

func _ready() -> void:
	$caller.text = caller+" >> "+str(id)

func _process(delta: float) -> void:
	if parent != null:
		if parent.cur_screen == "contacts":
			$Button.mouse_filter = 1
		else:
			$Button.mouse_filter = 0

func _on_button_pressed() -> void:
	print("uhhmmm hello?")
	if parent != null:
		parent.caller_id = id
		parent.make_call()
