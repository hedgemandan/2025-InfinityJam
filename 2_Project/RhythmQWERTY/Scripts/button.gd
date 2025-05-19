extends Node2D

signal reached_max_extent
var isMovingForward = true
@onready var sfx_charge: AudioStreamPlayer2D = $SFXCharge


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
	ChargeSFX()

func shrink_anim():
	var anim_player = $AnimationPlayer
	isMovingForward = false
	$AnimationPlayer.speed_scale = -4
	ChargeSFXStop()


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
	var soundDampeningMultiplier = 0.25
	sfx_charge.set_volume_db(0-(global.gamestep*soundDampeningMultiplier))
	sfx_charge.play(0)
		
func ChargeSFXStop():
	sfx_charge.stop()
