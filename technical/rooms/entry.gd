extends Panel

@export var entryName = ""
@export var attachedEntry = 0

func _process(delta: float) -> void:
	$Label.text = entryName

func _on_button_pressed() -> void:
	Journal.selectedJournal = attachedEntry
