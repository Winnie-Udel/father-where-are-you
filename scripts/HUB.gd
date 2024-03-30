extends Control

@onready var score_display = $Score
@onready var boss_timer_display = $BossSpawnTime

func update_score(score):
	score_display.text = "Score: " + str(score)

func update_timer_display(time):
	boss_timer_display.text = "Boss Spawn In: " + str(time)
