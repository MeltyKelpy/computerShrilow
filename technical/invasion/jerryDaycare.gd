extends Node2D

@onready var mouse_pin: PinJoint2D = $MousePin
@onready var fake_body: StaticBody2D = $MousePin/FakeBody
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

var is_dragging = false
var fuckyou = false

func _ready() -> void:
	mouse_pin.node_a = mouse_pin.get_path_to(fake_body)
	rigid_body_2d.input_pickable = true
	rigid_body_2d.input_event.connect(_on_input_event)
	visible = true

func _physics_process(delta: float) -> void:
	mouse_pin.global_position = get_global_mouse_position()
	$nameShit.global_position = get_global_mouse_position()
	$nameShit/Name.rotation = 0
	
	if abs(rigid_body_2d.linear_velocity.x) > 10 or abs(rigid_body_2d.linear_velocity.y) > 10:
		$RigidBody2D/Jerry.play("squirm")
	elif $RigidBody2D.sleeping == false:
		$RigidBody2D/Jerry.play("base")

func _unhandled_input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseButton and not event.is_pressed():
		if event.get_button_index() == 1:
			mouse_pin.node_b = NodePath()
			is_dragging = false
			rigid_body_2d.angular_damp = 0
			$nameShit/Name.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not is_dragging and event is InputEventMouseButton and event.is_pressed():
		if event.get_button_index() == 1:
			mouse_pin.node_b = mouse_pin.get_path_to(rigid_body_2d)
			is_dragging = true
			rigid_body_2d.angular_damp = 10
			$nameShit/Name.visible = true

func _jelly_spawn() -> void:
	visible = true


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if abs(rigid_body_2d.linear_velocity.x) > 200 or abs(rigid_body_2d.linear_velocity.y) > 200:
		$RigidBody2D.lock_rotation = true
		$RigidBody2D.freeze = true
		$RigidBody2D.sleeping = true
		$RigidBody2D.linear_velocity.x = 0
		$RigidBody2D.linear_velocity.y = 0
		$RigidBody2D.gravity_scale = 0
		$RigidBody2D/Jerry.play("squirm")
		if fuckyou == false:
			$RigidBody2D/Jerry.play("squirm")
			$AudioStreamPlayer2D.play()
			$RigidBody2D/Explosion.visible = true
			mouse_pin.node_b = NodePath()
			is_dragging = false
			rigid_body_2d.angular_damp = 0
			$nameShit/Name.visible = false
			fuckyou = true
			$RigidBody2D/Explosion.play("anim")
			$nameShit.visible = false
			await get_tree().create_timer(0.9).timeout
			$RigidBody2D/Jerry.visible = false
			await get_tree().create_timer(0.4).timeout
			$RigidBody2D/Explosion.visible = false
			await get_tree().create_timer(1).timeout
			queue_free()
