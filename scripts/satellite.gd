extends Enemy

@onready var shot_timer = $ShotTimer

func _on_shot_timer_timeout():
	shoot()
