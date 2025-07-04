extends Node2D

var curMenu = "main"
var txtFile = "test"
var txtPage = 0
var validChoices = []
var filePage = 0
var pageHistory = []
var pagePlacementHistory = -1
var files = [
	{
	"FILENAME":"pop-up-event",
	"FILETYPE":".exe",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"pop-up",
	},
	{
	"FILENAME":"Gangnum-Style",
	"FILETYPE":".png",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"gangnumstyle",
	},
	{
	"FILENAME":"Memorial",
	"FILETYPE":".png",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"memorium",
	},
	{
	"FILENAME":"oh",
	"FILETYPE":".png",
	"LOCKED":false,
	"LOCKEDTEXT":"",
	"ATTACHMENT":"oh",
	},
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
var selectedFile = 0
var pageLength = 0

@onready var line_edit = $Screen/LineEdit

func _ready() -> void:
	Interstate.color.visible = false
	Interstate.loadData()
	_update_menu("main", false)

func _process(delta: float) -> void:
	if curMenu == "files":
		if Input.is_action_just_pressed("ui_down") and selectedFile < pageLength:
			selectedFile += 1
			$AudioStreamPlayer2D.play()
		if Input.is_action_just_pressed("ui_up") and selectedFile > 0:
			selectedFile -= 1
			$AudioStreamPlayer2D.play()

func _open_exe():
	pass

func _spawn_files(page):
	var firstFile = (0 + (8 * filePage))
	for i in range(firstFile, firstFile+8):
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

func open_png(fileName, png):
	$Screen/Text.text = ""
	curMenu = "png"
	if pagePlacementHistory == -1 or pageHistory[pagePlacementHistory] != curMenu:
		pageHistory.append(curMenu)
		pagePlacementHistory += 1
	_kill_files()
	_set_terminal(false)
	await get_tree().create_timer(1).timeout
	_set_terminal(true)
	$Screen/png/Label.text = fileName+".png\nBACK to close."
	if ResourceLoader.exists("res://assets/images/areas/interstate/pngs/"+png+".png"):
		$Screen/png/png.texture = load("res://assets/images/areas/interstate/pngs/"+png+".png")
	else:
		$Screen/png/png.texture = load("res://assets/images/areas/interstate/pngs/temp.png")
	$Screen/png/png.visible = true
	$Screen/png/Label.visible = true
	if png == "bell_toll":
		$AudioStreamPlayer2.play()

func _update_menu(menu : String,  subMenu : bool) -> void:
	$Screen/Node2D.visible = false
	$Screen/Node2D/LineEdit.editable = false
	if pagePlacementHistory == -1 or pageHistory[pagePlacementHistory] != menu:
		pageHistory.append(menu)
		pagePlacementHistory += 1
	if subMenu == false:
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
		
		if menu == "stats":
			var time_dict = {"H" : 0, "M" : 0, "S" : 0}
			var time = int(round(Interstate.fullTime))
			while time >= 60:
				time -= 60
				time_dict["M"] += 1
			time_dict["S"] = time
			while time_dict["M"] >= 60:
				time_dict["M"] -= 60
				time_dict["H"] += 1
			var finH
			if time_dict["H"] < 10:
				finH = "0"+str(time_dict["H"])
			else:
				finH = time_dict["H"]
			var finM
			if time_dict["M"] < 10:
				finM = "0"+str(time_dict["M"])
			else:
				finM = time_dict["M"]
			var finS
			if time_dict["S"] < 10:
				finS = "0"+str(time_dict["S"])
			else:
				finS = time_dict["S"]
			var final = str(finH) + ":" + str(finM) + ":" + str(finS)
			$Screen/Text.text = "The Interstate: Global Stats\nBACK to return to previous page.\n\nCurrent ANY% Record Holder: Hekza\n\nTime Played: "+str(final)+"\nTotal Rebirths: "+str(Interstate.fullRebirths)+"\nStars Lost: "+str(Interstate.starslost)+"\nTotal Money Gained: "+str(int(Interstate.totalmoney))+"\nTotal Money Spent: "+str(abs(int(Interstate.totallost)))+"\nPlus Ones Bought: "+str(Interstate.plusones)+"\nJellies Bought: "+str(Interstate.jelliesbought)+"\nIQ: "+str(Interstate.iq)
		
		if menu == "files":
			$Screen/Text.text = "NEXT to progress a page. LAST to go back a page.\nuse keyboard to navigate, and OPEN to open a file."
			await get_tree().create_timer(1).timeout
			_spawn_files(filePage)
		
		if menu == "codes":
			$Screen/Text.text = ""
			await get_tree().create_timer(1).timeout
			$Screen/Node2D.visible = true
			$Screen/Node2D/LineEdit.editable = true
	else:
		_set_terminal(false)
		await get_tree().create_timer(1).timeout
		_set_terminal(true)
		curMenu = "txtFile"
		txtFile = menu
		menu += str(txtPage)
		$Screen/Text.text = "NEXT for next page, LAST for last page (if applicable)\nBACK to return to files.\n\n"
		if menu == "test0":
			_kill_files()
			$Screen/Text.text += "Test for TXT File!"
		else:
			_change_text("nothing...")

func _close_file():
	$Screen/png/png.visible = false
	$Screen/png/Label.visible = false

func _set_terminal(type):
	if type == false:
		$AudioStreamPlayer2D.play()
		$Screen/VBoxContainer.visible = false
		$Screen/Text.visible = false
		$Screen/png.visible = false
	if type == true:
		$Screen/VBoxContainer.visible = true
		$Screen/Text.visible = true
		$Screen/png.visible = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	if !(curMenu == "files" and new_text.containsn("OPEN")):
		var locationFound = false
		_set_terminal(false)
		_kill_files()
		if curMenu == "files":
			if new_text.containsn("NEXT") and files.size() >= (0 + (8 * (filePage+1))):
				filePage += 1
				_update_menu("files", false)
				locationFound = true
			if new_text.containsn("LAST") and filePage > 0:
				filePage -= 1
				_update_menu("files", false)
				locationFound = true
			elif (new_text.containsn("LAST") or new_text.containsn("NEXT")) and filePage <= 0:
				_update_menu("files", false)
		if new_text.containsn("EXIT"):
			$AnimationPlayer.play("leaving")
		if new_text.containsn("CODE"):
			_update_menu("codes", false)
			locationFound = true
		if new_text.containsn("STATS"):
			_update_menu("stats", false)
			locationFound = true
		if new_text.containsn("BACK"):
			if curMenu == "png":
				_close_file()
				pageHistory.resize(pageHistory.size()-1)
				pagePlacementHistory -= 1
				_update_menu(pageHistory[pagePlacementHistory], false)
				locationFound = true
			elif pagePlacementHistory != 0:
				pageHistory.resize(pageHistory.size()-1)
				pagePlacementHistory -= 1
				_update_menu(pageHistory[pagePlacementHistory], false)
				locationFound = true
			else:
				locationFound = false
		if new_text.containsn("FILES"):
			filePage = 0
			_update_menu("files", false)
			locationFound = true
		if new_text.containsn("MENU"):
			_update_menu("main", false)
			locationFound = true
		if !new_text.containsn("EXIT"):
			await get_tree().create_timer(1).timeout
			if locationFound == false:
				_change_text("That doesnt seem to exist...")
			_close_file()
			_set_terminal(true)

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
	
	if new_text.containsn("tunnels"):
		var tunnelpuzzle = load("res://tunnelpuzzle/scenes/tunnelpuzzle.tscn").instantiate()
		$/root.add_child(tunnelpuzzle)
		code_recognized = true
	
	if new_text.containsn("eeffoc"):
		get_tree().change_scene_to_file("res://scenes/whichisfunny.tscn")
		code_recognized = true
	
	if new_text.containsn("joca"):
		_change_text("faggot")
		code_recognized = true
	
	if new_text.containsn("ghost"):
		_change_text("hmm...")
		$AudioStreamPlayer.play()
		code_recognized = true
	
	if new_text.containsn("bell"):
		_change_text("i dont think that worked...")
		await get_tree().create_timer(1).timeout
		open_png("bell_toll", "bell_toll")
		code_recognized = true
	
	if code_recognized == false:
		_change_text("i dont think that worked...")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "leaving":
		get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
