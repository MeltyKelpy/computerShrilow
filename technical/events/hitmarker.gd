extends Node2D

var mouseOver = true
var mousePos : Vector2 = Vector2.ZERO
var difference : Vector2
var dead : bool

func _ready():
	self.position.x = -29
	self.position.y = -303

func _process(_delta: float) -> void:
	difference = mousePos - get_local_mouse_position()
	
	if Input.is_action_pressed("Click") and mouseOver == true:
		global_position -= difference

func _on_area_2d_mouse_entered() -> void:
	mouseOver = true
	print(mouseOver)

func _on_area_2d_mouse_exited() -> void:
	mouseOver = false
	print(mouseOver)

func _on_timer_timeout() -> void:
	if dead == true:
		get_tree().quit()
	else:
		queue_free()

func _on_timer_2_timeout() -> void:
	if $Area2D.get_overlapping_areas() != []:
		$AudioStreamPlayer.play()
		$CanvasLayer/ColorRect.visible = true
		$AnimationPlayer.play("gunshot")
		dead = true
	else:
		$AudioStreamPlayer.play()
		visible = false
		dead = false
