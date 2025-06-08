extends Node2D

func _ready() -> void:
	if get_node_or_null(^"/root/computerShrilow/Camera2D"):
		ItemValues.money += $/root/computerShrilow.gambleTickets[$/root/computerShrilow.selTicket]["Cost"]
	else:
		queue_free()
	Game.warn("well, thats your money back! okay!")

func getID(id):
	pass
