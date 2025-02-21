extends Node2D


func _process(delta: float) -> void:
	$ScrollContainer/Label2.text = Journal.entries[Journal.selectedJournal]["EntryName"]+"\n\n"+Journal.entries[Journal.selectedJournal]["Text"]

func _on_back_button_ward_pressed() -> void:
	queue_free()
