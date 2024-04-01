extends Node

@onready var click = $Click
@onready var music = $Music
@onready var scene_music = $SceneMusic
@onready var cutscene = $Cutscene
@onready var ui = $MainUI

func _ready():
	cutscene.hide()
	music.play()
	
func _on_play_pressed():
	music.stop()
	scene_music.play()
	cutscene.show()
	ui.hide()

func _on_play_button_down():
	click.play()

func _on_cutscene_finished():
	get_tree().change_scene_to_file("res://scenes/instruction.tscn")

