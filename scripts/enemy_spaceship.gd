class_name Enemy extends Area2D

@export var speed = 150

func _physics_process(delta):
	global_position.x += -speed * delta

# Enemy dies 
func die(): 
	queue_free()
		
func _on_body_entered(body):
	# If enemy collides with player, enemy disappears
	if body is Player: 
		die()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
