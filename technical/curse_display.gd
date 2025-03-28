extends TextureRect

var curseID = ""

func _ready() -> void:
	for i in Curses.mainCurses.size():
		if Curses.mainCurses[i]["ID"] == curseID:
			$Label.text = Curses.mainCurses[i]["Name"]
			if ResourceLoader.exists(Curses.mainCurses[i]["Icon"]):
				texture = load(Curses.mainCurses[i]["Icon"])
				break
			else:
				texture = load("res://assets/images/ui/curses/placeholderCurse.png")
	for i in Curses.passiveCurses.size():
		if Curses.passiveCurses[i]["ID"] == curseID:
			$Label.text = Curses.passiveCurses[i]["Name"]
			if ResourceLoader.exists(Curses.passiveCurses[i]["Icon"]):
				texture = load(Curses.mainCurses[i]["Icon"])
				break
			else:
				texture = load("res://assets/images/ui/curses/placeholderCurse.png")

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	$Label.visible = true

func _on_mouse_exited() -> void:
	$Label.visible = false
