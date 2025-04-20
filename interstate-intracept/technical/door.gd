extends StaticBody3D
class_name door

@export var interactMessage = "Use Door"
@export var lockRequirement = 0
@export var button_to_interact = "interact"
var baseRotation = 0.0
var state = true
var hovered = false
var can = true

func _ready() -> void:
	baseRotation = rad_to_deg(rotation.y)

func shouldOutline():
	hovered = true

func openText():
	var key_name = ""
	
	for action in InputMap.action_get_events(button_to_interact):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
	
	if lockRequirement == 0:
		interactMessage = "Open Door"
		return interactMessage + "\n[" + key_name + "]"
	else:
		interactMessage = "Unlock Door [Requires "+Intracept.hoxboxItems[lockRequirement]["item_name"] + "]"
		return interactMessage + "\n[" + key_name + "]"

func _process(delta: float) -> void:
	if hovered == true:
		$MeshInstance3D.material_overlay.set_shader_parameter("color", Color(1,1,1,1))
	if hovered == false:
		$MeshInstance3D.material_overlay.set_shader_parameter("color", Color(0,0,0,0))
	hovered = false

func interact():
	var doneDid = false
	if lockRequirement != 0:
		if Intracept.hotboxes[Intracept.hotboxSel]["id"] == lockRequirement:
			lockRequirement = 0
			Intracept.reset_box(Intracept.hotboxSel)
	elif lockRequirement == 0:
		if can == true:
			state = !state
			print(state)
			if state == true:
				var tweenie = get_tree().create_tween()
				tweenie.tween_property(self, "rotation", Vector3(rotation.x, deg_to_rad(baseRotation), rotation.z), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
			if state == false:
				var tweenie = get_tree().create_tween()
				tweenie.tween_property(self, "rotation", Vector3(rotation.x, deg_to_rad(baseRotation+90.0), rotation.z), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
			can = false
			$Timer.start()

func _on_timer_timeout() -> void:
	can = true
