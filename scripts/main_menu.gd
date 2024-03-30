extends Node

@onready var click_sound = $Click

func _on_play_pressed():
	click_sound.play()
	get_tree().change_scene_to_file("res://scenes/instruction.tscn")
