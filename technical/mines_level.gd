extends Node2D

# some good ol fashioned spaghettiCode....

var characterInfos = [
	{
		"Name":"Shrilow",
		"Desc":"0.4$ per Pickaxe Swing.\nBase Speed: 1/s a second",
		"BasePrice":200,
		"MoneyGain":0.4,
		"Speed":1.000,
	},
	{
		"Name":"Moka",
		"Desc":"0.6$ per Pickaxe Swing.\nBase Speed: 1.3/s a second",
		"BasePrice":250,
		"MoneyGain":0.6,
		"Speed":1.300,
	},
	{
		"Name":"Mel",
		"Desc":"1.2$ per Pickaxe Swing.\nBase Speed: 1.4/s a second",
		"BasePrice":300,
		"MoneyGain":1.2,
		"Speed":1.400,
	},
	{
		"Name":"Blair",
		"Desc":"1.3$ per Pickaxe Swing.\nBase Speed: 2/s a second",
		"BasePrice":600,
		"MoneyGain":1.3,
		"Speed":2.000,
	},
	{
		"Name":"Charlotte",
		"Desc":"2$ per Pickaxe Swing.\nBase Speed: 1.5/s a second",
		"BasePrice":1100,
		"MoneyGain":2,
		"Speed":1.500,
	},
	]

@export var miners = [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	]

@export var amountOfDwellers = 0
@export var caveNumber = 0

var selected = null
var hoverSelected = null

@export var mineLevel = 0
@export var maxMineLevel = 4

var moneyValues = [
	150,
	300,
	450,
	600,
	750,
	]

@export var newMineExists = true

func getMineLevel(num):
	caveNumber = num

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = false
	timer.autostart = true
	timer.connect("timeout", _on_timer_timeout)
	add_child(timer)

func _process(_delta: float) -> void:
	
	if mineLevel >= 4:
		Game.unlock_achievement("minecraft")
		Game.unlock_outfit("Jacklow")
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[0])
	
	if err == OK:
		if Game.evilMines == true:
			maxMineLevel = 8
		else:
			maxMineLevel = 4
	else:
		maxMineLevel = 4
	
	if maxMineLevel == 8 and mineLevel < maxMineLevel and mineLevel >= 4:
		$VisualCodeSpaghetti/Upgrade/Box.texture = load("res://assets/images/areas/mines/upgradr/upgradeEvil.png")
		$VisualCodeSpaghetti/Upgrade/Label.text = "NEXT LEVEL:"+str(mineLevel+1)
		$VisualCodeSpaghetti/Upgrade/moneyLabel.text = str("$"+str(5000 * (mineLevel + 1)))
		$VisualCodeSpaghetti/Upgrade/upGrade.modulate = Color(1,1,1)
		$VisualCodeSpaghetti/Upgrade/Box.modulate = Color(1,1,1)
		$VisualCodeSpaghetti/Upgrade/moneyLabel.visible = true
	elif mineLevel == maxMineLevel:
		$VisualCodeSpaghetti/Upgrade/upGrade.modulate = Color(0.47,0.47,0.47)
		$VisualCodeSpaghetti/Upgrade/Box.modulate = Color(0.47,0.47,0.47)
		$VisualCodeSpaghetti/Upgrade/Label.text = "MAXED OUT"
		$VisualCodeSpaghetti/Upgrade/moneyLabel.visible = false
	else:
		$VisualCodeSpaghetti/Upgrade/upGrade.modulate = Color(1,1,1)
		$VisualCodeSpaghetti/Upgrade/Box.modulate = Color(1,1,1)
		$VisualCodeSpaghetti/Upgrade/Label.text = "NEXT LEVEL:"+str(mineLevel+1)
		$VisualCodeSpaghetti/Upgrade/moneyLabel.text = str("$"+str(5000 * (mineLevel + 1)))
		$VisualCodeSpaghetti/Upgrade/moneyLabel.visible = true
	
	if amountOfDwellers != 6:
		$VisualCodeSpaghetti/ShrilowCost.text = str(moneyValues[0])+"$"
		$VisualCodeSpaghetti/MokaCost.text = str(moneyValues[1])+"$"
		$VisualCodeSpaghetti/MelCost.text = str(moneyValues[2])+"$"
		$VisualCodeSpaghetti/BlairCost.text = str(moneyValues[3])+"$"
		$VisualCodeSpaghetti/CharlotteCost.text = str(moneyValues[4])+"$"
		moneyValues[0] = characterInfos[0]["BasePrice"] + ((characterInfos[0]["BasePrice"] / 4)*(amountOfDwellers/2))
		moneyValues[1] = characterInfos[1]["BasePrice"] + ((characterInfos[1]["BasePrice"] / 4)*(amountOfDwellers/2))
		moneyValues[2] = characterInfos[2]["BasePrice"] + ((characterInfos[2]["BasePrice"] / 4)*(amountOfDwellers/2))
		moneyValues[3] = characterInfos[3]["BasePrice"] + ((characterInfos[3]["BasePrice"] / 4)*(amountOfDwellers/2))
		moneyValues[4] = characterInfos[4]["BasePrice"] + ((characterInfos[4]["BasePrice"] / 4)*(amountOfDwellers/2))
		if selected == 0:
			$VisualCodeSpaghetti/ShrilowIcon.modulate = Color(1,1,0)
		elif hoverSelected == 0:
			$VisualCodeSpaghetti/ShrilowIcon.modulate = Color(1,1,0.5)
		else:
			$VisualCodeSpaghetti/ShrilowIcon.modulate = Color(1,1,1)
		
		if selected == 1:
			$VisualCodeSpaghetti/MokaIcon.modulate = Color(1,1,0)
		elif hoverSelected == 1:
			$VisualCodeSpaghetti/MokaIcon.modulate = Color(1,1,0.5)
		else:
			$VisualCodeSpaghetti/MokaIcon.modulate = Color(1,1,1)
		
		if selected == 2:
			$VisualCodeSpaghetti/MelIcon.modulate = Color(1,1,0)
		elif hoverSelected == 2:
			$VisualCodeSpaghetti/MelIcon.modulate = Color(1,1,0.5)
		else:
			$VisualCodeSpaghetti/MelIcon.modulate = Color(1,1,1)
		
		if selected == 3:
			$VisualCodeSpaghetti/BlairIcon.modulate = Color(1,1,0)
		elif hoverSelected == 3:
			$VisualCodeSpaghetti/BlairIcon.modulate = Color(1,1,0.5)
		else:
			$VisualCodeSpaghetti/BlairIcon.modulate = Color(1,1,1)
		
		if selected == 4:
			$VisualCodeSpaghetti/CharlotteIcon.modulate = Color(1,1,0)
		elif hoverSelected == 4:
			$VisualCodeSpaghetti/CharlotteIcon.modulate = Color(1,1,0.5)
		else:
			$VisualCodeSpaghetti/CharlotteIcon.modulate = Color(1,1,1)
		
		if selected != null:
			$CharName.text = characterInfos[selected]["Name"]
			$CharDesc.text = characterInfos[selected]["Desc"]
		else:
			$CharName.text = ""
			$CharDesc.text = ""
	else:
		$VisualCodeSpaghetti/ShrilowIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/MokaIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/MelIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/BlairIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/CharlotteIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/BuyIcon.modulate = Color(0.5,0.5,0.5)
		$VisualCodeSpaghetti/ShrilowCost.text = ""
		$VisualCodeSpaghetti/MokaCost.text = ""
		$VisualCodeSpaghetti/MelCost.text = ""
		$VisualCodeSpaghetti/BlairCost.text = ""
		$VisualCodeSpaghetti/CharlotteCost.text = ""
		$CharName.text = "CHARACTER LIMIT REACHED"
		$CharDesc.text = "Buy a new mine, or sell someone, to add more to this mine."
	
	if newMineExists == true:
		if get_node_or_null(^"newMine"):
			$newMine/NewLevelCost.text = str(5000+(5000*caveNumber))+"$"
			$newMine.visible = true
	if newMineExists == false:
		if get_node_or_null(^"newMine"):
			$newMine.visible = false

# STUPID FUCKING SPAGHETTI CODE

func _on_shrilow_button_mouse_entered() -> void:
	hoverSelected = 0

func _on_shrilow_button_mouse_exited() -> void:
	hoverSelected = null

func _on_shrilow_button_pressed() -> void:
	selected = 0

func _on_moka_button_mouse_entered() -> void:
	hoverSelected = 1

func _on_moka_button_mouse_exited() -> void:
	hoverSelected = null

func _on_moka_button_pressed() -> void:
	selected = 1

func _on_mel_button_mouse_entered() -> void:
	hoverSelected = 2

func _on_mel_button_mouse_exited() -> void:
	hoverSelected = null

func _on_mel_button_pressed() -> void:
	selected = 2


func _on_blair_button_mouse_entered() -> void:
	hoverSelected = 3

func _on_blair_button_mouse_exited() -> void:
	hoverSelected = null

func _on_blair_button_pressed() -> void:
	selected = 3


func _on_charlotte_button_mouse_entered() -> void:
	hoverSelected = 4

func _on_charlotte_button_mouse_exited() -> void:
	hoverSelected = null

func _on_charlotte_button_pressed() -> void:
	selected = 4


func _on_buy_button_mouse_entered() -> void:
	$VisualCodeSpaghetti/BuyIcon.modulate = Color(1,1,0.5)

func _on_buy_button_mouse_exited() -> void:
	$VisualCodeSpaghetti/BuyIcon.modulate = Color(1,1,1)

func _on_buy_button_pressed() -> void:
	if amountOfDwellers != 6 and ItemValues.money >= moneyValues[selected]:
		var itsTime = false
		for i in range(0, 6):
			if miners[i] == null and itsTime == false:
				itsTime = true
				var cacapoopyGOD = preload("res://technical/character.tscn")
				var caca = cacapoopyGOD.instantiate()
				caca.Name = characterInfos[selected]["Name"]
				caca.MoneyGain = characterInfos[selected]["MoneyGain"]
				caca.BasePrice = characterInfos[selected]["BasePrice"]
				caca.Speed = characterInfos[selected]["Speed"]
				add_child(caca)
				miners[i] = caca
				amountOfDwellers += 1
				caca.listPlacement(i)
				ItemValues.money -= moneyValues[selected]
				Interstate.totallost -= moneyValues[selected]
				caca.position.x = 387+(101*i)
				caca.position.y = 213

func _on_button_mouse_entered() -> void:
	$newMine/NewLevelCost.add_theme_color_override("font_color", Color(1,1,0))
	$newMine/NewMines.modulate = Color(1,1,0)

func _on_button_mouse_exited() -> void:
	$newMine/NewLevelCost.add_theme_color_override("font_color", Color(0,1,0))
	$newMine/NewMines.modulate = Color(0,1,0)

func _on_button_pressed() -> void:
	if ItemValues.money >= 1000+(1000*caveNumber):
		var ammo = 1000+(1000*caveNumber)
		ItemValues.money -= ammo
		Interstate.totallost -= ammo
		var cacapoopyGOD = preload("res://technical/minesLevel.tscn")
		var caca = cacapoopyGOD.instantiate()
		add_child(caca)
		FizzyDrink.minesLength = caveNumber+2
		caca.getMineLevel(caveNumber+1)
		caca.position.y = ((602/2)*(1))
		newMineExists = false
		$newMine.queue_free()
		$newMine/Button.disabled = true

func _on_up_grade_button_pressed() -> void:
	if ItemValues.money >= 5000 * (mineLevel + 1) and (mineLevel < maxMineLevel):
		var texturer
		mineLevel += 1
		texturer = load("res://assets/images/areas/mines/upgradr/usedLevels/"+str(mineLevel)+".png")
		$VisualCodeSpaghetti/MinesLevel.texture = texturer
		var mineCost = 5000 * mineLevel
		ItemValues.money -= mineCost
		Interstate.totallost -= mineCost

func _on_timer_timeout() -> void:
	if Settings.setting_state("minesOptimization"):
		var outputMonsey = 0.0
		for i in miners.size():
			if miners[i] != null:
				outputMonsey += miners[i].optimizeMoney * miners[i].optimizeSpeed
		Interstate.totalmoney += outputMonsey
		ItemValues.money += outputMonsey
