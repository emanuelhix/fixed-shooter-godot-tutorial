extends Node2D

@export var player : Area2D
@onready var laser := preload("res://Scenes/laser.tscn")

func _input(event):
	if event.is_action_pressed("fire_laser"):
		var laser0 := laser.instantiate()
		laser0.global_position = player.left_muzzle.global_position
		var laser1 := laser.instantiate()
		laser1.global_position = player.right_muzzle.global_position
		add_child(laser0)
		add_child(laser1)
