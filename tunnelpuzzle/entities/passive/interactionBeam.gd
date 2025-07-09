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
		
		if collider is lever:
			prompt.text = collider.buttonShouldPress()
			collider.shouldOutline()
			
			if Input.is_action_just_pressed(collider.button_to_interact):
				collider.interact()
		
		if collider is door:
			prompt.text = collider.openText()
			collider.shouldOutline()
			
			if Input.is_action_just_pressed(collider.button_to_interact):
				collider.interact()
		
		if collider is box:
			collider.hovered = true
			
			if Input.is_action_just_pressed("interact"):
				var hi = get_parent().get_parent()
				hi.pickedObj = collider 
			elif !Input.is_action_pressed("interact"):
				prompt.text = "Hold [E] to Drag"
