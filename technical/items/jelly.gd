extends Node2D

var jellyNum = 0

@onready var mouse_pin: PinJoint2D = $MousePin
@onready var fake_body: StaticBody2D = $MousePin/FakeBody
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

var is_dragging = false

func _ready() -> void:
	mouse_pin.node_a = mouse_pin.get_path_to(fake_body)
	rigid_body_2d.input_pickable = true
	rigid_body_2d.input_event.connect(_on_input_event)
	#reparent($/root/computerShrilow/ShrilowScreen/Control)
	#var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	#var caca2 = cacapoopyGOD3.instantiate()
	#add_child(caca2)
	#caca2.reparent($/root)
	#caca2.position.x = 0
	#caca2.position.y = 0
	#caca2.warn("You bought a Jelly! you now have "+str(FizzyDrink.jellys + 2))

func _physics_process(delta: float) -> void:
	mouse_pin.global_position = get_global_mouse_position()

func _unhandled_input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseButton and not event.is_pressed():
		mouse_pin.node_b = NodePath()
		is_dragging = false
		rigid_body_2d.angular_damp = 0

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not is_dragging and event is InputEventMouseButton and event.is_pressed():
		mouse_pin.node_b = mouse_pin.get_path_to(rigid_body_2d)
		is_dragging = true
		rigid_body_2d.angular_damp = 10

func getID(num):
	ItemValues.itemInfomation[num]["Owned"] = false

func getJelly(num):
	print(num)
	jellyNum = num
	#position.x = 850
	#position.y = 0

func _on_timer_timeout() -> void:
	$Squeak.play()
	$RigidBody2D/jelly.texture = load("res://assets/images/items/jelly1.png")
	ItemValues.money += 1
	$SecondTimer.start()

func _on_second_timer_timeout() -> void:
	$RigidBody2D/jelly.texture = load("res://assets/images/items/jelly0.png")
	$FirstTimer.start()
