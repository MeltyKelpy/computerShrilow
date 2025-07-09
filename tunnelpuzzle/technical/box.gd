class_name box
extends RigidBody3D

var hovered = false

func _process(delta: float) -> void:
	
	if hovered == true:
		$FuncGodotMap/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(1,1,1,1))
	if hovered == false:
		$FuncGodotMap/entity_0_worldspawn/entity_0_mesh_instance.material_overlay.set_shader_parameter("color", Color(0,0,0,0))
	hovered = false
