extends Node2D

var appendage = []

func _on_button_pressed() -> void:
	if $bg.visible == false:
		$bg.visible = true
		var cacaPoopyFUCK2 = load("res://technical/jellies/floor.tscn")
		var caca2 = cacaPoopyFUCK2.instantiate()
		caca2.naame = "Lobby"
		caca2.jelly = ""
		caca2.posX = -1324
		caca2.posY = 324
		add_child(caca2)
		appendage.append(caca2)
		caca2.reparent($ScrollContainer/GridContainer)
		for i in $/root/computerShrilow/Jelly/rooms.get_child_count():
			var hi = $/root/computerShrilow/Jelly/rooms.get_child(i)
			var cacaPoopyFUCK = load("res://technical/jellies/floor.tscn")
			var caca = cacaPoopyFUCK.instantiate()
			print(hi)
			caca.naame = hi.Aname
			caca.jelly = hi.jellyCount
			caca.posX = hi.camXpos
			caca.posY = hi.camYpos
			caca.hi = hi
			add_child(caca)
			caca.reparent($ScrollContainer/GridContainer)
			appendage.append(caca)
	else:
		_on_area_2d_mouse_entered()

func _on_area_2d_mouse_entered() -> void:
	if not Rect2(Vector2(), $Button.size).has_point(get_local_mouse_position()):
		$bg.visible = false
		for i in appendage.size():
			appendage[i].queue_free()
		appendage.resize(0)
