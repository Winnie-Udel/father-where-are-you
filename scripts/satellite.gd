extends Enemy

@onready var shot_timer = $ShotTimer
@onready var satellite_base = $Sprite2D

@export var rotation_rate = 20

func _process(delta):
	satellite_base.rotate(deg_to_rad(rotation_rate) * delta)

func _on_shot_timer_timeout():
	shoot()
