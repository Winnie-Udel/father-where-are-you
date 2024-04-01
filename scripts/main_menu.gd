extends Node

@onready var click = $Click
@onready var music = $Music

func _ready():
	music.play()
	
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/instruction.tscn")

func _on_play_button_down():
	click.play()
