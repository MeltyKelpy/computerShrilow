extends Node2D

@export var assignedElevator : Node
var appendage = []
var search_query : String

func _process(delta: float) -> void:
	if appendage.size() == 0:
		$tvBack/Screen/ColorRect2/Label.visible = true
	else:
		$tvBack/Screen/ColorRect2/Label.visible = false
	if $/root/computerShrilow/Jelly/rooms != null:
		if $/root/computerShrilow/Jelly/rooms.get_child_count() > appendage.size():
			repo_management("destory")
	$tvBack/Screen/Label2.text = "Destination: "+str(assignedElevator.loco)

func repo_management(type):
	if type == "create":
		for i in $/root/computerShrilow/Jelly/rooms.get_child_count():
			var hi = $/root/computerShrilow/Jelly/rooms.get_child(i)
			var cacaPoopyFUCK = load("res://technical/jellies/floor.tscn")
			var caca = cacaPoopyFUCK.instantiate()
			var namie : String = hi.Aname
			var search = $tvBack/Screen/LineEdit.text
			if namie.containsn(search) or search == "":
				caca.naame = hi.Aname
				caca.type = hi.type
				caca.maxJells = hi.maxJel
				caca.assignedElevator = assignedElevator
				caca.jelly = hi.jellyCount
				caca.posX = hi.camXpos
				caca.posY = hi.camYpos
				caca.hi = hi
				caca.ID = i
				add_child(caca)
				caca.reparent($tvBack/Screen/ScrollContainer/VBoxContainer)
				appendage.append(caca)
	if type == "destory":
		for i in appendage.size():
			appendage[i].queue_free()
		appendage.resize(0)
		repo_management("create")

func _on_line_edit_text_changed(new_text: String) -> void:
	repo_management("destory")
