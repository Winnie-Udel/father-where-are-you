class_name Enemy extends Area2D

signal killed

@export var speed = 100
@export var health = 5

@onready var muzzle_positions = $MuzzlePositions

var enemy_laser_scene = preload("res://scenes/enemy_laser.tscn")

func _physics_process(delta):
	# Enemy moves
	position.x += -speed * delta
	
func die(): 
	killed.emit()
	queue_free()
	
func damage(amount):
	health -= amount
	if health <= 0:
		die()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func shoot():
	for child in muzzle_positions.get_children():
		var enemy_laser = enemy_laser_scene.instantiate()
		enemy_laser.global_position = child.global_position
		get_tree().current_scene.add_child(enemy_laser)
		
func _on_body_entered(body):
	if body is Player:
		body.damage(10)
		queue_free()
