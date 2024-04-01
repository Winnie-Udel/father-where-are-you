extends Node

@onready var click = $Click

func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_home_button_down():
	click.play()
