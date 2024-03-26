class_name Player extends CharacterBody2D

signal laser_shot(laser_scene, location)

# Speed in pixels/sec
@export var speed = 400 
@export var health = 100
@onready var muzzle = $Muzzle

var screen_size 
var laser_scene = preload("res://scenes/laser.tscn")

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	
func _physics_process(_delta):
	# Handle movement and deceleration
	var direction = Input.get_axis("move_up", "move_down")
	if direction: 
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, 10)
		
	# Prevent character from moving offscreen
	global_position.x = clamp(global_position.x, 0, screen_size.x)
	global_position.y = clamp(global_position.y, 0, screen_size.y)
	
	move_and_slide()
	
func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
	
func damage(amount):
	print("health is " + str(health))
	health -= amount
	if health <= 0:
		# Player dies
		queue_free()
