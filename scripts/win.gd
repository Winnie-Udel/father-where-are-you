extends Node

@onready var click = $Click
@onready var cutscene = $CutScene
@onready var ui = $MainUI

func _ready():
	ui.hide()
	
func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_home_button_down():
	click.play()

func _on_cut_scene_finished():
	cutscene.hide()
	ui.show()
