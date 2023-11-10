extends Area2D
class_name Player

@onready var left_muzzle := $Muzzle0
@onready var right_muzzle := $Muzzle1

var speed : int = 250
var input_vector := Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
