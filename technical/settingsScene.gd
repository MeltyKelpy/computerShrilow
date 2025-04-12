extends Node2D

var evil = []

func spawnSettings():
	Settings.loadData()
	for i in Settings.settings.size():
		var canProceed = true
		var cacapoopyFUCK = load("res://technical/setting.tscn")
		var caca = cacapoopyFUCK.instantiate()
		if Settings.settings[i]["id"] == "saayo" and Interstate.saayoModeUnlocked == false:
			canProceed = false
		if Settings.settings[i]["id"] == "4baldi" and Interstate.baldiModeUnlocked == false:
			canProceed = false
		if canProceed == true:
			caca.ID = i
			caca.desc = Settings.settings[i]["desc"]
			caca.type = Settings.settings[i]["type"]
			if Settings.settings[i].type == "boolean":
				caca.uhmg = Settings.settings[i]["enabled?"]
			if Settings.settings[i].type == "multiChoice":
				caca.multiChoiceChoice = Settings.settings[i]["selectionNum"]
				caca.choices = Settings.settings[i]["choices"]
			add_child(caca)
			evil.append(caca)
			caca.reparent($ScrollContainer/Control)

func _process(_delta : float):
	$Description.text = FizzyDrink.descriptionSetting

func kill():
	Settings.saveData()
	for i in evil.size():
		evil[i].queue_free()
	evil.resize(0)
