extends Enemy

@onready var shot_timer = $ShotTimer

@export var rotation_rate = 20

func _process(delta):
	rotate(deg_to_rad(rotation_rate) * delta)

func _on_shot_timer_timeout():
	shoot()
