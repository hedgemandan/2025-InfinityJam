extends Node2D

signal reached_max_extent
var isMovingForward = true
@onready var sfx_charge: AudioStreamPlayer2D = $SFXCharge
@onready var sfx_charge_2: AudioStreamPlayer2D = $SFXCharge2
@onready var sfx_charge_3: AudioStreamPlayer2D = $SFXCharge3


func _ready():
	pass
	#modulate.a = 0

func appear_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Appear")

func grow_anim():
	var anim_player = $AnimationPlayer
	isMovingForward = true
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Grow")
	print(sfx_charge)
	print(sfx_charge_2)
	print(sfx_charge_3)
	ChargeSFX()

func shrink_anim():
	var anim_player = $AnimationPlayer
	isMovingForward = false
	$AnimationPlayer.speed_scale = -4
	ChargeSFXStop()
	#anim_player.play("Grow")

func empty_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Empty")

func reset_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("RESET")

func grow_menu_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Grow_Menu")
		
func shrink_menu_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = -1
	if self.visible:
		anim_player.play("Grow_Menu")

func _on_animation_finished(Grow):
	if isMovingForward and Grow == "Grow":
		emit_signal("reached_max_extent")


#SFX
func ChargeSFX():
	var randomNumber = randi_range(1, 3)
	if randomNumber == 1:
		sfx_charge.play(0)
	elif randomNumber == 2:
		sfx_charge_2.play(0)
	else:
		sfx_charge_3.play(0)
		
func ChargeSFXStop():
	sfx_charge.stop()
	sfx_charge_2.stop()
	sfx_charge_3.stop()
