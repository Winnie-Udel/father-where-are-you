extends Enemy

var enemy_bomb_scene = preload("res://scenes/bomb.tscn")

func shoot():
	for child in muzzle_positions.get_children():
		var enemy_bomb = enemy_bomb_scene.instantiate()
		enemy_bomb.global_position = child.global_position
		get_tree().current_scene.add_child(enemy_bomb)

func _on_shot_timer_timeout():
	shoot()
