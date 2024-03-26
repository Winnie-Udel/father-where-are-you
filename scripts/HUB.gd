extends Control

@onready var score_display = $Score

func update_score(score):
	score_display.text = "Score: " + str(score)
