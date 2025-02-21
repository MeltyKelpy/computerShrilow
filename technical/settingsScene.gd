extends Node2D

var evil = []

func spawnSettings():
	Settings.loadData()
	for i in Settings.settings.size():
		var cacapoopyFUCK = load("res://technical/setting.tscn")
		var caca = cacapoopyFUCK.instantiate()
		caca.ID = i
		caca.desc = Settings.settings[i]["desc"]
		caca.type = Settings.settings[i]["type"]
		if Settings.settings[i].type == "boolean":
			caca.uhmg = Settings.settings[i]["enabled?"]
		if Settings.settings[i].type == "multiChoice":
			caca.multiChoiceChoice = Settings.settings[i]["selectionNum"]
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
