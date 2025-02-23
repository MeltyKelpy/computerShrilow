extends Node2D

var pageLeftVal = 1
var pageRightVal = 2
var displayPage = 1

func _ready():
	spawnAchievementsPls()
	tabPressed("entries")
	for i in range(1, Journal.entries.size()):
		var cacapoopyGOD3 = preload("res://technical/rooms/entry.tscn")
		var caca2 = cacapoopyGOD3.instantiate()
		caca2.entryName = Journal.entries[i]["EntryName"]
		caca2.attachedEntry = i
		$Entries/ScrollContainer2/VBoxContainer.add_child(caca2)

func _process(delta: float) -> void:
	$Entries/ScrollContainer/Label2.text = Journal.entries[Journal.selectedJournal]["EntryName"]+"\n\n"+Journal.entries[Journal.selectedJournal]["Text"]
	if $Entries.visible == true:
		$achievementsButton.button_pressed = false
		$entriesButton.button_pressed = true
	if $Achievements.visible == true:
		$achievementsButton.button_pressed = true
		$entriesButton.button_pressed = false
	if get_tree().paused == true:
		$Entries/ScrollContainer2.visible = false
	else:
		$Entries/ScrollContainer2.visible = true

func _on_back_button_ward_pressed() -> void:
	queue_free()

func spawnAchievementsPls():
	for i in $Achievements/LeftPage.get_children():
		i.queue_free()
	for i in $Achievements/RightPage.get_children():
		i.queue_free()
	GDConsole.print_line("thank you for spawning the achievements :pray:")
	for i in range((4*pageLeftVal)-4, (4*pageLeftVal)):
		if i <= Achievements.achievements.size()-1:
			var cacapoopyGOD3 = preload("res://technical/achievementDisplay.tscn")
			var caca2 = cacapoopyGOD3.instantiate()
			caca2.achievementTitle = Achievements.achievements[i]["name"]
			caca2.achievementDesc = Achievements.achievements[i]["desc"]
			caca2.achievementTooltip = Achievements.achievements[i]["requirement"]
			caca2.achievementID = i
			caca2.iconToUse = Achievements.achievements[i]["name"]
			$Achievements/LeftPage.add_child(caca2)
	for i in range((4*pageRightVal)-4, (4*pageRightVal)):
		if i <= Achievements.achievements.size()-1:
			var cacapoopyGOD3 = preload("res://technical/achievementDisplay.tscn")
			var caca2 = cacapoopyGOD3.instantiate()
			caca2.achievementTitle = Achievements.achievements[i]["name"]
			caca2.achievementDesc = Achievements.achievements[i]["desc"]
			caca2.achievementTooltip = Achievements.achievements[i]["requirement"]
			caca2.achievementID = i
			caca2.iconToUse = Achievements.achievements[i]["name"]
			$Achievements/RightPage.add_child(caca2)

func tabPressed(which: String) -> void:
	$Entries.visible = false
	$Achievements.visible = false
	if which == "entries":
		$Entries.visible = true
	if which == "achievements":
		$Achievements.visible = true

func flipPage(howMuch : int):
	if (pageLeftVal + (2 * howMuch) <= (Achievements.achievements.size()-1) / 4) and (displayPage + (1 * howMuch)) >= 1:
		pageLeftVal += 2 * howMuch
		pageRightVal += 2 * howMuch
		displayPage += 1 * howMuch
	spawnAchievementsPls()
