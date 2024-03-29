class_name satellite extends Enemy

@onready var shot_timer = $ShotTimer
@onready var satellite_base = $Sprite2D
@onready var satellite_dish = $Dish

@export var rotation_rate = 20

func _physics_process(delta):
	position.x += -speed * delta
	if position.x <= 1000:
		position.x = 1000
	
func _process(delta):
	satellite_base.rotate(deg_to_rad(rotation_rate) * delta)
	satellite_dish.rotate(deg_to_rad(-rotation_rate) * delta)

func _on_shot_timer_timeout():
	shoot()

func _on_area_entered(area):
	if area is satellite: 
		queue_free()
