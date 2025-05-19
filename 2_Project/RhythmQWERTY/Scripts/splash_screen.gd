extends Node2D

func fade_anim():
	var anim_player = $AnimationPlayer
	$AnimationPlayer.speed_scale = 1
	if self.visible:
		anim_player.play("fade")
