extends StaticBody3D
class_name door

@export var interactMessage = "Open Door"
@export var lockRequirement = 0
@export var button_to_interact = "interact"
var state = true
var hovered = false
var can = true

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
				$AnimationPlayer.play("close")
			if state == false:
				$AnimationPlayer.play("open")
			can = false
			$Timer.start()

func _on_timer_timeout() -> void:
	can = true
