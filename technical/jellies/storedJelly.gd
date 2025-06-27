extends TextureRect

var jellyNum = 0
var jelly = "Gardener Jelly"
var money = 0
var seconds = 0
var rarity = "Rare"
var repos = []

var colorsIgLOL = [
	{
	"Common":Color(1, 0.9058823529, 0.8509803922),
	"Uncommon":Color(0.462745098, 0.9529411765, 0.5411764706),
	"Rare":Color(0.9333333333, 0.4196078431, 0.4980392157),
	"Awesome":Color(0.5921568627, 0.4196078431, 0.9333333333),
	"Blue":Color(0.2941176471, 0.4509803922, 1),
	"Ultra Fucking Rare":Color(0.951, 0.544, 0.065),
	},
	]

func _ready() -> void:
	if rarity != "Queer" and rarity != "Market":
		$jelly.material.set_shader_parameter("line_color", colorsIgLOL[0][rarity])
		$jelly.material.set_shader_parameter("rainbow", false)
	elif rarity == "Queer":
		$jelly.material.set_shader_parameter("rainbow", true)
	elif jelly == "Phantom Jelly":
		$jelly.material.set_shader_parameter("line_color", Color(1.0, 0.847, 0.376, 1))
		$jelly.material.set_shader_parameter("rainbow", false)
	elif jelly == "Antag Jelly":
		$jelly.material.set_shader_parameter("line_color", Color(1.0, 0.376, 0.851, 1))
		$jelly.material.set_shader_parameter("rainbow", false)
	$jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
	$Label.text = jelly+"\n"+rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"

func _process(delta: float) -> void:
		if !Settings.setting_state("saayo"):
			$jelly.texture = load("res://assets/images/jellies/"+jelly+"/jelly0.png")
			$Label.text = jelly+"\n"+rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"
		else:
			$jelly.texture = load("res://assets/images/jellies/Plinker Jelly/jelly0.png")
			$Label.text = "Plinker Jelly\n"+rarity+"\n"+str(money)+"$ per "+str(seconds)+" Seconds"

func spawnRepos():
	for i in $/root/computerShrilow/Jelly/rooms.get_child_count():
		var hi = $/root/computerShrilow/Jelly/rooms.get_child(i)
		if hi.jellyCount != hi.maxJel:
			var cacaPoopyFUCK = load("res://technical/jellies/jellyRepo.tscn")
			var caca = cacaPoopyFUCK.instantiate()
			caca.naame = hi.Aname
			caca.jelly = hi.jellyCount
			caca.posX = hi.camXpos
			caca.posY = hi.camYpos
			caca.hi = hi
			caca.ID = i
			add_child(caca)
			caca.reparent($ScrollContainer/HBoxContainer)
			repos.append(caca)
	if $/root/computerShrilow/Jelly/rooms.get_child_count() == 0:
		$buy.visible = true

func spawnJelly(ID):
		var cacaPoopyFUCK = load("res://technical/items/jelly.tscn")
		var caca = cacaPoopyFUCK.instantiate()
		caca.jelly = Jelly.storedJellys[jellyNum]["Name"]
		caca.rarity = Jelly.storedJellys[jellyNum]["Rarity"]
		caca.money = Jelly.storedJellys[jellyNum]["MoneyGain"]
		caca.seconds = Jelly.storedJellys[jellyNum]["Seconds"]
		if Jelly.storedJellys[jellyNum]["ID"] != null:
			caca.id = Jelly.storedJellys[jellyNum]["ID"]
		caca.selfDiscoveredVar = true
		$/root/computerShrilow/Jelly/Control.add_child(caca)
		Jelly.storedJellys.erase(jellyNum)
		caca._on_change_floor_pressed(ID)
		caca.setParent()
		caca.findRoom($/root/computerShrilow/Jelly/rooms.get_child(ID))
		$/root/computerShrilow._deleteStorag()
		Jelly.storedJellys.remove_at(jellyNum)
		$/root/computerShrilow._spawnStorage()
		

func _on_send_pressed() -> void:
	spawnRepos()
	$X.visible = true
	$shti/Send.disabled = true
	$shti/Sell.disabled = true
	$shti.visible = false
	$ScrollContainer.visible = true

func _on_sell_pressed() -> void:
	if rarity == "Common":
		ItemValues.money += 100
	if rarity == "Uncommon":
		ItemValues.money += 300
	if rarity == "Rare":
		ItemValues.money += 600
	if rarity == "Awesome":
		ItemValues.money += 1000
	if rarity == "Queer":
		ItemValues.money += 5000
	if rarity == "Blue":
		ItemValues.money += 1000000
	if rarity != "Market":
		$/root/computerShrilow._deleteStorag()
		Jelly.storedJellys.remove_at(jellyNum)
		$/root/computerShrilow._spawnStorage()

func _on_x_pressed() -> void:
	for i in repos.size():
		repos[i].queue_free()
	repos.resize(0)
	$X.visible = false
	$buy.visible = false
	$shti/Send.disabled = false
	$shti/Sell.disabled = false
	$shti.visible = true
	$ScrollContainer.visible = false
