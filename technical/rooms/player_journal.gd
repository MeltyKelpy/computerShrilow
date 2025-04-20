extends Node2D

var pageLeftVal = 1
var pageRightVal = 2
var displayPage = 1
var comicPage = 0
var bookOpen = false
var comics = [
	["redhat","quickshot"],
	["stalkcore","kyssing"],
	["topsurgery","familiar"],
	]

func _ready():
	$MainPage/Label4.text = "NOTEBOOK OWNED BY:\n"+str(Game.namee)
	$openBook.position.y = 15.0
	spawnAchievementsPls()
	_comic_swap(0)
	tabPressed("cover")
	for i in range(0, Journal.entries.size()-1):
		var cacapoopyGOD3 = preload("res://technical/rooms/entry.tscn")
		var caca2 = cacapoopyGOD3.instantiate()
		caca2.entryName = str(Journal.entries[i]["EntryName"])
		caca2.attachedEntry = i
		$Entries/ScrollContainer2/VBoxContainer.add_child(caca2)

func _process(delta: float) -> void:
	if Journal.entries.size() != 0:
		$Entries/ScrollContainer/Label2.text = str(Journal.entries[Journal.selectedJournal]["EntryName"])+"\n\n"+str(Journal.entries[Journal.selectedJournal]["Text"])
	
	if $Entries.visible == true:
		$achievementsButton.button_pressed = false
		$entriesButton.button_pressed = true
		$mainPageButton.button_pressed = false
		$comicsButton.button_pressed = false
	if $Achievements.visible == true:
		$achievementsButton.button_pressed = true
		$entriesButton.button_pressed = false
		$mainPageButton.button_pressed = false
		$comicsButton.button_pressed = false
	if $MainPage.visible == true:
		$achievementsButton.button_pressed = false
		$entriesButton.button_pressed = false
		$mainPageButton.button_pressed = true
		$comicsButton.button_pressed = false
	if $Comics.visible == true:
		$achievementsButton.button_pressed = false
		$entriesButton.button_pressed = false
		$mainPageButton.button_pressed = false
		$comicsButton.button_pressed = true
	
	if get_tree().paused == true:
		$Entries/ScrollContainer2.visible = false
	else:
		$Entries/ScrollContainer2.visible = true

func _on_back_button_ward_pressed() -> void:
	$paper.play()
	if bookOpen == false:
		$AnimationPlayer.play("closeBook")
		tabPressed("cover")
	if bookOpen == true:
		$AnimationPlayer.play("closeBook_2")
		tabPressed("cover")

func _evil():
	queue_free()

func spawnAchievementsPls():
	for i in $Achievements/LeftPage.get_children():
		i.queue_free()
	for i in $Achievements/RightPage.get_children():
		i.queue_free()
	#GDConsole.print_line("thank you for spawning the achievements :pray:")
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
	$MainPage.visible = false
	$Comics.visible = false
	if which == "cover":
		$back.visible = false
		$pages.visible = false
		$mainPageButton.visible = false
		$entriesButton.visible = false
		$achievementsButton.visible = false
		$comicsButton.visible = false
		$closed.visible = true
	else:
		$back.visible = true
		$pages.visible = true
		$mainPageButton.visible = true
		$entriesButton.visible = true
		$achievementsButton.visible = true
		$comicsButton.visible = true
		$closed.visible = false
	$paper.play()
	if which == "mainpage":
		$MainPage.visible = true
	if which == "entries":
		$Entries.visible = true
	if which == "achievements":
		$Achievements.visible = true
	if which == "comics":
		$Comics.visible = true

func flipPage(howMuch : int):
	$paper.play()
	if (pageLeftVal + (2 * howMuch) <= (Achievements.achievements.size()-1) / 4) and (displayPage + (1 * howMuch)) >= 1:
		pageLeftVal += 2 * howMuch
		pageRightVal += 2 * howMuch
		displayPage += 1 * howMuch
	spawnAchievementsPls()

func _on_open_book_pressed() -> void:
	$openBook.disabled = true
	$openBook.position.y = 1000
	$AnimationPlayer.play("openBook")
	bookOpen = true

func _comic_swap(howMuch : int):
	if (howMuch == -1 and comicPage > 0) or (howMuch == 1 and comicPage < comics.size()-1):
		$paper.play()
		comicPage += howMuch
	$Comics/leftComic.texture = load("res://assets/images/areas/notebook/comics/"+comics[comicPage][0]+".png")
	$Comics/rightComic.texture = load("res://assets/images/areas/notebook/comics/"+comics[comicPage][1]+".png")
