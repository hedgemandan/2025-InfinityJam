extends Node2D

func _ready():
	modulate.a = 0
	fade_in()
	var buttons_data = {
		"button":		{"Letter":"H","Row":3,"Column":7},#
		"button2":		{"Letter":"J","Row":3,"Column":8},#
		"button3":		{"Letter":"G","Row":3,"Column":6},#
		"button4":		{"Letter":"K","Row":3,"Column":9},#
		"button5":		{"Letter":"M","Row":4,"Column":8},#
		"button6":		{"Letter":"U","Row":2,"Column":8},#
		"button7":		{"Letter":"N","Row":4,"Column":7},#
		"button8":		{"Letter":"Y","Row":2,"Column":7},#
		"button9":		{"Letter":"I","Row":2,"Column":9},#
		"button10":		{"Letter":"B","Row":4,"Column":7},#
		"button11":		{"Letter":",","Row":4,"Column":9},#
		"button12":		{"Letter":"T","Row":2,"Column":7},
		"button13":		{"Letter":"H","Row":3,"Column":7},
		"button14":		{"Letter":"H","Row":3,"Column":7},
		"button15":		{"Letter":"H","Row":3,"Column":7},
		"button16":		{"Letter":"H","Row":3,"Column":7},
		"button17":		{"Letter":"H","Row":3,"Column":7},
		"button18":		{"Letter":"H","Row":3,"Column":7},
		"button19":		{"Letter":"H","Row":3,"Column":7},
		"button20":		{"Letter":"H","Row":3,"Column":7},
		"button21":		{"Letter":"H","Row":3,"Column":7},
		"button22":		{"Letter":"H","Row":3,"Column":7},
		"button23":		{"Letter":"H","Row":3,"Column":7},
		"button24":		{"Letter":"H","Row":3,"Column":7},
		"button25":		{"Letter":"H","Row":3,"Column":7},
		"button26":		{"Letter":"H","Row":3,"Column":7},
		"button27":		{"Letter":"H","Row":3,"Column":7},
		"button28":		{"Letter":"J","Row":3,"Column":8},
		"button29":		{"Letter":"G","Row":3,"Column":6},
		"button30":		{"Letter":"H","Row":3,"Column":7},
		"button31":		{"Letter":"J","Row":3,"Column":8},
		"button32":		{"Letter":"G","Row":3,"Column":6},
		"button33":		{"Letter":"H","Row":3,"Column":7},
		"button34":		{"Letter":"J","Row":3,"Column":8},
		"button35":		{"Letter":"G","Row":3,"Column":6},
		"button36":		{"Letter":"H","Row":3,"Column":7},
		"button37":		{"Letter":"J","Row":3,"Column":8},
		"button38":		{"Letter":"G","Row":3,"Column":6},
		"button39":		{"Letter":"H","Row":3,"Column":7},
		"button40":		{"Letter":"J","Row":3,"Column":8},
		"button41":		{"Letter":"G","Row":3,"Column":6},
		"button42":		{"Letter":"H","Row":3,"Column":7},
		"button43":		{"Letter":"J","Row":3,"Column":8},
		"button44":		{"Letter":"G","Row":3,"Column":6},
		"button45":		{"Letter":"H","Row":3,"Column":7},
		"button46":		{"Letter":"J","Row":3,"Column":8},
		"button47":		{"Letter":"G","Row":3,"Column":6},
		"button48":		{"Letter":"H","Row":3,"Column":7},
		"button49":		{"Letter":"J","Row":3,"Column":8}}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	print(buttons_data["button2"]["Row"])
		
func fade_in():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 2.5)

#
#when q is pressed
#button 46 activated
#
#
#button X activated?
#clear X status and get it ready to charge
