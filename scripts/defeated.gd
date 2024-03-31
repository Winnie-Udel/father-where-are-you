extends Node

@onready var click = $Click
@onready var music = $Music

func _ready():
	music.play()
	
func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_try_again_button_down():
	click.play()

func _on_home_button_down():
	click.play()
