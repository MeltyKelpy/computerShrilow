extends Node2D

@export var jellyNum = 0
@export var jelly = "Retarded Gambler Jelly"
@export var rarity = "Uncommon"
@export var money = 3
@export var seconds = 6
@export var selfDiscoveredVar = false
@export var new = true
var hi = true

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
	"Blue":Color(0.2941176471, 0.4509803922, 1),
	},
	]

func buy():
	visible = false
	reparent($/root/computerShrilow/Jelly/Control)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	for i in FizzyDrink.melDialogue.size():
		if FizzyDrink.melDialogue[i]["dialogKey"] == "JELLIES":
			FizzyDrink.melDialogue[i]["unlocked"] = true
	if new == true:
		if selfDiscoveredVar == true:
			caca2.warn("You bought a Gumball, and you got a "+rarity+" Jelly!")
		else:
			caca2.warn("You bought a Gumball, and you got a "+rarity+" Jelly, and its one you havent seen before!")
			Game.jellies += 1
			selfDiscoveredVar = true
		new = false
	$nameShit/Name.text = jelly
	$nameShit/Stats.text = rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"
	_on_storage_pressed()

func _ready() -> void:
	reparent($/root/computerShrilow/Jelly/Control)
	$FirstTimer.wait_time = seconds - 0.2
	$SecondTimer.wait_time = 0.2
	$FirstTimer.start()
	$SecondTimer.start()
	mouse_pin.node_a = mouse_pin.get_path_to(fake_body)
	rigid_body_2d.input_pickable = true
	rigid_body_2d.input_event.connect(_on_input_event)
	rigid_body_2d.transform = Transform2D(0.0, Vector2(-600, 100))
	visible = true
	if rarity != "Queer":
		$RigidBody2D/jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", false)
	else:
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", true)

func _physics_process(delta: float) -> void:
	$RigidBody2D/mange.rotation = (-1) * $RigidBody2D.rotation
	mouse_pin.global_position = get_global_mouse_position()
	$nameShit.global_position = get_global_mouse_position()
	$nameShit/Name.rotation = 0
	$nameShit/Stats.rotation = 0

func _unhandled_input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseButton and not event.is_pressed():
		if event.get_button_index() == 1:
			mouse_pin.node_b = NodePath()
			is_dragging = false
			rigid_body_2d.angular_damp = 0
			$nameShit/Name.visible = false
			$nameShit/Stats.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not is_dragging and event is InputEventMouseButton and event.is_pressed():
		if event.get_button_index() == 1:
			mouse_pin.node_b = mouse_pin.get_path_to(rigid_body_2d)
			is_dragging = true
			rigid_body_2d.angular_damp = 10
			$nameShit/Name.visible = true
			$nameShit/Stats.visible = true
		if event.get_button_index() == 2:
			$RigidBody2D/mange.visible = !$RigidBody2D/mange.visible
		if Input.is_action_pressed("SellHOTKEY"):
			_on_kill_pressed()

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

func _on_kill_pressed() -> void:
	$RigidBody2D.visible = false
	$nameShit.visible = false
	$RigidBody2D/Squeak.volume_db = -80
	var moneyTo = 0
	if rarity == "Common":
		moneyTo = 100
	if rarity == "Uncommon":
		moneyTo = 300
	if rarity == "Rare":
		moneyTo = 600
	if rarity == "Awesome":
		moneyTo = 3000
	if rarity == "Queer":
		moneyTo = 7500
	if rarity == "Blue":
		moneyTo = 1000000
	var cacapoopyGOD = load("res://technical/moneyGet.tscn")
	var caca = cacapoopyGOD.instantiate()
	add_child(caca)
	caca.determine(moneyTo)
	caca.position.x = rigid_body_2d.position.x
	caca.position.y = rigid_body_2d.position.y
	ItemValues.money += moneyTo
	$deathTime.start()

func _on_death_time_timeout() -> void:
	queue_free()

func _on_change_floor_pressed() -> void:
	rigid_body_2d.transform = Transform2D(0.0, Vector2(-800, 100+(1 * 1500)))

func _on_storage_pressed() -> void:
	var awesomsmee = {
		"Name":jelly,
		"MoneyGain":money,
		"Seconds":seconds,
		"Rarity":rarity,
		}
	Jelly.storedJellys.resize(Jelly.storedJellys.size()+1)
	Jelly.storedJellys[Jelly.storedJellys.size()-1] = awesomsmee
	print(Jelly.storedJellys[Jelly.storedJellys.size()-1])
	queue_free()
