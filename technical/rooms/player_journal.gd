extends Node2D


func _process(delta: float) -> void:
	$ScrollContainer/Label2.text = Journal.entries[Journal.selectedJournal]["EntryName"]+"\n\n"+Journal.entries[Journal.selectedJournal]["Text"]
