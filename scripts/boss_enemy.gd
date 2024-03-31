extends Enemy

@export var attacks: Array[PackedScene] = []
@onready var boss_health_bar = get_parent().get_node("UI/HUB/BossHealthBar")

func _ready():
	boss_health_bar.max_value = 50

func _process(_delta):
	set_health_bar()
	
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
	
