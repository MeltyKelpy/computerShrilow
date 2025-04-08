extends Node2D

var ID = 0
var evil = 0

func buy():
	reparent($/root/computerShrilow/ShrilowScreen/puppies)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a Greasepuppy! you now have "+str(FizzyDrink.greasepuppies+1))

func getPuppy(hi):
	evil = hi
	position.x = 850
	position.y = 544 + (-199 * hi)

func _process(delta: float) -> void:
	if evil > 7:
		visible = false
		queue_free()
	if $Timer.time_left == 0 and $Timer2.time_left == 0:
		$Timer.start()

func getID(num):
	ID = num
	ItemValues.itemInfomation[num]["Owned"] = false
	ItemValues.shopTUTORIAL[0]["Owned"] = false

func _update(type):
	if type == true:
		$puppy.texture = load("res://assets/images/items/gp1.png")
	else:
		$puppy.texture = load("res://assets/images/items/gp0.png")
