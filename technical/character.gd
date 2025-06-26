extends Node2D

@export var Name = "Shrilow"
@export var MoneyGain = 1
@export var Speed = 2.0
@export var BaseMoneyGain = MoneyGain
@export var BaseSpeed = Speed
@export var Level = 1
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
var optimizeMoney = 0.0
var optimizeSpeed = 0.0

@export var speedCost = 0.0
@export var moneyCost = 0.0

@export var mineLevelSPEED = 0.0
@export var mineLevelMONEY = 0.0
var adds = 1
var jackBlack = 1

func listPlacement(num):
	ID = num

func _ready() -> void:
	#  1 / 3 = 
	#  5 / 6 = 
	#  3 / (1.0 / Speed)
	#
	#  (Swings / MoneyGain) / Speed
	#  (6 / 5) / 1.5
	#
	#  "MoneyGain":1,
	#  "Swings":3,
	#  "Speed":1.000,
	#
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
	
	optimizeMoney = (MoneyGain+(((mineLevelMONEY))*MoneyGain))*adds
	optimizeSpeed = Speed+((mineLevelSPEED)*Speed)
	
	if Settings.setting_state("minesOptimization") == true:
		if Settings.setting_state("animationsOptimization") == false:
			timer.paused = true
			timer2.paused = true
		else:
			if timer.is_stopped() == true and timer2.is_stopped() == true:
				timer.start()
			timer.paused = false
			timer2.paused = false
			waitTime = (1.0 / BaseSpeed) - ((1.0 / BaseSpeed) / 4.0)
			timer.wait_time = waitTime
			waitTime2 = (1.0 / BaseSpeed) / 4.0
			timer2.wait_time = waitTime2
	else:
		if timer.is_stopped() == true and timer2.is_stopped() == true:
			timer.start()
	
	if FizzyDrink.enabledCrystal == "mine":
		adds = 2
	else:
		adds = 1
	
	if FizzyDrink.properlySeled == "Jacklow":
		jackBlack = 1.5
	else:
		jackBlack = 1
	
	if timer.time_left == 0 and timer2.time_left == 0:
		timer.start()
	
	var hey = get_parent()
	
	if hey.mineLevel >= 1:
		mineLevelMONEY = 0.5
	if hey.mineLevel >= 2:
		mineLevelSPEED = 0.5
	if hey.mineLevel >= 3:
		mineLevelMONEY = 1
	if hey.mineLevel >= 4:
		mineLevelSPEED = 1
	if hey.mineLevel >= 5:
		mineLevelMONEY = 1.5
	if hey.mineLevel >= 6:
		mineLevelSPEED = 1.5
	if hey.mineLevel >= 7:
		mineLevelMONEY = 2
	if hey.mineLevel >= 8:
		mineLevelSPEED = 2
	
	if $CharName.visible == true and Input.is_action_just_pressed("Click"):
		managing = !managing
		$CharName.visible = !managing
	
	speedCost = ((Speed / 2) * 500) * Level
	moneyCost = (MoneyGain * 200) * Level
	if Level != 5:
		$ManageMenu/speedUp.text = str(int(round(speedCost)))+"$"
		$ManageMenu/moneyUp.text = str(int(round(moneyCost)))+"$"
	else:
		$ManageMenu/speedUp.text = ""
		$ManageMenu/moneyUp.text = ""
	$ManageMenu/UpgradeInfo.text = "Speed:"+str(int((Speed+(((mineLevelSPEED)*Speed)))*jackBlack))+"\nMoney:"+str(int(((MoneyGain+((mineLevelMONEY)*MoneyGain))*adds)*jackBlack))+"\nLevel:"+str(Level)
	$ManageMenu/UpgradeInfo3.text = "UpTokens:"+str(upTokens)
	if Level == 1:
		$ManageMenu/UpgradeInfo2.visible = true
	else:
		$ManageMenu/UpgradeInfo2.visible = false
	$ManageMenu.visible = managing
	
	if Settings.setting_state("animationsOptimization"):
		if !Settings.setting_state("saayo"):
			$CharacterSprite.texture = load("res://assets/images/areas/mines/"+Name+str(state)+".png")
		else:
			$CharacterSprite.texture = load("res://assets/images/areas/mines/Saayo"+str(state)+".png")
	else:
		if !Settings.setting_state("saayo"):
			$CharacterSprite.texture = load("res://assets/images/areas/mines/"+Name+"0.png")
		else:
			$CharacterSprite.texture = load("res://assets/images/areas/mines/Saayo0.png")
	
	$ManageMenu.visible = managing
	
	$CharName.text = Name+"\n"+str((MoneyGain+((mineLevelMONEY)*MoneyGain))*adds)+"$ every Swing\nSpeed: "+str(Speed+((mineLevelSPEED)*Speed))+"\nLevel: "+str(Level)+"\nL-Click to Manage"

func _on_selection_mouse_entered() -> void:
	if managing == false:
		$CharName.visible = true

func _on_selection_mouse_exited() -> void:
	$CharName.visible = false

func _swingTimerEnd():
	var hey = get_parent()
	if Settings.setting_state("minesOptimization") == false:
		waitTime = ((1.0 / (Speed+((mineLevelSPEED)*Speed))) - ((1.0 / (Speed+((mineLevelSPEED)*Speed))) / 4.0))*jackBlack
		timer.wait_time = waitTime
	state = 1
	if Settings.setting_state("minesOptimization") == false:
		var cacapoopyGOD = load("res://technical/moneyGet.tscn")
		var caca = cacapoopyGOD.instantiate()
		add_child(caca)
		caca.determine(((MoneyGain+(((mineLevelMONEY))*MoneyGain))*adds)*jackBlack)
		var ammo = ((MoneyGain+(((mineLevelMONEY))*MoneyGain))*adds)*jackBlack
		Interstate.totalmoney += ammo
		ItemValues.total_money += ammo
		ItemValues.money += ammo
		caca.position.x = -30
		caca.position.y = -70
		curSwing = 0
	timer2.start()

func _swingTimerRestart():
	if Settings.setting_state("minesOptimization") == false:
		waitTime2 = (1.0 / (Speed+((mineLevelSPEED)*Speed))) / 4.0
		timer2.wait_time = waitTime2
	state = 0
	timer.start()

func _on_money_up_button_pressed() -> void:
	if ItemValues.money >= moneyCost and upTokens > 0:
		Level += 1
		upTokens -= 1
		ItemValues.money -= moneyCost
		Interstate.totallost -= moneyCost
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
		Interstate.totallost -= speedCost
		Speed = Speed + (BaseSpeed * 2)

func _on_speed_up_button_mouse_entered() -> void:
	$ManageMenu/speedUp.add_theme_color_override("font_color", Color(1,1,0))

func _on_speed_up_button_mouse_exited() -> void:
	$ManageMenu/speedUp.add_theme_color_override("font_color", Color(0.51372549019,1,0.54901960784,1))

func _on_cancel_button_pressed() -> void:
	managing = false

func _on_sell_button_2_pressed() -> void:
	var hey = get_parent()
	var ammo = BasePrice + (BasePrice * (Level / 2))
	Interstate.totalmoney += ammo
	ItemValues.total_money += ammo
	ItemValues.money += ammo
	hey.miners[ID] = null
	hey.amountOfDwellers -= 1
	hey._on_buy_button_mouse_exited()
	queue_free()
