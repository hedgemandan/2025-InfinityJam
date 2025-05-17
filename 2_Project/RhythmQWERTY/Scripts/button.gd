extends Node2D


func _ready():
	pass
	#modulate.a = 0

		
func grow_anim():
	var anim_player = $AnimationPlayer
	if self.visible:
		anim_player.play("Grow")
		#var tween = create_tween()
		#tween.tween_property(self, "modulate:a", 1.0, 1.5)
		#flag = 0



#
#when q is pressed
#button 46 activated
#
#
#button X activated?
#clear X status and get it ready to charge
