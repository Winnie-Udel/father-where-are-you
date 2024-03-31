extends Control

@onready var score_display = $Score
@onready var boss_timer_display = $BossSpawnTime

func update_score(score):
	score_display.text = "SCORE: " + str(score)

func update_timer_display(time):
	if time < 10:
		boss_timer_display.text = "0:0" + str(time)
	else:
		boss_timer_display.text = "0:" + str(time)
