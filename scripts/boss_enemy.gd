extends Enemy

@export var attacks: Array[PackedScene] = []
@export var rotation_rate = 80

@onready var boss = $Sprite2D
@onready var boss_health_bar = get_parent().get_node("UI/HUB/BossHealthBar")

func _ready():
	boss_health_bar.max_value = 50

func _process(delta):
	set_health_bar()
	boss.rotate(deg_to_rad(rotation_rate) * delta)
	
func _physics_process(delta):
	position.x += -speed * delta
	if position.x <= 750:
		position.x = 750
	
func shoot():
	for child in muzzle_positions.get_children():
		var attack = attacks.pick_random().instantiate()
		attack.global_position = child.global_position
		get_tree().current_scene.add_child(attack)

func _on_shot_timer_timeout():
	shoot()

func set_health_bar():
	boss_health_bar.value = health
	
