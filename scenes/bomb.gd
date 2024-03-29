extends Area2D

@export var speed = 300 

func _physics_process(delta):
	global_position.x += -speed * delta

# Remove laser when it exits the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	# Damage player
	if body is Player:
		body.damage(5)
		queue_free()

func _on_area_entered(area):
	if area is Laser: 
		area.queue_free()
		queue_free()
