extends Node2D

var curMenu = "main"
var validChoices = []
var filePage = 0
var pageHistory = []
var pagePlacementHistory = 0

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

func _ready() -> void:
	_update_menu("main")

func _spawn_files(page):
	var firstFile = (0 + (9 * filePage))
	for i in range(firstFile, firstFile+9):
		if (files.size()-1) >= i:
			var cacapoopyFUCK = load("res://technical/interstateFile.tscn")
			var caca = cacapoopyFUCK.instantiate()
			caca.parent = self
			caca.fileName = files[i]["FILENAME"]
			caca.fileType = files[i]["FILETYPE"]
			caca.locked = files[i]["LOCKED"]
			caca.lockText = files[i]["LOCKEDTEXT"]
			caca.attachedFile = files[i]["ATTACHMENT"]
			$Screen/VBoxContainer.add_child(caca)

func _kill_files():
	for i in $Screen/VBoxContainer.get_child_count():
		$Screen/VBoxContainer.get_child(i).queue_free()

func open_png(png):
	print(png)

func _update_menu(menu : String) -> void:
	pageHistory.append(menu)
	pagePlacementHistory += 1
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
		$Screen/Text.text = "NEXT to progress a page. LAST to go back a page."
		_spawn_files(filePage)
		await get_tree().create_timer(1).timeout
		$Screen/VBoxContainer.visible = true
	else:
		$Screen/VBoxContainer.visible = false

func _on_line_edit_text_submitted(new_text: String) -> void:
	$AudioStreamPlayer2D.play()
	$Screen/Text.visible = false
	if new_text.containsn("EXIT"):
		$AnimationPlayer.play("leaving")
	if new_text.containsn("BACK"):
		_kill_files()
		if pagePlacementHistory != 0:
			pageHistory.resize(pageHistory.size()-1)
			pagePlacementHistory -= 2
			_update_menu(pageHistory[pagePlacementHistory])
	if new_text.containsn("FILES"):
		_kill_files()
		filePage = 0
		_update_menu("files")
	await get_tree().create_timer(1).timeout
	$Screen/Text.visible = true

func _change_text(textie):
	$file.modulate = Color(1,1,1,0)
	$file.text = textie
	$file.modulate = Color(1,1,1,1)
	var tween = create_tween()
	tween.tween_property($file, "modulate", Color(1,1,1,0), 10).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
