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
	var silly = 1
	var rarity = "hi"
	
	for action in InputMap.action_get_events(button_to_interact):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
	
	if silly == 1:
		return interactMessage + " " + Intracept.hoxboxItems[id]["item_name"] + "\n[" + key_name + "]"
	else:
		return interactMessage + " " + Intracept.hoxboxItems[id]["item_name"] + "(" + str(silly) + ")\n[" + key_name + "]"

func interact():
	var newId = Intracept.hotboxes[Intracept.hotboxSel]
	var placement = Intracept.hotboxSel
	if Intracept.hotboxes[Intracept.hotboxSel] != 0:
		for i in Intracept.hotboxes.size():
			if Intracept.hotboxes[i] == 0:
				newId = 0
				placement = i
				break
	Intracept.hotboxes[placement] = id
	if newId == 0:
		queue_free()
	else:
		id = newId
