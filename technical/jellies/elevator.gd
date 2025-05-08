extends Node2D

var loco = "Lobby"
var loco_id = 0
var posX = 0
var posY = 0

func _on_button_pressed() -> void:
	if loco == "Lobby":
		posX = -1324
		posY = 324
		FizzyDrink.scrollLimitRIGHT = -576
		FizzyDrink.scrollLimitLEFT = -1324
	else:
		var hi = $/root/computerShrilow/Jelly/rooms.get_child(loco_id)
		posX = hi.camXpos
		posY = hi.camYpos
		FizzyDrink.scrollLimitRIGHT = hi.maxRIGHT
		FizzyDrink.scrollLimitLEFT = hi.maxLEFT
		print(FizzyDrink.scrollLimitRIGHT)
		print(FizzyDrink.scrollLimitLEFT)
	$/root/computerShrilow.cameraAnimation("elevator", posX, posY, true)

#var appendage = []
#
#func _on_button_pressed() -> void:
	#if $bg.visible == false:
		#$bg.visible = true
		#var cacaPoopyFUCK2 = load("res://technical/jellies/floor.tscn")
		#var caca2 = cacaPoopyFUCK2.instantiate()
		#caca2.naame = "Lobby"
		#caca2.jelly = ""
		#caca2.posX = -1324
		#caca2.posY = 324
		#add_child(caca2)
		#appendage.append(caca2)
		#caca2.reparent($ScrollContainer/GridContainer)
		#for i in $/root/computerShrilow/Jelly/rooms.get_child_count():
			#var hi = $/root/computerShrilow/Jelly/rooms.get_child(i)
			#var cacaPoopyFUCK = load("res://technical/jellies/floor.tscn")
			#var caca = cacaPoopyFUCK.instantiate()
			#print(hi)
			#caca.naame = hi.Aname
			#caca.type = hi.type
			#caca.maxJells = hi.maxJel
			#caca.jelly = hi.jellyCount
			#caca.posX = hi.camXpos
			#caca.posY = hi.camYpos
			#caca.hi = hi
			#caca.ID = i
			#add_child(caca)
			#caca.reparent($ScrollContainer/GridContainer)
			#appendage.append(caca)
	#else:
		#_on_area_2d_mouse_entered()
#
#func _on_area_2d_mouse_entered() -> void:
	#if not Rect2(Vector2(), $Button.size).has_point(get_local_mouse_position()):
		#$bg.visible = false
		#for i in appendage.size():
			#appendage[i].queue_free()
		#appendage.resize(0)
