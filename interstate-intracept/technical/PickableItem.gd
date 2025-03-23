extends Node3D
class_name PickableItem

@export var id = 1
@export var itemStack = 1
@export var interactMessage = "Pick Up"
@export var button_to_interact = "interact"
var hovered = false

func shouldOutline():
	hovered = true

func _process(delta: float) -> void:
	if hovered == true:
		$MeshInstance3D.material_overlay.set_shader_parameter("color", Color(1,1,1,1))
	if hovered == false:
		$MeshInstance3D.material_overlay.set_shader_parameter("color", Color(0,0,0,0))
	hovered = false

func buttonShouldPress():
	var key_name = ""
	
	for action in InputMap.action_get_events(button_to_interact):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
	
	if itemStack == 1:
		return interactMessage + " " + Intracept.hoxboxItems[id]["item_name"] + "\n[" + key_name + "]"
	else:
		return interactMessage + " " + Intracept.hoxboxItems[id]["item_name"] + "(" + str(itemStack) + ")\n[" + key_name + "]"

func interact():
	# BROKEN ASS STACK CODE OOPS
	var newId = Intracept.hotboxes[Intracept.hotboxSel]["id"]
	var placements = Intracept.hotboxSel
	if Intracept.hotboxes[Intracept.hotboxSel]["id"] != 0 and Intracept.hotboxes[Intracept.hotboxSel]["id"] != id:
		for i in Intracept.hotboxes.size():
			if Intracept.hotboxes[i]["id"] == 0:
				newId = 0
				placements = i
				break
		_sett(newId, placements)
	elif Intracept.hotboxes[Intracept.hotboxSel]["id"] == id:
		if Intracept.hotboxes[Intracept.hotboxSel]["stack"] < 5:
			var toAdd = itemStack - Intracept.hotboxes[Intracept.hotboxSel]["stack"]
			Intracept.hotboxes[Intracept.hotboxSel]["stack"] += toAdd
			itemStack = Intracept.hotboxes[Intracept.hotboxSel]["stack"] - 5
			Intracept.hotboxes[Intracept.hotboxSel]["stack"] -= itemStack
			if itemStack > 0:
				newId = id
				_sett(newId, placements)
			else:
				newId = 0
				_sett(newId, placements)
		else:
			_sett(newId, placements)
	else:
		_sett(newId, placements)

func _sett(newId : int, placements : int):
	Intracept.hotboxes[placements]["id"] = id
	if newId == 0:
		queue_free()
	else:
		id = newId
