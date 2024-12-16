extends Node2D

var creditors = [
	{
	"Name":"MeltyKelpy",
	"Image":"res://assets/images/mainMenu/credits/ppl/mel.png",
	"Pronouns":"It/Star",
	"Roles":"Game Creator -\nMain Artist -\nMain Coder -",
	"Commits":57,
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
	"Commits":6,
	"Quote":"",
	},
	{
	"Name":"GhostyBricks",
	"Image":"res://assets/images/mainMenu/credits/ppl/ghost.png",
	"Pronouns":"He/Him",
	"Roles":"hads very many coolideas :grin: -",
	"Commits":0,
	"Quote":"",
	},
	]

var selectedCredit = 0
var commits = 63

var evil = []

var can = true

var config = ConfigFile.new()

@onready var dots = [
	$Credits/dot1,
	$Credits/dot2,
	$Credits/dot3,
	$Credits/dot4,
	$Credits/dot5,
	]

func _ready() -> void:
	Settings.loadData()

func _process(delta: float) -> void:
	for i in dots.size():
		dots[i].modulate = Color(1,1,1,0.5)
	if selectedCredit > creditors.size()-1:
		selectedCredit = 0
	if selectedCredit < 0:
		selectedCredit = creditors.size()-1
	dots[selectedCredit].modulate = Color(1,1,1,1)
	$ParallaxBackground.scroll_base_offset.y -= 10 * delta/0.5
	$Credits/Name.text = creditors[selectedCredit]["Name"]
	$Credits/Pronouns.text = creditors[selectedCredit]["Pronouns"]
	$Credits/Jobs.text = creditors[selectedCredit]["Roles"]+"\nGithub Commits: "+str(creditors[selectedCredit]["Commits"])+"/"+str(commits)+" -"
	$Credits/Quote.text = '"'+creditors[selectedCredit]["Quote"]+'"'
	$Credits/person.texture = load(creditors[selectedCredit]["Image"])

func endMenu():
	get_tree().change_scene_to_file("res://scenes/tComputer.tscn")

func _on_start_pressed() -> void:
	if can == true:
		$loadingScreen/loading.play("loading")
		can = false

func changeSelection(toChange):
	selectedCredit += toChange

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	can = true
	if evil.size() != 0 and anim_name != "toSettings":
		for i in evil.size():
			evil[i].queue_free()
		evil.resize(0)

func _on_credits_pressed() -> void:
	if can == true:
		$AnimationPlayer.play("toCredits")
		can = false

func _on_backCredit_pressed() -> void:
	if can == true:
		$AnimationPlayer.play("leaveCredits")
		can = false

func _on_settings_pressed() -> void:
	if can == true:
		$settings/SettingsScene.spawnSettings()
		$AnimationPlayer.play("toSettings")
		can = false

func _on_backSettings() -> void:
	if can == true:
		Settings.saveData()
		$AnimationPlayer.play("leaveSettings")
		can = false
