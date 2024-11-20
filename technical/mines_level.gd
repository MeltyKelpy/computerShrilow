extends Node2D

# some good ol fashioned spaghettiCode....

var characterInfos = [
	{
		"Name":"Shrilow",
		"Desc":"1$ per 3 pickaxe swings.\nBase Speed: 2 a second",
		"BasePrice":100,
		"MoneyGain":1,
		"Swings":1,
		"Speed":2,
	},
	{
		"Name":"Moka",
		"Desc":"2$ per 6 pickaxe swings.\nBase Speed: 3 a second",
		"BasePrice":300,
		"MoneyGain":1,
		"Swings":2,
		"Speed":2,
	},
	{
		"Name":"Mel",
		"Desc":"10$ per 10 pickaxe swings.\nBase Speed: 2 a second",
		"BasePrice":450,
		"MoneyGain":10,
		"Swings":10,
		"Speed":2,
	},
	{
		"Name":"Blair",
		"Desc":"1$ per 4 pickaxe swings.\nBase Speed: 8 a second",
		"BasePrice":600,
		"MoneyGain":1,
		"Swings":4,
		"Speed":8,
	},
	{
		"Name":"Charlotte",
		"Desc":"6$ per 6 pickaxe swings.\nBase Speed: 2 a second",
		"BasePrice":750,
		"MoneyGain":6,
		"Swings":6,
		"Speed":2,
	},
	]

var amountOfDwellers = 0
var caveNumber = 0

var selected = null
var hoverSelected = null

var shrilowCost = 150
var mokaCost = 300
var melCost = 450
var blairCost = 600
var charlotteCost = 750

func _process(delta: float) -> void:
	if amountOfDwellers != 7:
		$VisualCodeSpaghetti/ShrilowCost.text = str(shrilowCost)+"$"
		$VisualCodeSpaghetti/MokaCost.text = str(mokaCost)+"$"
		$VisualCodeSpaghetti/MelCost.text = str(melCost)+"$"
		$VisualCodeSpaghetti/BlairCost.text = str(blairCost)+"$"
		$VisualCodeSpaghetti/CharlotteCost.text = str(charlotteCost)+"$"
		shrilowCost = 150 + ((150 / 2)*(amountOfDwellers))
		mokaCost = 300 + ((300 / 2)*(amountOfDwellers))
		melCost = 450 + ((450 / 2)*(amountOfDwellers))
		blairCost = 600 + ((600 / 2)*(amountOfDwellers))
		charlotteCost = 750 + ((750 / 2)*(amountOfDwellers))
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
	
	$NewLevelCost.text = str(500+(1000*caveNumber))+"$"

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
	if amountOfDwellers != 7:
		var cacapoopyGOD = preload("res://technical/character.tscn")
		var caca = cacapoopyGOD.instantiate()
		caca.Name = characterInfos[selected]["Name"]
		caca.MoneyGain = characterInfos[selected]["MoneyGain"]
		caca.BasePrice = characterInfos[selected]["BasePrice"]
		caca.Speed = characterInfos[selected]["Speed"]
		caca.Swings = characterInfos[selected]["Swings"]
		add_child(caca)
		caca.position.x = 401+(101*amountOfDwellers)
		caca.position.y = 213+(213*caveNumber)
		amountOfDwellers += 1
