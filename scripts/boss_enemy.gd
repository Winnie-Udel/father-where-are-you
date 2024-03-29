extends Enemy

func _physics_process(delta):
	position.x += -speed * delta
	if position.x <= 750:
		position.x = 750
	
