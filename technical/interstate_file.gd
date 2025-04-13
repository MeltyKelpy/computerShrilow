extends Label

var fileName = ""
var fileType = "" # can be ".png" or ".txt"
var parent
var id
var locked = false
var lockText = ""
var attachedFile = ""

func _process(delta: float) -> void:
	if locked == false:
		text = fileName+fileType
	else:
		text = "LOCKED"
	
	if parent.selectedFile == id:
		modulate = Color(1,1,0)
		if parent.line_edit.text.containsn("OPEN") and Input.is_action_just_pressed("Enter"):
			_on_pressed()
	else:
		modulate = Color(1,1,1)

func _on_pressed() -> void:
	if locked == true:
		parent._change_text(lockText)
	else:
		if fileType == ".png":
			parent.open_png(fileName, attachedFile)
		if fileType == ".txt":
			parent._update_menu(attachedFile, true)
