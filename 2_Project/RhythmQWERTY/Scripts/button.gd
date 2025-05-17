extends Node2D


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
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Grow")
		
		#var tween = create_tween()
		#tween.tween_property(self, "modulate:a", 1.0, 1.5)
		#flag = 0
func shrink_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = -4

func empty_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Empty")

func grow_menu_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("Grow_Menu")

#
#when q is pressed
#button 46 activated
#
#
#button X activated?
#clear X status and get it ready to charge
