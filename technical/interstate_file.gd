extends Button

var fileName = ""
var fileType = "" # can be ".png" or ".txt"
var parent
var locked = false
var lockText = ""
var attachedFile = ""

func _process(delta: float) -> void:
	if locked == false:
		$Label.text = fileName+fileType
	else:
		$Label.text = "LOCKED"

func _on_pressed() -> void:
	if locked == true:
		parent._change_text(lockText)
	else:
		if fileType == ".png":
			parent.open_png(attachedFile)
		if fileType == ".txt":
			parent._update_menu(attachedFile)

func _on_mouse_entered() -> void:
	$Label.modulate = Color(1,1,0)

func _on_mouse_exited() -> void:
	$Label.modulate = Color(1,1,1)
