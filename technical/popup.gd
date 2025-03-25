extends ConfirmationDialog

func create(text : String):
	dialog_text = text

func _on_confirmed():
	var hi = get_parent()
	hi.load = true
	queue_free()
