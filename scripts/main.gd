extends Node

@onready var player = $Player
@onready var laser_container = $LaserContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	player.laser_shot.connect(_on_player_laser_shot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)
