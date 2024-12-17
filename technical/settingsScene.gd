extends Node2D

var evil = []

func spawnSettings():
	for i in Settings.settings.size():
		var cacapoopyFUCK = load("res://technical/setting.tscn")
		var caca = cacapoopyFUCK.instantiate()
		caca.ID = i
		caca.desc = Settings.settings[i]["desc"]
		caca.uhmg = Settings.settings[i]["enabled?"]
		add_child(caca)
		evil.append(caca)
		caca.reparent($ScrollContainer/Control)

func _process(_delta : float):
	$Description.text = FizzyDrink.descriptionSetting

func kill():
	for i in evil.size():
		evil[i].queue_free()
	evil.resize(0)
