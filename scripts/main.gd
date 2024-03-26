extends Node

@export var enemy_scenes: Array[PackedScene] = []

@onready var player = $Player
@onready var laser_container = $LaserContainer
@onready var enemy_container = $EnemyContainer
@onready var hud = $UI/HUB

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player.laser_shot.connect(_on_player_laser_shot)

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)

func _on_enemy_timer_timeout():
	var enemy = enemy_scenes.pick_random().instantiate()
	enemy.global_position = Vector2(1200, randf_range(50, 600))
	enemy.killed.connect(_on_enemy_killed)
	enemy_container.add_child(enemy)
	
func _on_enemy_killed():
	score += 1 
	hud.update_score(score)
