extends CharacterBody2D

signal laser_shot(laser_scene, location)

# Speed in pixels/sec
@export var speed = 400 
@onready var muzzle = $Muzzle

var screen_size 
var laser_scene = preload("res://scenes/laser.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	
func _physics_process(delta):
	# Handle movement and deceleration
	var direction = Input.get_axis("move_up", "move_down")
	if direction: 
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, 10)
		
	move_and_slide()

func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
	
