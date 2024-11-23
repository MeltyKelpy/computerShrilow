extends Node2D

# some good ol fashioned spaghettiCode....

var characterInfos = [
	{
		"Name":"Shrilow",
		"Desc":"1$ per 3 pickaxe swings.\nBase Speed: 1 a second",
		"BasePrice":400,
		"MoneyGain":1,
		"Swings":3,
		"Speed":1.000,
	},
	{
		"Name":"Moka",
		"Desc":"2$ per 4 pickaxe swings.\nBase Speed: 1.2 a second",
		"BasePrice":600,
		"MoneyGain":2,
		"Swings":4,
		"Speed":1.200,
	},
	{
		"Name":"Mel",
		"Desc":"5$ per 8 pickaxe swings.\nBase Speed: 1.5 a second",
		"BasePrice":750,
		"MoneyGain":5,
		"Swings":8,
		"Speed":1.500,
	},
	{
		"Name":"Blair",
		"Desc":"2$ per 3 pickaxe swings.\nBase Speed: 2.5 a second",
		"BasePrice":900,
		"MoneyGain":2,
		"Swings":3,
		"Speed":2.50,
	},
	{
		"Name":"Charlotte",
		"Desc":"6$ per 6 pickaxe swings.\nBase Speed: 1.5 a second",
		"BasePrice":1050,
		"MoneyGain":6,
		"Swings":6,
		"Speed":1.800,
	},
	]

var amountOfDwellers = 0
var caveNumber = 0

var selected = null
var hoverSelected = null

var moneyValues = [
	150,
	300,
	450,
	600,
	750,
	]

var newMineExists = true

func getMineLevel(num):
	caveNumber = num

func _process(_delta: float) -> void:
	if amountOfDwellers != 7:
		$VisualCodeSpaghetti/ShrilowCost.text = str(moneyValues[0])+"$"
		$VisualCodeSpaghetti/MokaCost.text = str(moneyValues[1])+"$"
		$VisualCodeSpaghetti/MelCost.text = str(moneyValues[2])+"$"
		$VisualCodeSpaghetti/BlairCost.text = str(moneyValues[3])+"$"
		$VisualCodeSpaghetti/CharlotteCost.text = str(moneyValues[4])+"$"
		moneyValues[0] = characterInfos[0]["BasePrice"] + ((characterInfos[0]["BasePrice"] / 2)*(amountOfDwellers))
		moneyValues[1] = characterInfos[1]["BasePrice"] + ((characterInfos[1]["BasePrice"] / 2)*(amountOfDwellers))
		moneyValues[2] = characterInfos[2]["BasePrice"] + ((characterInfos[2]["BasePrice"] / 2)*(amountOfDwellers))
		moneyValues[3] = characterInfos[3]["BasePrice"] + ((characterInfos[3]["BasePrice"] / 2)*(amountOfDwellers))
		moneyValues[4] = characterInfos[4]["BasePrice"] + ((characterInfos[4]["BasePrice"] / 2)*(amountOfDwellers))
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
		$newMine/NewLevelCost.text = str(500+(1000*caveNumber))+"$"

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
	if amountOfDwellers != 7 and ItemValues.money >= moneyValues[selected]:
		var cacapoopyGOD = preload("res://technical/character.tscn")
		var caca = cacapoopyGOD.instantiate()
		caca.Name = characterInfos[selected]["Name"]
		caca.MoneyGain = characterInfos[selected]["MoneyGain"]
		caca.BasePrice = characterInfos[selected]["BasePrice"]
		caca.Speed = characterInfos[selected]["Speed"]
		caca.Swings = characterInfos[selected]["Swings"]
		add_child(caca)
		ItemValues.money -= moneyValues[selected]
		caca.position.x = 401+(101*amountOfDwellers)
		caca.position.y = 213
		amountOfDwellers += 1


func _on_button_mouse_entered() -> void:
	$newMine/NewLevelCost.add_theme_color_override("font_color", Color(1,1,0))
	$newMine/NewMines.modulate = Color(1,1,0)

func _on_button_mouse_exited() -> void:
	$newMine/NewLevelCost.add_theme_color_override("font_color", Color(0,1,0))
	$newMine/NewMines.modulate = Color(0,1,0)

func _on_button_pressed() -> void:
	if ItemValues.money >= 500+(1000*caveNumber):
		var cacapoopyGOD = preload("res://technical/minesLevel.tscn")
		var caca = cacapoopyGOD.instantiate()
		add_child(caca)
		FizzyDrink.minesLength = caveNumber+2
		caca.getMineLevel(caveNumber+1)
		caca.position.y = ((602/2)*(1))
		newMineExists = false
		$newMine.queue_free()
