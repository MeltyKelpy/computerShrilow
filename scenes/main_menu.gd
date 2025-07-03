extends Node2D

var loading

var creditors = [
	{
	"Name":"MeltyKelpy",
	"Image":"res://assets/images/mainMenu/credits/ppl/mel.png",
	"Pronouns":"It/Star",
	"Roles":"Game Creator -\nMain Artist -\nMain Coder -",
	"Commits":234,
	"Quote":"but my [color=#CC8800]g[/color][color=#CA8900]e[/color][color=#C88B00]n[/color][color=#C78C00]i[/color][color=#C58E00]u[/color][color=#C39000]s[/color] [color=#C09300]d[/color][color=#BE9500]a[/color][color=#BD9600]u[/color][color=#BB9800]g[/color][color=#B99A00]h[/color][color=#B89B00]t[/color][color=#B69D00]e[/color][color=#B49F00]r[/color] will know",
	},
	{
	"Name":"nevermaur_",
	"Image":"res://assets/images/mainMenu/credits/ppl/kose.png",
	"Pronouns":"He/Him",
	"Roles":"Main Musician -",
	"Commits":"69420 trust",
	"Quote":"",
	},
	{
	"Name":"OJSTheCoder",
	"Image":"res://assets/images/mainMenu/credits/ppl/OJ.png",
	"Pronouns":"They/Them",
	"Roles":"Musician -\nCoder -\nVoice Actor (AJS) -",
	"Commits":2,
	"Quote":"i cant trust you sluts",
	},
	{
	"Name":"Jocapelt",
	"Image":"res://assets/images/mainMenu/credits/ppl/jocaproper.png",
	"Pronouns":"Any/All",
	"Roles":"Voice Actor (QTE, The Doctor) -",
	"Commits":0,
	"Quote":"Mah bad teach... ahahahahha...",
	},
	{
	"Name":"Saayo",
	"Image":"res://assets/images/mainMenu/credits/ppl/saayo.png",
	"Pronouns":"She/Her",
	"Roles":"Artist -\nVoice Actor (LGE) -",
	"Commits":9,
	"Quote":"kill melty",
	},
	{
	"Name":"GhostyBricks",
	"Image":"res://assets/images/mainMenu/credits/ppl/ghost.png",
	"Pronouns":"Ghosty/Bricks (he/him)",
	"Roles":"hads very many coolideas :grin: -",
	"Commits":0,
	"Quote":"cant breed the jellies. 0 stars.",
	},
	{
	"Name":"Shrilow",
	"Image":"res://assets/images/mainMenu/credits/ppl/shrilow.png",
	"Pronouns":"He/Him",
	"Roles":"Punching Bag -\nAwesome Friend whos in the game -",
	"Commits":0,
	"Quote":"i hope that everyone who dies goes to hell no matter what",
	},
	{
	"Name":"JuiceBoxFactory",
	"Image":"res://assets/images/mainMenu/credits/ppl/juicebox.png",
	"Pronouns":"The Team!",
	"Roles":"",
	"Commits":0,
	"Quote":"",
	},
	{
	"Name":"ContributerSpot",
	"Image":"res://assets/images/mainMenu/credits/ppl/juicebox.png",
	"Pronouns":"fuck you",
	"Roles":"nothing btw -",
	"Commits":"all of them btw",
	"Quote":"YOU SHOULDNT BE SEEING THIS!",
	},
	]
var contributers = [
	{
	"Name":"Nobody",
	"Image":"res://assets/images/mainMenu/credits/ppl/none.png",
	"Text":'hover over a contributer!',
	},
	{
	"Name":"Hekza",
	"Image":"res://assets/images/mainMenu/credits/ppl/hekza.png",
	"Text":'Playtester\n\n""',
	},
	#{
	#"Name":"Jocapelt",
	#"Image":"res://assets/images/mainMenu/credits/ppl/jocaused.png",
	#"Text":'Playtester\n\n"my bad teach.. ahahha..."',
	#},
	{
	"Name":"Kawo",
	"Image":"res://assets/images/mainMenu/credits/ppl/kawo.png",
	"Text":'Artist\n\n""',
	},
	{
	"Name":"lilrougedragon",
	"Image":"res://assets/images/mainMenu/credits/ppl/henry.png",
	"Text":'Artist\n\n""',
	},
	{
	"Name":"amydoesthings",
	"Image":"res://assets/images/mainMenu/credits/ppl/aussie.png",
	"Text":'Menu SFX\n\n"my favorite part of the game was when i was in it"',
	},
	{
	"Name":"gurt",
	"Image":"res://assets/images/mainMenu/credits/ppl/whotf.png",
	"Text":'ts gurt\n\nwho the fuck is this guy',
	},
	]

var selectedCredit = 0
var commits = 245

var evil = []
var contributerSel = 0

var intro = true
var can = false

var config = ConfigFile.new()
var loadingFile = false

@onready var dots = [
	$Credits/dot1,
	$Credits/dot2,
	$Credits/dot3,
	$Credits/dot4,
	$Credits/dot5,
	$Credits/dot6,
	$Credits/dot7,
	$Credits/dot8,
	$Credits/dot9,
	]

func _ready() -> void:
	Interstate.saveData()
	Interstate.loadData()
	
	$stuff/Left/shit/start.disabled = !Interstate.tutorialDone
	
	if $stuff/Left/shit/start.disabled == true:
		$stuff/Left/shit/start.add_theme_constant_override("outline_size", 0) 
	
	if Interstate.fullRebirths >= 1:
		$stuff/Left/shit/interstate.visible = true
		$stuff/Left/shit/interstate.disabled = false
	else:
		$stuff/Left/shit/interstate.visible = false
		$stuff/Left/shit/interstate.disabled = true
	
	$stuff/TXT.text = "beta build: "+Game.gameVersion+"\nExported: June 27th, 2025, 4:39am"
	Settings.loadData()
	for i in range(0,3):
		var cacapoopyFUCK = load("res://technical/saveBox.tscn")
		var caca = cacapoopyFUCK.instantiate()
		caca.ID = i
		caca.parent = self
		caca.position.x = 109
		caca.position.y = 204 + (163 * i)
		$SaveFiles.add_child(caca)
	for i in range(0, contributers.size()):
		if i != 0:
			var cacapoopyFUCK = load("res://technical/contributer.tscn")
			var caca = cacapoopyFUCK.instantiate()
			caca.parent = self
			caca.id = i
			caca.textures = contributers[i]["Image"]
			$Credits/Contributers/ScrollContainer/GridContainer.add_child(caca)

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("DebugMode"):
		get_tree().reload_current_scene()
	
	for i in dots.size():
		dots[i].modulate = Color(1,1,1,0.5)
	if selectedCredit > dots.size()-1:
		selectedCredit = 0
	if selectedCredit < 0:
		selectedCredit = dots.size()-1
	dots[selectedCredit].modulate = Color(1,1,1,1)
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5
	
	if creditors[selectedCredit]["Name"] != "JuiceBoxFactory" and creditors[selectedCredit]["Name"] != "ContributerSpot":
		$Credits/Main.visible = true
		$Credits/Contributers.visible = false
		$Credits/Main/JBF.position.y = 1200
		$Credits/Main/Name.text = creditors[selectedCredit]["Name"]
		$Credits/Main/Pronouns.text = creditors[selectedCredit]["Pronouns"]
		$Credits/Main/Jobs.text = creditors[selectedCredit]["Roles"]+"\nGithub Commits: "+str(creditors[selectedCredit]["Commits"])+"/"+str(commits)+" -"
		$Credits/Main/Quote.text = '"'+creditors[selectedCredit]["Quote"]+'"'
		$Credits/Main/person.texture = load(creditors[selectedCredit]["Image"])
		$Credits/Main/stupid.visible = (creditors[selectedCredit]["Name"] == "nevermaur_")
	elif creditors[selectedCredit]["Name"] == "JuiceBoxFactory":
		$Credits/Main.visible = true
		$Credits/Contributers.visible = false
		$Credits/Main/JBF.position.y = 257
		$Credits/Main/Name.text = creditors[selectedCredit]["Name"]
		$Credits/Main/Pronouns.text = creditors[selectedCredit]["Pronouns"]
		$Credits/Main/Jobs.text = ""
		$Credits/Main/Quote.text = ""
		$Credits/Main/person.texture = load(creditors[selectedCredit]["Image"])
	else:
		$Credits/Main.visible = false
		$Credits/Contributers.visible = true
		$Credits/Contributers/Name.text = contributers[contributerSel]["Name"]
		$Credits/Contributers/Icon.texture = load(contributers[contributerSel]["Image"])
		$Credits/Contributers/Text.text = contributers[contributerSel]["Text"]
	
	if Input.is_action_just_pressed("Click") and intro == true:
		_endIntro(true)

func _endIntro(manual : bool):
	$intro.visible = false
	intro = false
	if manual == true:
		$AudioStreamPlayer.playing = false
		_on_audio_stream_player_finished()
		$AnimationPlayer2.play("skip")
	await get_tree().create_timer(0.1).timeout
	can = true

func endMenu():
	if loading == "game":
		get_tree().change_scene_to_file("res://scenes/tComputer.tscn")
	if loading == "tutorial":
		get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func _on_start_pressed() -> void:
	$SFXPick.play()
	if can == true:
		Settings.loadData()
		$AnimationPlayer.play("toFiles")
		can = false

func changeSelection(toChange):
	$SFXScroll.play()
	selectedCredit += toChange

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	can = true
	if anim_name == "leaveSettings":
		$settings/SettingsScene.kill()

func _on_credits_pressed() -> void:
	$SFXPick.play()
	if can == true:
		$AnimationPlayer.play("toCredits")
		can = false

func _on_backCredit_pressed() -> void:
	$SFXCan.play()
	if can == true:
		$AnimationPlayer.play("leaveCredits")
		can = false

func _on_settings_pressed() -> void:
	$SFXPick.play()
	if can == true:
		$settings/SettingsScene.spawnSettings()
		$AnimationPlayer.play("toSettings")
		can = false

func _on_backSettings() -> void:
	$SFXCan.play()
	if can == true:
		$AnimationPlayer.play("leaveSettings")
		can = false

func _on_backFiles() -> void:
	$SFXCan.play()
	if can == true:
		$AnimationPlayer.play("leaveFiles")
		can = false

func openLink(site : String) -> void:
	if site == "BlueSky":
		OS.shell_open("https://bsky.app/profile/juiceboxfactory.bsky.social")
	if site == "Twitter":
		OS.shell_open("https://x.com/JuiceBoxFactory")
	if site == "YouTube":
		OS.shell_open("https://www.youtube.com/@juiceboxfactoryReal")
	if site == "Our Website":
		OS.shell_open("https://juiceboxfactory.neocities.org")

func _on_button_pressed(type) -> void:
	$SFXPick.play()
	loading = type
	$loadingScreen/loading.play("loading")
	can = false

func _on_tutorial_pressed() -> void:
	_on_button_pressed("tutorial")

func _on_audio_stream_player_finished() -> void:
	$song.play()

func _on_interstate_pressed() -> void:
	Interstate.color.visible = true
	$AudioStreamPlayer.volume_db = -80
	$song.volume_db = -80
	$click.play()
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://scenes/interstate.tscn")
