extends TextureRect

var curseID = ""

func _ready() -> void:
	for i in Curses.mainCurses.size():
		if Curses.mainCurses[i]["ID"] == curseID:
			$Label.text = Curses.mainCurses[i]["Name"]
			texture = load(Curses.mainCurses[i]["Icon"])
	for i in Curses.passiveCurses.size():
		if Curses.passiveCurses[i]["ID"] == curseID:
			$Label.text = Curses.passiveCurses[i]["Name"]
			texture = load(Curses.passiveCurses[i]["Icon"])

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	$Label.visible = true

func _on_mouse_exited() -> void:
	$Label.visible = false
