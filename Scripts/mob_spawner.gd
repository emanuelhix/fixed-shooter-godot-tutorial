extends Node2D


@export var mob_parent : Node2D

@onready var mob := preload("res://Scenes/mob.tscn")
@onready var spawn_points := ($Points).get_children() # $ is shorthand for get_node()
@onready var timer : Timer = $Timer

func on_timer_ended():
	var random_position = spawn_points[randi() % spawn_points.size()].position
	var new_mob = mob.instantiate()
	new_mob.position = random_position
	new_mob.visible = true
	mob_parent.add_child(new_mob)

func _ready():
	timer.connect("timeout", on_timer_ended)
	# start the timer once all children have loaded
	timer.start()
