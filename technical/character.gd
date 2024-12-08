extends Node2D

var Name = "Shrilow"
var MoneyGain = 1
var Speed = 2.0
var BaseMoneyGain = MoneyGain
var BaseSpeed = Speed
var Level = 1
var Swings = 3
var BasePrice = 150
var state = 0
var timer = Timer.new()
var timer2 = Timer.new()
var curSwing = 0
var waitTime = 0.000
var waitTime2 = 0.000
var managing = false
var upTokens = 4
var ID = 0

var speedCost = 0.0
var moneyCost = 0.0

var mineLevel = 0.0

func listPlacement(num):
	ID = num
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BaseMoneyGain = MoneyGain
	BaseSpeed = Speed
	$CharName.visible = false
	waitTime = (1.0 / Speed) - ((1.0 / Speed) / 4.0)
	timer.wait_time = waitTime
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", _swingTimerEnd)
	add_child(timer)
	waitTime2 = (1.0 / Speed) / 4.0
	timer2.wait_time = waitTime2
	timer2.one_shot = true
	timer2.autostart = false
	timer2.connect("timeout", _swingTimerRestart)
	add_child(timer2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
	$ManageMenu/speedUp.text = str(speedCost)
	$ManageMenu/moneyUp.text = str(moneyCost)
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
	if hey.selectedPath == 1:
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
	if hey.selectedPath == 1:
		waitTime2 = (1.0 / (Speed+(((mineLevel) / 2)*Speed))) / 4.0
	else:
		waitTime2 = (1.0 / (Speed+(((mineLevel) / 2)*Speed))) / 4.0
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
