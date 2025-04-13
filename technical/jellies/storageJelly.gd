extends TextureRect

var jellyNum = 0
var jelly = "Gardener Jelly"
var desc = "Hi"
var rarity = "Rare"
var selfDiscoveredVar = false

var is_dragging = false

var colorsIgLOL = [
	{
	"Common":Color(1, 0.9058823529, 0.8509803922),
	"Uncommon":Color(0.462745098, 0.9529411765, 0.5411764706),
	"Rare":Color(0.9333333333, 0.4196078431, 0.4980392157),
	"Awesome":Color(0.5921568627, 0.4196078431, 0.9333333333),
	"Blue":Color(0.2941176471, 0.4509803922, 1),
	},
	]

func _ready() -> void:
	if rarity != "Queer":
		$jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$jelly.material.set_shader_parameter("rainbow", false)
	else:
		$jelly.material.set_shader_parameter("rainbow", true)

func _process(_delta: float) -> void:
	
	if Settings.setting_state("saayo"):
		$jelly.texture = load("res://assets/images/jellies/Plinker Jelly/jelly0.png")
		$jellyCover.texture = load("res://assets/images/jellies/Plinker Jelly/jelly0.png")
	else:
		$jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
		$jellyCover.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
	
	if rarity == "Blue":
		if Jelly.blueJellies[jellyNum]["Discovered"] == false:
			modulate = Color(0,0,0,0)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			modulate = Color(1,1,1,1)
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true
	
	if rarity == "Queer":
		if Jelly.queerJellies[jellyNum]["Discovered"] == false:
			$jellyCover.modulate = Color(0,0,0,1)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true
	
	if rarity == "Awesome":
		if Jelly.awesomeJellies[jellyNum]["Discovered"] == false:
			$jellyCover.modulate = Color(0,0,0,1)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true
	
	if rarity == "Rare":
		if Jelly.rareJellies[jellyNum]["Discovered"] == false:
			$jellyCover.modulate = Color(0,0,0,1)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true
	
	if rarity == "Uncommon":
		if Jelly.uncommonJellies[jellyNum]["Discovered"] == false:
			$jellyCover.modulate = Color(0,0,0,1)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true
	
	if rarity == "Common":
		if Jelly.commonJellies[jellyNum]["Discovered"] == false:
			$jellyCover.modulate = Color(0,0,0,1)
			$Label.text = "???"
			selfDiscoveredVar = false
		else:
			$jellyCover.modulate = Color(1,1,1,0)
			$Label.text = jelly
			selfDiscoveredVar = true

func _on_mouse_entered() -> void:
	if selfDiscoveredVar == false:
		Jelly.jellyName = "???"
		Jelly.jellyDesc = "???"
	else:
		if !Settings.setting_state("saayo"):
			Jelly.jellyName = jelly
			Jelly.jellyDesc = desc
		else:
			Jelly.jellyName = "Plinker Jelly"
			Jelly.jellyDesc = "saayo!"

func _on_mouse_exited() -> void:
	Jelly.jellyName = "Hover over a jelly to see its description!"
	Jelly.jellyDesc = "if you have said jelly, of course."
