extends Node

func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
