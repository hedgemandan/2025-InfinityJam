extends Node

@onready var SFXCorrectPress: AudioStreamPlayer2D = $SFXCorrectPress
@onready var SFXCorrectPress2: AudioStreamPlayer2D = $SFXCorrectPress2
@onready var SFXCorrectPress3: AudioStreamPlayer2D = $SFXCorrectPress3
@onready var SFXCorrectPress4: AudioStreamPlayer2D = $SFXCorrectPress4


func CorrectPress():
	var randomNumber = randi_range(1, 4)
	if randomNumber == 1:
		SFXCorrectPress.play()
	elif randomNumber == 2:
		SFXCorrectPress2.play()
	elif randomNumber == 3:
		SFXCorrectPress3.play()
	else:
		SFXCorrectPress4.play()
		
