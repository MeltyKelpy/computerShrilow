extends Node

var hotboxSel = 0
var hotboxes = [{"id":0,"stack":0},{"id":0,"stack":0},{"id":0,"stack":0}]
var amountOfHotboxes = 3

var hoxboxItems = [
	{
	"item_name":"",
	"held_img_id":"blank",
	"small_img_id":"blank",
	"stackable":false,
	},
	{
	"item_name":"Squeak",
	"held_img_id":"squeak",
	"small_img_id":"squeak",
	"stackable":false,
	},
	{
	"item_name":"Red Key",
	"held_img_id":"red_key",
	"small_img_id":"key",
	"stackable":false,
	},
	{
	"item_name":"Red Keycard",
	"held_img_id":"red_keycard",
	"small_img_id":"keycard",
	"stackable":false,
	},
	{
	"item_name":"Orange Key",
	"held_img_id":"orange_key",
	"small_img_id":"key",
	"stackable":false,
	},
	{
	"item_name":"Band-aid",
	"held_img_id":"bandaid",
	"small_img_id":"bandaid",
	"stackable":true,
	},
	]

func _process(delta: float) -> void:
	if hotboxSel < 0:
		hotboxSel = hotboxes.size()-1
	if hotboxSel > hotboxes.size()-1:
		hotboxSel = 0

func reset_box(id):
	hotboxes[id] = {"id":0,"stack":0}
