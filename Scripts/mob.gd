extends Area2D
class_name Mob

@export var speed : float = 350
@onready var visibilityNotifier := $VisibleOnScreenNotifier2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += Vector2.DOWN * speed * delta

func on_screen_exited():
	self.queue_free()

func on_area_entered(other_area):
	if other_area is Player:
		get_tree().reload_current_scene()
		# alternatively: get_tree().quit()

func _ready():
	visibilityNotifier.connect("screen_exited", on_screen_exited)
	self.area_entered.connect(on_area_entered)
