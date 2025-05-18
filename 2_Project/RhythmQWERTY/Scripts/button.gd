extends Node2D

signal reached_max_extent
var isMovingForward = true

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

func shrink_anim():
	var anim_player = $AnimationPlayer
	isMovingForward = false
	$AnimationPlayer.speed_scale = -4
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

func _on_animation_finished(Grow):
	if isMovingForward and Grow == "Grow":
		emit_signal("reached_max_extent")
		
