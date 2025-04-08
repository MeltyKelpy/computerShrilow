extends Node2D

var loading

var creditors = [
	{
	"Name":"MeltyKelpy",
	"Image":"res://assets/images/mainMenu/credits/ppl/mel.png",
	"Pronouns":"It/Star",
	"Roles":"Game Creator -\nMain Artist -\nMain Coder -",
	"Commits":132,
	"Quote":"jesus = false",
	},
	{
	"Name":"kosejumpscare",
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
	"Roles":"Musician -\nCoder -",
	"Commits":0,
	"Quote":"",
	},
	{
	"Name":"Saayo",
	"Image":"res://assets/images/mainMenu/credits/ppl/saayo.png",
	"Pronouns":"She/Her",
	"Roles":"Artist -",
	"Commits":8,
	"Quote":"kill melty",
	},
	{
	"Name":"GhostyBricks",
	"Image":"res://assets/images/mainMenu/credits/ppl/ghost.png",
	"Pronouns":"He/Him",
	"Roles":"hads very many coolideas :grin: -",
	"Commits":0,
	"Quote":"",
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
	"Name":"SkyHighSilly",
	"Image":"res://assets/images/mainMenu/credits/ppl/sky.png",
	"Text":'Playtester\n\n""',
	},
	{
	"Name":"Hekza",
	"Image":"res://assets/images/mainMenu/credits/ppl/hekza.png",
	"Text":'Playtester\n\n""',
	},
	{
	"Name":"Jocapelt",
	"Image":"res://assets/images/mainMenu/credits/ppl/jocaused.png",
	"Text":'Playtester\n\n""',
	},
	{
	"Name":"Kawo",
	"Image":"res://assets/images/mainMenu/credits/ppl/kawo.png",
	"Text":'Artist\n\n""',
	},
	{
	"Name":"lilrougedragon",
	"Image":"res://assets/images/mainMenu/credits/ppl/henry.png",
	"Text":'Artist\n\n""',
	}
	]

var selectedCredit = 0
var commits = 141

var evil = []
var contributerSel = 0

var intro = true
var can = true

var config = ConfigFile.new()

@onready var dots = [
	$Credits/dot1,
	$Credits/dot2,
	$Credits/dot3,
	$Credits/dot4,
	$Credits/dot5,
	$Credits/dot6,
	$Credits/dot7,
	$Credits/dot8,
	]

func _ready() -> void:
	$stuff/TXT.text = "beta build: "+Game.gameVersion+"\nExported: April 7th, 2025"
	Settings.loadData()
	for i in range(0,3):
		var cacapoopyFUCK = load("res://technical/saveBox.tscn")
		var caca = cacapoopyFUCK.instantiate()
		caca.ID = i
		caca.position.x = 109
		caca.position.y = 204 + (163 * i)
		$SaveFiles.add_child(caca)
	for i in range(0, contributers.size()-1):
		if i != 0:
			var cacapoopyFUCK = load("res://technical/contributer.tscn")
			var caca = cacapoopyFUCK.instantiate()
			caca.parent = self
			caca.id = i
			caca.textures = contributers[i]["Image"]
			$Credits/Contributers/ScrollContainer/GridContainer.add_child(caca)

func _process(delta: float) -> void:
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
	can = true
	print(anim_name)
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
		OS.shell_open("https://bsky.app/profile/juiceboxfactory.bsky.social")

func _on_button_pressed(type) -> void:
	$SFXPick.play()
	loading = type
	$loadingScreen/loading.play("loading")
	can = false

func _on_tutorial_pressed() -> void:
	_on_button_pressed("tutorial")

func _on_audio_stream_player_finished() -> void:
	$song.play()
