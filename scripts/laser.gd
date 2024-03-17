extends Area2D

@export var speed = 700 

func _physics_process(delta):
	global_position.x += speed * delta

# Remove laser when it exits the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	# Check if laser collides with enemy spaceship
	if area is Enemy:
		area.die()
		queue_free()
