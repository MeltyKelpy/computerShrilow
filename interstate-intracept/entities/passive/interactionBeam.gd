extends RayCast3D

@onready var prompt = $"../../CanvasLayer/pick"

func _physics_process(delta: float) -> void:
	prompt.text = ""
	
	if (is_colliding()):
		var collider = get_collider()
		
		if collider is PickableItem:
			prompt.text = collider.buttonShouldPress()
			collider.shouldOutline()
			
			if Input.is_action_just_pressed(collider.button_to_interact):
				collider.interact()
