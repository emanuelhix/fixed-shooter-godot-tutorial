extends Area2D

@export var speed : float = 600

@onready var visibilityNotifier = $VisibleOnScreenNotifier2D

func _physics_process(delta):
	global_position += delta * speed * Vector2.UP

func _on_area_entered(other_area):
	if other_area is Mob:
		other_area.queue_free()
		self.queue_free()

func _ready():
	self.connect("area_entered", _on_area_entered)
	visibilityNotifier.connect("screen_exited", queue_free)
