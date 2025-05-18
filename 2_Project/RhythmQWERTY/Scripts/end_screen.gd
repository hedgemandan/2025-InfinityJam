extends Control

signal restart_game

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_ESCAPE or event.keycode == KEY_SPACE:
			get_tree().paused = false
			global.gamestate == 1
			restart_game.emit()
			queue_free()
