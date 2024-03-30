class_name Player extends CharacterBody2D

signal laser_shot(laser_scene, location)

# Speed in pixels/sec
@export var speed = 400 
@export var health = 100
@onready var muzzle = $Muzzle
@onready var player_health_bar = get_parent().get_node("PlayerHealthBar")
@onready var shoot_sound = $Shoot

var screen_size 
var laser_scene = preload("res://scenes/laser.tscn")

func _ready():
	screen_size = get_viewport_rect().size
	player_health_bar.max_value = 100
	
func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		shoot_sound.play()
		shoot()
	set_health_bar()
	
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

func set_health_bar():
	player_health_bar.value = health
	
func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
	
func damage(amount):
	health -= amount
	if health <= 0:
		# Player dies
		queue_free()
		get_tree().change_scene_to_file("res://scenes/defeated.tscn")
