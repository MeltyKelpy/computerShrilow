extends TextureRect

var jellyNum = 0
var jelly = "Gardener Jelly"
var money = 0
var seconds = 0
var rarity = "Rare"

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
	$jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
	$Label.text = jelly+"\n"+rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"
