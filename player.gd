extends CharacterBody2D

# Speed in pixels/sec
@export var speed = 400 
var screen_size 

func _physics_process(delta):
	# Handle movement and deceleration
	var direction = Input.get_axis("move_up", "move_down")
	if direction: 
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, 10)
		
	move_and_slide()
