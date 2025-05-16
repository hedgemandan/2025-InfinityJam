extends Node2D

func _ready():
	modulate.a = 0
	fade_in()

func fade_in():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 2.5)
