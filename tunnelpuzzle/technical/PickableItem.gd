class_name PickableItem extends Node3D

@export var id = 1
@export var itemStack = 1
@export var interactMessage = "Pick Up"
@export var button_to_interact = "interact"
var hovered = false

func shouldOutline():
	hovered = true

func _process(delta: float) -> void:
	
	if ResourceLoader.exists("res://tunnelpuzzle/assets/ui/pick_up/"+Tunnelpuzzle.hoxboxItems[id]["held_img_id"]+".png"):
		$item.texture = load("res://tunnelpuzzle/assets/ui/pick_up/"+Tunnelpuzzle.hoxboxItems[id]["held_img_id"]+".png")
		$item.visible = true
		$MeshInstance3D.visible = false
	else:
		$item.visible = false
		$MeshInstance3D.visible = true
	
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
		return interactMessage + " " + Tunnelpuzzle.hoxboxItems[id]["item_name"] + "\n[" + key_name + "]"
	else:
		return interactMessage + " " + Tunnelpuzzle.hoxboxItems[id]["item_name"] + "(" + str(itemStack) + ")\n[" + key_name + "]"

func interact():
	if Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"] != 1:
		var newId = Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"]
		var placements = Tunnelpuzzle.hotboxSel
		if Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"] != 0 and Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"] != id:
			for i in Tunnelpuzzle.hotboxes.size():
				if Tunnelpuzzle.hotboxes[i]["id"] == 0:
					newId = 0
					placements = i
					break
			_sett(newId, placements)
		else:
			_sett(newId, placements)

func _sett(newId : int, placements : int):
	if Tunnelpuzzle.hotboxes[placements]["id"] != id:
		var newStack = Tunnelpuzzle.hotboxes[placements]["stack"]
		Tunnelpuzzle.hotboxes[placements]["stack"] = itemStack
		itemStack = newStack
	if Tunnelpuzzle.hotboxes[placements]["stack"] < 5 and Tunnelpuzzle.hotboxes[placements]["id"] == id:
		Tunnelpuzzle.hotboxes[placements]["stack"] += itemStack
		itemStack = Tunnelpuzzle.hotboxes[placements]["stack"] - 5
		Tunnelpuzzle.hotboxes[placements]["stack"] -= itemStack
		newId = id
	else:
		Tunnelpuzzle.hotboxes[placements]["id"] = id
	
	if itemStack == 0:
		newId = 0 
	
	if newId == 0:
		queue_free()
	else:
		id = newId
