extends Node2D

@export var jellyNum = 0
@export var jelly = "Jelly"
@export var rarity = "Queer"
@export var money = 3
@export var seconds = 6
@export var selfDiscoveredVar = false
@export var new = true
var hi = true
@export var room = 0
@export var id = 0
var rng = RandomNumberGenerator.new()

@export var jellyState = ""
var body_entered = false
var canDetect = false

@onready var mouse_pin: PinJoint2D = $MousePin
@onready var fake_body: StaticBody2D = $MousePin/FakeBody
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

var is_dragging = false
var showMoney = 0

var state = 0

var colorsIgLOL = [
	{
	"Common":Color(1, 0.9058823529, 0.8509803922),
	"Uncommon":Color(0.462745098, 0.9529411765, 0.5411764706),
	"Rare":Color(0.9333333333, 0.4196078431, 0.4980392157),
	"Awesome":Color(0.5921568627, 0.4196078431, 0.9333333333),
	"Blue":Color(0.2941176471, 0.4509803922, 1),
	"Ultra Fucking Rare":Color(0.951, 0.544, 0.065),
	},
	]

func findRoom(Laroom):
	room = Laroom.ID

func buy():
	FizzyDrink.jellys += 1
	rigid_body_2d.transform = Transform2D(0.0, Vector2(-600, 100))
	visible = false
	reparent($/root/computerShrilow/Jelly/Control)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	caca2.reparent($/root)
	var chanceForsaken = 2
	if rarity == "Common":
		chanceForsaken = rng.randi_range(1, 4096)
		if chanceForsaken == 1:
			caca2.warn("You bought a Gumball, and you got a SHINY JELLLYLYYYYYY!!!!!!!")
			jelly = "Shiny Jelly"
			rarity = "Ultra Fucking Rare"
			_on_storage_pressed(true)
	if chanceForsaken != 1:
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
		_on_storage_pressed(true)

func setParent():
	reparent($/root/computerShrilow/Jelly/Control)
	# this function avoids a stupid error when loading them in.

func _ready() -> void:
	$nameShit/Name.text = jelly
	$RigidBody2D/jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
	showMoney = money 
	var showSeconds = seconds 
	if FizzyDrink.enabledCrystal == "jelly":
		showMoney = showMoney * 3
		showSeconds = showSeconds / 2
	$nameShit/Stats.text = rarity+"\n"+str(showMoney)+"$ per "+str(seconds)+" Seconds"
	$FirstTimer.wait_time = float(showSeconds - 0.2)
	$SecondTimer.wait_time = 0.2
	$FirstTimer.start()
	$SecondTimer.start()
	mouse_pin.node_a = mouse_pin.get_path_to(fake_body)
	rigid_body_2d.input_pickable = true
	rigid_body_2d.input_event.connect(_on_input_event)
	visible = true
	if rarity != "Queer" and rarity != "Market":
		$RigidBody2D/jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", false)
	elif rarity == "Queer":
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", true)
	elif jelly == "Phantom Jelly":
		$RigidBody2D/jelly.material.set_shader_parameter("line_color", Color(1.0, 0.847, 0.376, 1))
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", false)
	elif jelly == "Antag Jelly":
		$RigidBody2D/jelly.material.set_shader_parameter("line_color", Color(1.0, 0.376, 0.851, 1))
		$RigidBody2D/jelly.material.set_shader_parameter("rainbow", false)
	await get_tree().create_timer(1).timeout
	canDetect = true

func _physics_process(delta: float) -> void:
	
	if Settings.setting_state("animationsOptimization"):
		if !Settings.setting_state("saayo"):
			if body_entered == false:
				jellyState = ""
			$RigidBody2D/jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly"+str(state)+jellyState+".png")
		else:
			$RigidBody2D/jelly.texture = load("res://assets/images/jellies/Plinker Jelly/jelly"+str(state)+".png")
	else:
		if !Settings.setting_state("saayo"):
			$RigidBody2D/jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0"+jellyState+".png")
		else:
			$RigidBody2D/jelly.texture = load("res://assets/images/jellies/Plinker Jelly/jelly0.png")
	
	if Settings.setting_state("jelliesOptimization"):
		rigid_body_2d.set_collision_mask_value(2, false)
	else:
		rigid_body_2d.set_collision_mask_value(2, true)
	
	if jelly == "Phantom Jelly":
		money = round(1 + (1 * (ItemValues.marketItems[id]["CurUpgrade"])))
		seconds = 2
		if id == 0:
			id = 4
	if jelly == "Antag Jelly":
		money = round(3 + (3 * (ItemValues.marketItems[id]["CurUpgrade"])))
		seconds = 4
		if id == 0:
			id = 5
	showMoney = money 
	var showSeconds = seconds
	if room == null:
		_on_storage_pressed(true)
	if FizzyDrink.enabledCrystal == "jelly":
		showMoney = showMoney * 3
		showSeconds = round(showSeconds / 2)
		if showSeconds < 1:
			showSeconds = 0.5
	$nameShit/Stats.text = rarity+"\n"+str(showMoney)+"$ per "+str(showSeconds)+" Seconds"
	$RigidBody2D/mange.rotation = (-1) * $RigidBody2D.rotation
	$RigidBody2D/fingers.rotation = (-1) * $RigidBody2D.rotation
	mouse_pin.global_position = get_global_mouse_position()
	$nameShit.global_position = get_global_mouse_position()
	$FirstTimer.wait_time = float(showSeconds - 0.2)
	$SecondTimer.wait_time = 0.2
	$nameShit/Name.rotation = 0
	$nameShit/Stats.rotation = 0
	if get_node_or_null(^"$/root/computerShrilow"):
		if $/root/computerShrilow.rebirthProtocol == true and rarity == "Market":
			var awesomsmee = {
				"Name":jelly,
				"MoneyGain":money,
				"Seconds":seconds,
				"Rarity":rarity,
				"ID":id
				}
			Game.rebirthJellyProtocol.append(awesomsmee)
			print(Game.rebirthJellyProtocol[Game.rebirthJellyProtocol.size()-1])
			queue_free()

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
	ItemValues.money += showMoney
	Interstate.totalmoney += showMoney
	if Settings.setting_state("animationsOptimization"):
		$RigidBody2D/Squeak.play()
		state = 1
		$SecondTimer.start()

func _on_second_timer_timeout() -> void:
	if Settings.setting_state("animationsOptimization"):
		state = 0
		$FirstTimer.start()

func _jelly_spawn() -> void:
	visible = true

func _on_kill_pressed() -> void:
	var moneyTo = 0
	if rarity == "Common":
		moneyTo = 100
	if rarity == "Uncommon":
		moneyTo = 300
	if rarity == "Rare":
		moneyTo = 600
	if rarity == "Awesome":
		moneyTo = 1000
	if rarity == "Queer":
		moneyTo = 5000
	if rarity == "Blue":
		moneyTo = 1000000
	if rarity != "Market":
		FizzyDrink.jellys -= 1
		if room != null:
			$/root/computerShrilow/Jelly/rooms.get_child(room).jellyCount -= 1
		$RigidBody2D.visible = false
		$nameShit.visible = false
		$RigidBody2D/Squeak.volume_db = -80
		var cacapoopyGOD = load("res://technical/moneyGet.tscn")
		var caca = cacapoopyGOD.instantiate()
		add_child(caca)
		caca.determine(moneyTo)
		caca.position.x = rigid_body_2d.position.x
		caca.position.y = rigid_body_2d.position.y
		ItemValues.money += moneyTo
		Interstate.totalmoney += moneyTo
		$RigidBody2D/mange.visible = false
		$deathTime.start()

func _on_death_time_timeout() -> void:
	queue_free()

func _on_change_floor_pressed(ID) -> void:
	rigid_body_2d.transform = Transform2D($/root/computerShrilow/Jelly/rooms.get_child(ID-1).position.x + 100, Vector2(0, 100+((ID * 1300) + 1600)))
	print(100+((ID * 1300) + 1600))
	rigid_body_2d.rotation = 0

func _on_storage_pressed(type) -> void:
	if jelly == "Phantom Jelly":
		money = round(1 + (1 * (ItemValues.marketItems[id]["CurUpgrade"] / 2)))
		seconds = 2
	if jelly == "Antag Jelly":
		money = round(3 + (3 * (ItemValues.marketItems[id]["CurUpgrade"] / 2)))
		seconds = 4
	if type == false:
		$/root/computerShrilow/Jelly/rooms.get_child(room).jellyCount -= 1
	var awesomsmee = {
		"Name":jelly,
		"MoneyGain":money,
		"Seconds":seconds,
		"Rarity":rarity,
		"ID":id
		}
	Jelly.storedJellys.resize(Jelly.storedJellys.size()+1)
	Jelly.storedJellys[Jelly.storedJellys.size()-1] = awesomsmee
	print(Jelly.storedJellys[Jelly.storedJellys.size()-1])
	queue_free()

func _on_proximity_body_entered(body: Node2D) -> void:
	var parent = body.get_parent()
	if body.name == "RigidBody2D":
		body_entered = true
		if parent.jelly == "Bun Lovebird Jelly" and jelly == "Bug Lovebird Jelly":
			jellyState = "blush"
		elif parent.jelly == "Bug Lovebird Jelly" and jelly == "Bun Lovebird Jelly":
			jellyState = "blush"
		elif parent.jelly == "Biblically Accurate Peanut Butter" and jelly == "Dude Jelly":
			$RigidBody2D/fingers.texture = load("res://assets/images/jellies/Dude Jelly/finger.png")
			$RigidBody2D/fingers.visible = true
		elif parent.jelly == "Replink Jelly" and jelly == "Plinker Jelly":
			jellyState = "blush"
		elif parent.jelly == "Wing Jelly" and jelly == "Dude Jelly":
			jellyState = "angry"
		elif parent.jelly == "Plinker Jelly" and jelly == "Replink Jelly":
			jellyState = "blush"
		elif parent.jelly == "Second Life Jelly" and jelly == "Double Jelly":
			jellyState = "blush"
		elif parent.jelly == "Double Jelly" and jelly == "Second Life Jelly":
			jellyState = "blush"
		elif parent.jelly == "Domino Jelly" and jelly == "Double Jelly":
			jellyState = "secondlife"
		elif parent.jelly == "Plinker Jelly" and jelly == "Bun Lovebird Jelly":
			$RigidBody2D/fingers.texture = load("res://assets/images/jellies/Bun Lovebird Jelly/finger.png")
			$RigidBody2D/fingers.visible = true
		elif parent.jelly == "Bun Lovebird Jelly" and jelly == "Plinker Jelly":
			$RigidBody2D/fingers.texture = load("res://assets/images/jellies/Plinker Jelly/finger.png")
			$RigidBody2D/fingers.visible = true
		elif jelly == "Bug Lovebird Jelly":
			if canDetect == true:
				jellyState = "touch"
		else:
			jellyState = ""

func _on_proximity_body_exited(body: Node2D) -> void:
	if body.name == "RigidBody2D":
		if (body.get_parent().jelly == "Plinker Jelly" and jelly == "Bun Lovebird Jelly") or (body.get_parent().jelly == "Bun Lovebird Jelly" and jelly == "Plinker Jelly") or (body.get_parent().jelly == "Biblically Accurate Peanut Butter" and jelly == "Dude Jelly"):
			$RigidBody2D/fingers.visible = false
		body_entered = false
		jellyState = ""
