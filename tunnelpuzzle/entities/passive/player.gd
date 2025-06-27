extends CharacterBody3D

var SPEED = 2.0
const JUMP_VELOCITY = 4.5

const HEADBOB_FREQ = 2.0
const HEADBOB_AMP = 0.04
var t_headbob = 0.0

var health = 100.0
var stamina = 100.0

var ui_toggled = true
var ui_toggled2 = true

var hotboxes = [
	]

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_sens = 0.005

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Tunnelpuzzle.hotboxes = []
	for i in range(0, Tunnelpuzzle.amountOfHotboxes):
		var cFUCK = Sprite2D.new()
		cFUCK.texture = load("res://tunnelpuzzle/assets/ui/invBox.png")
		cFUCK.scale = Vector2(0.8,0.8)
		cFUCK.position.y = 450.8
		cFUCK.position.x = 248.0 + (98 * i)
		$CanvasLayer/Boxes.add_child(cFUCK)
		var cFUCK2 = Sprite2D.new()
		cFUCK2.texture = load("res://tunnelpuzzle/assets/ui/itemPrev/blank.png")
		cFUCK2.scale = Vector2(0.8,0.8)
		cFUCK2.position.y = 450.8
		cFUCK2.position.x = 248.0 + (98 * i)
		$CanvasLayer/Boxes.add_child(cFUCK2)
		var cFUCK3 = Sprite2D.new()
		cFUCK3.texture = load("res://tunnelpuzzle/assets/ui/itemPrev/0.png")
		cFUCK3.scale = Vector2(0.8,0.8)
		cFUCK3.position.y = 450.8
		cFUCK3.position.x = 248.0 + (98 * i)
		$CanvasLayer/Boxes.add_child(cFUCK3)
		hotboxes.append({"box":cFUCK, "box_img":cFUCK2, "amount_img":cFUCK3})
		Tunnelpuzzle.hotboxes.append({"id":0,"stack":0})

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("toggleUI"):
		ui_toggled = !ui_toggled
	if Input.is_action_just_pressed("toggleUIItem"):
		ui_toggled = !ui_toggled
		ui_toggled2 = ui_toggled
	
	$CanvasLayer.visible = ui_toggled
	$Neck/heldItem.visible = ui_toggled2
	
	for i in range(0, hotboxes.size()):
		if i == Tunnelpuzzle.hotboxSel:
			hotboxes[i]["box"].texture = load("res://tunnelpuzzle/assets/ui/invBoxSel.png")
		else:
			hotboxes[i]["box"].texture = load("res://tunnelpuzzle/assets/ui/invBox.png")
			
		hotboxes[i]["box_img"].texture = load("res://tunnelpuzzle/assets/ui/itemPrev/"+str(Tunnelpuzzle.hoxboxItems[Tunnelpuzzle.hotboxes[i]["id"]]["small_img_id"])+".png")
		if Tunnelpuzzle.hoxboxItems[Tunnelpuzzle.hotboxes[i]["id"]]["stackable"] == true:
			hotboxes[i]["amount_img"].texture = load("res://tunnelpuzzle/assets/ui/itemPrev/"+str(Tunnelpuzzle.hotboxes[i]["stack"])+".png")
		else:
			hotboxes[i]["amount_img"].texture = load("res://tunnelpuzzle/assets/ui/itemPrev/0.png")
	
	if Input.is_action_just_pressed("Click"):
		if Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"] == 5:
			if health < 100:
				health += 25
				Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["stack"] -= 1
				if Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["stack"] == 0:
					Tunnelpuzzle.reset_box(Tunnelpuzzle.hotboxSel)
	
	#if Input.is_action_just_pressed("DebugMode"):
		#health -= 25
	
	$CanvasLayer/Label.text = Tunnelpuzzle.hoxboxItems[Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"]]["item_name"]
	$Neck/heldItem.texture = load("res://tunnelpuzzle/assets/ui/shit_u_hold/"+Tunnelpuzzle.hoxboxItems[Tunnelpuzzle.hotboxes[Tunnelpuzzle.hotboxSel]["id"]]["held_img_id"]+".png")
	
	$CanvasLayer/Bars/HealthBar.value = health
	$CanvasLayer/Bars/StamBar.value = stamina

func _physics_process(delta):
	t_headbob += delta * velocity.length() * float(is_on_floor())
	$Neck/Vision.transform.origin = _headbob(t_headbob)
	$Neck/RayCast3D.transform.origin = _headbob(t_headbob)
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("scrollDown"):
		Tunnelpuzzle.hotboxSel -= 1
	if Input.is_action_just_pressed("scrollUp"):
		Tunnelpuzzle.hotboxSel += 1
	
	for i in range(0,8):
		if i > Tunnelpuzzle.amountOfHotboxes:
			break
		elif Input.is_action_just_pressed(str(i+1)):
			Tunnelpuzzle.hotboxSel = i
	
	if Input.is_action_pressed("crouch"):
		
		SPEED = 1.0
		
		$mainCol.disabled = true
		
		var desiredpos = Vector3(0, -0.46, 0)
		
		var FOVTWEEN = create_tween()
		FOVTWEEN.tween_property($Neck/Vision, "fov", 60.0, 0.4).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		
		var SLIDETWEEN = create_tween()
		SLIDETWEEN.tween_property($Neck, "position", desiredpos, 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		
	else:
		$mainCol.disabled = false
		
		var desiredpos = Vector3(0, 0.55, 0)
		
		var SLIDETWEEN = create_tween()
		SLIDETWEEN.tween_property($Neck, "position", desiredpos, 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		
		if Input.is_action_pressed("run") and stamina > 0:
			
			var FOVTWEEN = create_tween()
			FOVTWEEN.tween_property($Neck/Vision, "fov", 85.0, 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
			
			SPEED = 5.0
			
		else:
			
			var FOVTWEEN = create_tween()
			FOVTWEEN.tween_property($Neck/Vision, "fov", 75.0, 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
			
			SPEED = 2.0
	
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = ($Neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var delta2 = delta * 2
	if direction:
		if Input.is_action_pressed("run") and !Input.is_action_pressed("crouch"):
			if stamina > 0:
				stamina -= 0.2
		else:
			if stamina < 100:
				stamina += 0.25
			else:
				stamina = 100
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if stamina < 100:
			stamina += 0.25
		else:
			stamina = 100
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * HEADBOB_FREQ) * HEADBOB_AMP
	pos.x = cos(time * HEADBOB_FREQ / 2) * HEADBOB_AMP
	return pos

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			$Neck.rotate_y(-event.relative.x * mouse_sens)
			$Neck/Vision.rotate_x(-event.relative.y * mouse_sens)
			$Neck/Vision.rotation.x = clamp($Neck/Vision.rotation.x, deg_to_rad(-70), deg_to_rad(70))
			$Neck/RayCast3D.rotate_x(-event.relative.y * mouse_sens)
			$Neck/RayCast3D.rotation.x = clamp($Neck/RayCast3D.rotation.x, deg_to_rad(-70), deg_to_rad(70))
			$Neck/heldItem.rotation.x = clamp($Neck/RayCast3D.rotation.x, deg_to_rad(-70), deg_to_rad(70))
