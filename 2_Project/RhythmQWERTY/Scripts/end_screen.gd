extends Control

@onready var SFXIncorrectPress = $SFXIncorrectPress
@onready var restart: AudioStreamPlayer2D = $Restart
@onready var score: RichTextLabel = $TextureRect/Score
signal restart_game

func end_game_screen():
	SFXIncorrectPress.play()
	score.text = "HIGH SCORE: " + str(global.HighScore_numberoffbuttonsvisible) + " KEYS / " + str(global.HighScore_correcthits) + " HITS"

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_SPACE:
			get_tree().paused = false
			restart.play()
			global.gamestate == 1
			restart_game.emit()
			queue_free()
	global.gameendscreen = false
