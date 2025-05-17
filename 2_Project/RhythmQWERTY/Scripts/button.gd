extends Node2D

var flag = 1

func _ready():
	modulate.a = 0


func _physics_process(delta): #FIND A BETTER WAY TO DO THIS - POINT FOR OPTIMISATION!!
	if flag:
		fade_in()
		
func fade_in():
	if self.visible:
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 1.0, 1.5)
		flag = 0



#
#when q is pressed
#button 46 activated
#
#
#button X activated?
#clear X status and get it ready to charge
