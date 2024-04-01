extends Node

@onready var click= $Click

func _on_ready_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_ready_button_down():
	click.play()
