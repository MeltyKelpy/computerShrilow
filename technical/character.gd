extends Node2D

var Name = "Shrilow"
var MoneyGain = 1
var Speed = 2
var Level = 1
var Swings = 2
var BasePrice = 150
var sellPath : NodePath
var state = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharName.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterSprite.texture = load("res://assets/images/areas/mines/"+Name+str(state)+".png")
	$CharName.text = Name+"\n"+str(MoneyGain)+"$ per Swing\nSpeed: "+str(Speed)+"\nLevel: "+str(Level)

func _on_selection_mouse_entered() -> void:
	$CharName.visible = true

func _on_selection_mouse_exited() -> void:
	$CharName.visible = false
