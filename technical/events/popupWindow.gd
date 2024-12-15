extends Window

var ads = [
	{
	"Name":"Frumpo Farm",
	"Image":"res://assets/images/events/popupAds/frumpoFarm.png"
	},
	{
	"Name":"#1 meltykelpy hater",
	"Image":"res://assets/images/events/popupAds/killMelty.png"
	},
	{
	"Name":"Legend of the Skintaker: Reskinned",
	"Image":"res://assets/images/events/popupAds/skintaker.png"
	},
	{
	"Name":"next thing you know, im reincarnated as Jesus Christ",
	"Image":"res://assets/images/events/popupAds/fish!.png"
	},
	{
	"Name":"Miner Kid INC",
	"Image":"res://assets/images/events/popupAds/theminerkid.png"
	},
	{
	"Name":"The Manga Mart",
	"Image":"res://assets/images/events/popupAds/mangaMart.png"
	},
	]

var xPo
var yPo

func _ready() -> void:
	reparent($/root/computerShrilow)
	var rng = randi_range(0, ads.size()-1)
	title = ads[rng]["Name"]
	$Sprite2D.texture = load(ads[rng]["Image"])
	xPo = randi_range(100, DisplayServer.screen_get_size().x - 200)
	yPo = randi_range(100, DisplayServer.screen_get_size().y - 200)
	position.y = yPo
	position.x = xPo

func _process(delta: float) -> void:
	pass

func _on_close_requested() -> void:
	queue_free()
