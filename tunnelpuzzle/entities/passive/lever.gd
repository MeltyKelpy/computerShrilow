class_name lever extends StaticBody3D

@export var attached_door : Node3D
@export var interactMessage = "Use Lever"
@export var button_to_interact = "interact"
var state = 0
var hovered

func shouldOutline():
	if state == 0:
		hovered = true

func _ready() -> void:
	if attached_door != null:
		attached_door.amount_of_levers += 1

func _process(delta: float) -> void:
	if hovered == true:
		$lever/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(1,1,1,1))
		$base/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(1,1,1,1))
	if hovered == false:
		$lever/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(0,0,0,0))
		$base/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(0,0,0,0))
	hovered = false

func buttonShouldPress():
	if state == 0:
		var key_name = ""
		
		for action in InputMap.action_get_events(button_to_interact):
			if action is InputEventKey:
				key_name = action.as_text_physical_keycode()
				break
		
		return interactMessage + "\n[" + key_name + "]"
	else:
		return ""

func interact():
	if state != 1:
		state = 1
		attached_door.progress += 1
		$AnimationPlayer.play("flip")
