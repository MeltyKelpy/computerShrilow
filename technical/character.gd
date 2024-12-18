extends Node2D

@export var Name = "Shrilow"
@export var MoneyGain = 1
@export var Speed = 2.0
@export var BaseMoneyGain = MoneyGain
@export var BaseSpeed = Speed
@export var Level = 1
@export var Swings = 3
@export var BasePrice = 150
@export var state = 0
@export var timer = Timer.new()
@export var timer2 = Timer.new()
@export var curSwing = 0
@export var waitTime = 0.000
@export var waitTime2 = 0.000
@export var managing = false
@export var upTokens = 4
@export var ID = 0

@export var speedCost = 0.0
@export var moneyCost = 0.0

@export var mineLevel = 0.0

func listPlacement(num):
	ID = num

func _ready() -> void:
	remove_child(timer)
	remove_child(timer2)
	BaseMoneyGain = MoneyGain
	BaseSpeed = Speed
	$CharName.visible = false
	waitTime = (1.0 / Speed) - ((1.0 / Speed) / 4.0)
	timer.wait_time = waitTime
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", _swingTimerEnd)
	waitTime2 = (1.0 / Speed) / 4.0
	timer2.wait_time = waitTime2
	timer2.one_shot = true
	timer2.autostart = true
	timer2.connect("timeout", _swingTimerRestart)
	add_child(timer)
	add_child(timer2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if timer.time_left == 0 and timer2.time_left == 0:
		timer.start()
	
	var hey = get_parent()
	
	if hey.mineLevel == 1:
		mineLevel = 0.5
	if hey.mineLevel == 2:
		mineLevel = 1
	
	if $CharName.visible == true and Input.is_action_just_pressed("Click"):
		managing = true
		$CharName.visible = false
	
	speedCost = ((Speed / 2) * 500) * Level
	moneyCost = (MoneyGain * 200) * Level
	$ManageMenu/speedUp.text = str(round(speedCost))
	$ManageMenu/moneyUp.text = str(round(moneyCost))
	if hey.mineLevel +1 != 0:
		if hey.selectedPath == 0:
			$ManageMenu/UpgradeInfo.text = "Speed:"+str(float(Speed+((mineLevel)*Speed)))+"\nMoney:"+str(MoneyGain)+"\nLevel:"+str(Level)+"\n\nUpTokens:"+str(upTokens)
		if hey.selectedPath == 1:
			$ManageMenu/UpgradeInfo.text = "Speed:"+str(Speed)+"\nMoney:"+str(float(MoneyGain+((mineLevel)*MoneyGain)))+"\nLevel:"+str(Level)+"\n\nUpTokens:"+str(upTokens)
		$ManageMenu.visible = managing
	else:
		$ManageMenu/UpgradeInfo.text = "Speed:"+str(Speed)+"\nMoney:"+str(MoneyGain)+"\nLevel:"+str(Level)+"\n\nUpTokens:"+str(upTokens)
	
	$CharacterSprite.texture = load("res://assets/images/areas/mines/"+Name+str(state)+".png")
	
	$ManageMenu.visible = managing
	
	if hey.mineLevel + 1 != 0:
		if hey.selectedPath == 0:
			$CharName.text = Name+"\n"+str(MoneyGain)+"$ per "+str(Swings)+" Swings\nSpeed: "+str(float(Speed+((mineLevel)*Speed)))+"\nLevel: "+str(Level)+"\nL-Click to Manage"
		if hey.selectedPath == 1:
			$CharName.text = Name+"\n"+str(float(MoneyGain+((mineLevel)*MoneyGain)))+"$ per "+str(Swings)+" Swings\nSpeed: "+str(Speed)+"\nLevel: "+str(Level)+"\nL-Click to Manage"
	else:
		$CharName.text = Name+"\n"+str(MoneyGain)+"$ per "+str(Swings)+" Swings\nSpeed: "+str(Speed)+"\nLevel: "+str(Level)+"\nL-Click to Manage"

func _on_selection_mouse_entered() -> void:
	if managing == false:
		$CharName.visible = true

func _on_selection_mouse_exited() -> void:
	$CharName.visible = false

func _swingTimerEnd():
	var hey = get_parent()
	if hey.selectedPath == 0:
		waitTime = (1.0 / (Speed+((mineLevel)*Speed))) - ((1.0 / (Speed+((mineLevel)*Speed))) / 4.0)
	else:
		waitTime = (1.0 / Speed) - ((1.0 / Speed) / 4.0)
	timer.wait_time = waitTime
	state = 1
	curSwing += 1
	if curSwing == Swings:
		var cacapoopyGOD = load("res://technical/moneyGet.tscn")
		var caca = cacapoopyGOD.instantiate()
		add_child(caca)
		if hey.selectedPath == 1:
			caca.determine(MoneyGain+(((mineLevel))*MoneyGain))
			ItemValues.money += MoneyGain+(((mineLevel))*MoneyGain)
		else:
			caca.determine(MoneyGain)
			ItemValues.money += MoneyGain
		caca.position.x = -30
		caca.position.y = -70
		curSwing = 0
	timer2.start()

func _swingTimerRestart():
	var hey = get_parent()
	if hey.selectedPath == 0:
		waitTime2 = (1.0 / (Speed+((mineLevel)*Speed))) / 4.0
	else:
		waitTime2 = (1.0 / (Speed+((mineLevel)*Speed))) / 4.0
	timer2.wait_time = waitTime2
	state = 0
	timer.start()

func _on_money_up_button_pressed() -> void:
	if ItemValues.money >= moneyCost and upTokens > 0:
		Level += 1
		upTokens -= 1
		ItemValues.money -= moneyCost
		MoneyGain = MoneyGain + (BaseMoneyGain * 2)

func _on_money_up_button_mouse_entered() -> void:
	$ManageMenu/moneyUp.add_theme_color_override("font_color", Color(1,1,0))

func _on_money_up_button_mouse_exited() -> void:
	$ManageMenu/moneyUp.add_theme_color_override("font_color", Color(0.51372549019,1,0.54901960784,1))

func _on_speed_up_button_pressed() -> void:
	if ItemValues.money >= speedCost and upTokens > 0:
		Level += 1
		upTokens -= 1
		ItemValues.money -= speedCost
		Speed = Speed + (BaseSpeed * 2)

func _on_speed_up_button_mouse_entered() -> void:
	$ManageMenu/speedUp.add_theme_color_override("font_color", Color(1,1,0))

func _on_speed_up_button_mouse_exited() -> void:
	$ManageMenu/speedUp.add_theme_color_override("font_color", Color(0.51372549019,1,0.54901960784,1))

func _on_cancel_button_pressed() -> void:
	managing = false

func _on_sell_button_2_pressed() -> void:
	var hey = get_parent()
	ItemValues.money += BasePrice + (BasePrice * (Level / 2))
	hey.miners[ID] = null
	hey.amountOfDwellers -= 1
	hey._on_buy_button_mouse_exited()
	queue_free()
