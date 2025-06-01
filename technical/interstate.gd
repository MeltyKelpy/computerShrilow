extends Node

var fullTime = 0
var fullRebirths = 0
var iq = 0
var totalmoney = 0
var totallost = 0
var starslost = 0
var jelliesbought = 0
var plusones = 0
var saayoModeUnlocked = false
var baldiModeUnlocked = false
var tutorialDone = false
@onready var color = $ColorRect

func _enter_tree() -> void:
	loadData()

func _ready() -> void:
	var config = ConfigFile.new()
	
	var err = config.load("user://interstate.cfg")
	
	if err != OK:
		saveData()

func _process(delta: float) -> void:
	if $Timer.is_stopped():
		$Timer.start()
	if $autoSaveTimer.is_stopped():
		$autoSaveTimer.start()

func saveData():
	var config = ConfigFile.new()
	
	config.load("user://interstate.cfg")
	
	config.set_value("Stats", "Time", fullTime)
	config.set_value("Stats", "Rebirths", fullRebirths)
	config.set_value("Stats", "IQ", iq)
	config.set_value("Stats", "totalMoney", totalmoney)
	config.set_value("Stats", "totalSpent", totallost)
	config.set_value("Stats", "starsLost", starslost)
	config.set_value("Stats", "jelliesBought", jelliesbought)
	config.set_value("Stats", "plusOnes", plusones)
	config.set_value("Game", "tutorialOpened", tutorialDone)
	config.set_value("Game", "saayoModeUnlocked", saayoModeUnlocked)
	config.set_value("Game", "baldiModeUnlocked", baldiModeUnlocked)
	
	config.save("user://interstate.cfg")

func loadData():
	var config = ConfigFile.new()
	
	var err = config.load("user://interstate.cfg")
	
	if err == OK:
		fullTime = config.get_value("Stats", "Time", 0)
		fullRebirths = config.get_value("Stats", "Rebirths", 0)
		iq = config.get_value("Stats", "IQ", 0)
		saayoModeUnlocked = config.get_value("Game", "saayoModeUnlocked", false)
		baldiModeUnlocked = config.get_value("Game", "baldiModeUnlocked", false)
		totalmoney = config.get_value("Stats", "totalMoney", 0)
		totallost = config.get_value("Stats", "totalSpent", 0)
		starslost = config.get_value("Stats", "starsLost", 0)
		tutorialDone = config.get_value("Game", "tutorialOpened", false)
		jelliesbought = config.get_value("Stats", "jelliesBought", 0)
		plusones = config.get_value("Stats", "plusOnes", 0)

func _on_timer_timeout() -> void:
	fullTime += 1

func _on_auto_save_timer_timeout() -> void:
	saveData()
