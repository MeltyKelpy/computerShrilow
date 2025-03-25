extends TextureRect

var iconToUse = ""
var achievementTitle = ""
var achievementDesc = ""
var achievementTooltip = ""
var achievementID = 0

func _ready():
	if Achievements.achievements[achievementID]["unlocked?"] == false:
		$Desc.text = "???"
	else:
		$Desc.text = achievementDesc

func _process(delta: float) -> void:
	$Desc.size.x = 224.0
	$Desc.position.x = 18.0
	if ResourceLoader.exists("res://assets/images/ui/achievements/"+iconToUse+".png"):
		self.texture = load("res://assets/images/ui/achievements/"+iconToUse+".png")
	else:
		self.texture = load("res://assets/images/ui/achievements/noiconfound.png")
	
	if Achievements.achievements[achievementID]["unlocked?"] == false:
		self_modulate = Color(0,0,0,1)
		$Title.text = "???"
	else:
		self_modulate = Color(1,1,1,1)
		$Title.text = achievementTitle

func _on_mouse_entered() -> void:
	$Desc.text = achievementTooltip

func _on_mouse_exited() -> void:
	if Achievements.achievements[achievementID]["unlocked?"] == false:
		$Desc.text = "???"
	else:
		$Desc.text = achievementDesc
