extends Node

@export var enemy_scenes: Array[PackedScene] = []

@onready var player = $Player
@onready var laser_container = $LaserContainer
@onready var enemy_container = $EnemyContainer
@onready var hud = $UI/HUB
@onready var boss_health_bar = get_node("UI/HUB/BossHealthBar")
@onready var boss_timer = $BossTimer
@onready var wait_timer = $WaitTimer
@onready var space_music = $SpaceMusic
@onready var boss_music = $BossMusic
@onready var exploded = $Explosion

var score = 0
var boss_enemy_scene = preload("res://scenes/boss_enemy.tscn")
var seconds
var boss_killed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player.laser_shot.connect(_on_player_laser_shot)
	boss_health_bar.hide()
	space_music.play()

func _process(delta):
	seconds = round(boss_timer.time_left)
	hud.update_timer_display(seconds)
	if boss_killed:
		player.global_position.x += player.speed * delta

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)

func _on_enemy_timer_timeout():
	# Pick a random enemy from the array of enemies
	var enemy = enemy_scenes.pick_random().instantiate()
	enemy.global_position = Vector2(1200, randf_range(50, 600))
	enemy.killed.connect(_on_enemy_killed)
	enemy_container.add_child(enemy)
	
func _on_enemy_killed():
	exploded.play()
	score += 1 
	hud.update_score(score)
	
func _on_boss_killed():
	exploded.play()
	boss_killed = true
	score += 10
	hud.update_score(score)
	wait_timer.start()

func _on_boss_timer_timeout():
	boss_health_bar.show()
	space_music.stop()
	boss_music.play()
	var boss = boss_enemy_scene.instantiate()
	boss.global_position = Vector2(1200, 300)
	boss.killed.connect(_on_boss_killed)
	add_child(boss)

func _on_wait_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/win.tscn")
