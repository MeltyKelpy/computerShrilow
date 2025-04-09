extends Node2D

var curMenu = "main"
var validChoices = []

func _ready() -> void:
	_update_menu("main")

func _update_menu(menu : String) -> void:
	if menu == "main":
		$Screen/Text.text ="""The Interstate:
		
		A Place to find your global stats, and other things of the sort.
		enter a section to get started!
		
		You can type the section name (The Captialized Part) at the bottom to enter a section
		MENU allows you to return here, and BACK will take you back to whatever your last page was.
		
		> STATS (global stats)
		
		> FILES (files)
		
		> RECYCLING (achievements)
		
		> CODES (uhm. codes.)
		"""

func _on_line_edit_text_submitted(new_text: String) -> void:
	pass # Replace with function body.
