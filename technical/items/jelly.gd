extends Node2D

var jellyNum = 0
var jelly = "Retarded Gambler Jelly"
var rarity = "Uncommon"
var money = 3
var seconds = 6

@onready var mouse_pin: PinJoint2D = $MousePin
@onready var fake_body: StaticBody2D = $MousePin/FakeBody
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

var is_dragging = false

var colorsIgLOL = [
	{
	"Common":Color(1, 0.9058823529, 0.8509803922),
	"Uncommon":Color(0.462745098, 0.9529411765, 0.5411764706),
	"Rare":Color(0.9333333333, 0.4196078431, 0.4980392157),
	"Awesome":Color(0.5921568627, 0.4196078431, 0.9333333333),
	},
	]

func _ready() -> void:
	$FirstTimer.wait_time = seconds - 0.2
	$SecondTimer.wait_time = 0.2
	$FirstTimer.start()
	$SecondTimer.start()
	visible = false
	mouse_pin.node_a = mouse_pin.get_path_to(fake_body)
	rigid_body_2d.input_pickable = true
	rigid_body_2d.input_event.connect(_on_input_event)
	reparent($/root/computerShrilow/Jelly/Control)
	rigid_body_2d.transform = Transform2D(0.0, Vector2(-600, 100))
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	caca2.warn("You bought a Gumball, and you got a "+rarity+" Jelly!")
	$nameShit/Name.text = jelly
	$nameShit/Stats.text = rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"
	if rarity != "Queer":
		$RigidBody2D/jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", false)
	else:
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", true)

func _physics_process(delta: float) -> void:
	mouse_pin.global_position = get_global_mouse_position()
	$nameShit.global_position = get_global_mouse_position()
	$nameShit/Name.rotation = 0
	$nameShit/Stats.rotation = 0

func _unhandled_input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseButton and not event.is_pressed():
		mouse_pin.node_b = NodePath()
		is_dragging = false
		rigid_body_2d.angular_damp = 0
		$nameShit/Name.visible = false
		$nameShit/Stats.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not is_dragging and event is InputEventMouseButton and event.is_pressed():
		mouse_pin.node_b = mouse_pin.get_path_to(rigid_body_2d)
		is_dragging = true
		rigid_body_2d.angular_damp = 10
		$nameShit/Name.visible = true
		$nameShit/Stats.visible = true

func getID(num):
	ItemValues.itemInfomation[num]["Owned"] = false

func getJelly(num):
	print(num)
	jellyNum = num
	#position.x = 850
	#position.y = 0

func _on_timer_timeout() -> void:
	$RigidBody2D/Squeak.play()
	$RigidBody2D/jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly1.png")
	ItemValues.money += money
	$SecondTimer.start()

func _on_second_timer_timeout() -> void:
	$RigidBody2D/jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
	$FirstTimer.start()

func _jelly_spawn() -> void:
	visible = true
