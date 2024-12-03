extends TextureRect

var jellyNum = 0
var jelly = "Gardener Jelly"
var rarity = "Rare"

var is_dragging = false

var colorsIgLOL = [
	{
	"Common":Color(1, 0.9058823529, 0.8509803922),
	"Uncommon":Color(0.462745098, 0.9529411765, 0.5411764706),
	"Rare":Color(0.9333333333, 0.4196078431, 0.4980392157),
	"Awesome":Color(0.5921568627, 0.4196078431, 0.9333333333),
	},
	]

func _ready() -> void:
	if rarity != "Queer":
		$jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$jelly.material.set_shader_parameter("rainbow", false)
	else:
		$jelly.material.set_shader_parameter("rainbow", true)
	$jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")

func _process(delta: float) -> void:
	$Label.text = jelly
	if rarity == "Queer":
		if Jelly.queerJellies[jellyNum]["Discovered"] == false:
			$jelly.modulate = Color(0,0,0,1)
		else:
			$jelly.modulate = Color(1,1,1,1)
	if rarity == "Awesome":
		if Jelly.awesomeJellies[jellyNum]["Discovered"] == false:
			$jelly.modulate = Color(0,0,0,1)
		else:
			$jelly.modulate = Color(1,1,1,1)
	if rarity == "Rare":
		if Jelly.rareJellies[jellyNum]["Discovered"] == false:
			$jelly.modulate = Color(0,0,0,1)
		else:
			$jelly.modulate = Color(1,1,1,1)
	if rarity == "Uncommon":
		if Jelly.uncommonJellies[jellyNum]["Discovered"] == false:
			$jelly.modulate = Color(0,0,0,1)
		else:
			$jelly.modulate = Color(1,1,1,1)
	if rarity == "Common":
		if Jelly.commonJellies[jellyNum]["Discovered"] == false:
			$jelly.modulate = Color(0,0,0,1)
		else:
			$jelly.modulate = Color(1,1,1,1)
