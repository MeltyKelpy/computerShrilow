extends Node2D

var curMenu = "main"
var validChoices = []
var filePage = 0
var pageHistory = []
var pagePlacementHistory = -1
var files = [
	{
	"FILENAME":"placeholderfile bello!",
	"FILETYPE":".png",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"test",
	},
	{
	"FILENAME":"placeholderfile3 bello!",
	"FILETYPE":".png",
	"LOCKED":true,
	"LOCKEDTEXT":"bello!",
	"ATTACHMENT":"test",
	},
	{
	"FILENAME":"placeholderfile2 bello!",
	"FILETYPE":".txt",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"test",
	},
	]
var fileOpen = false
var selectedFile = 0
var pageLength = 0

@onready var line_edit = $Screen/LineEdit

func _ready() -> void:
	Interstate.loadData()
	_update_menu("main")

func _process(delta: float) -> void:
	if curMenu == "files":
		if Input.is_action_just_pressed("ui_down") and selectedFile < pageLength:
			selectedFile += 1
			$AudioStreamPlayer2D.play()
		if Input.is_action_just_pressed("ui_up") and selectedFile > 0:
			selectedFile -= 1
			$AudioStreamPlayer2D.play()

func _spawn_files(page):
	var firstFile = (0 + (7 * filePage))
	for i in range(firstFile, firstFile+7):
		if (files.size()-1) >= i:
			var cacapoopyFUCK = load("res://technical/interstateFile.tscn")
			var caca = cacapoopyFUCK.instantiate()
			caca.parent = self
			caca.id = i
			caca.fileName = files[i]["FILENAME"]
			caca.fileType = files[i]["FILETYPE"]
			caca.locked = files[i]["LOCKED"]
			caca.lockText = files[i]["LOCKEDTEXT"]
			caca.attachedFile = files[i]["ATTACHMENT"]
			$Screen/VBoxContainer.add_child(caca)
			pageLength = i

func _kill_files():
	for i in $Screen/VBoxContainer.get_child_count():
		$Screen/VBoxContainer.get_child(i).queue_free()

func open_png(png):
	print(png)

func _update_menu(menu : String) -> void:
	$Screen/Node2D.visible = false
	$Screen/Node2D/LineEdit.editable = false
	if pagePlacementHistory == -1 or pageHistory[pagePlacementHistory] != menu:
		pageHistory.append(menu)
		pagePlacementHistory += 1
	curMenu = menu
	if menu == "main":
		$Screen/Text.text = """The Interstate:
		
		A Place to find your global stats, and other things of the sort.
		enter a section to get started!
		
		You can type the section name (The Captialized Part) at the bottom to enter a section
		MENU allows you to return here, and BACK will take you back to whatever your last page was. EXIT leaves the interstate.
		
		> STATS (global stats)
		
		> FILES (files)
		
		> RECYCLING (achievements)
		
		> CODES (uhm. codes.)
		"""
	
	if menu == "files":
		$Screen/Text.text = "NEXT to progress a page. LAST to go back a page.\nuse keyboard to navigate, and OPEN to open a file."
		await get_tree().create_timer(1).timeout
		_spawn_files(filePage)
	
	if menu == "codes":
		$Screen/Text.text = ""
		await get_tree().create_timer(1).timeout
		$Screen/Node2D.visible = true
		$Screen/Node2D/LineEdit.editable = true

func _close_file():
	pass # HAVENT CODED YET LOL

func _on_line_edit_text_submitted(new_text: String) -> void:
	if !(curMenu == "files" and new_text.containsn("OPEN")):
		var locationFound = false
		$AudioStreamPlayer2D.play()
		$Screen/VBoxContainer.visible = false
		$Screen/Text.visible = false
		if curMenu == "files":
			if new_text.containsn("NEXT") and files.size() <= (0 + (7 * (filePage+1))):
				_kill_files()
				filePage += 1
				_update_menu("files")
				locationFound = true
			if new_text.containsn("LAST") and (0 + (7 * (filePage-1))) >= 0:
				_kill_files()
				filePage -= 1
				_update_menu("files")
				locationFound = true
		if new_text.containsn("EXIT"):
			$AnimationPlayer.play("leaving")
		if new_text.containsn("CODE"):
			_kill_files()
			_update_menu("codes")
			locationFound = true
		if new_text.containsn("BACK"):
			if !fileOpen:
				_kill_files()
				if pagePlacementHistory != 0:
					pageHistory.resize(pageHistory.size()-1)
					pagePlacementHistory -= 1
					_update_menu(pageHistory[pagePlacementHistory])
					locationFound = true
				else:
					locationFound = false
		if new_text.containsn("FILES"):
			filePage = 0
			_kill_files()
			_update_menu("files")
			locationFound = true
		if new_text.containsn("MENU"):
			_kill_files()
			_update_menu("main")
			locationFound = true
		if !new_text.containsn("EXIT"):
			await get_tree().create_timer(1).timeout
			if locationFound == false:
				_change_text("That doesnt seem to exist...")
			$Screen/Text.visible = true
			$Screen/VBoxContainer.visible = true

func _change_text(textie):
	$file.modulate = Color(1,1,1,0)
	$file.text = textie
	$file.modulate = Color(1,1,1,1)
	var tween = create_tween()
	tween.tween_property($file, "modulate", Color(1,1,1,0), 10).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)

func code_input(new_text: String) -> void:
	var code_recognized = false
	
	if new_text.containsn("4baldi"):
		_change_text("Something changed in the settings... I feel a little heavier.")
		Interstate.baldiModeUnlocked = true
		Interstate.saveData()
		code_recognized = true
	
	if new_text.containsn("saayo"):
		_change_text("Something changed in the settings... suddenly the color purple fascinates me...")
		Interstate.saayoModeUnlocked = true
		Interstate.saveData()
		code_recognized = true
	
	if new_text.containsn("spencer") or new_text.containsn("stargod"):
		_change_text("Pretty......")
		code_recognized = true
	
	if new_text.containsn("melanie") or new_text.containsn("melty"):
		_change_text("Stars....")
		code_recognized = true
	
	if code_recognized == false:
		_change_text("i dont think that worked...")
