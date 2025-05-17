extends Node2D

var popup_menu = preload("res://Scenes/PopupMenu.tscn")
var popup_instance = null
var button = preload("res://Scenes/button.tscn")
#var unpacked_instance = button.instantiate()
var button_instance = null
@onready var marker = $Marker2D
@onready var button_array = [$Button, $Button2, $Button3, $Button4, $Button5, $Button6, $Button7, $Button8, $Button9, $Button10, $Button11, $Button12, $Button13, $Button14, $Button15, $Button16, $Button17, $Button18, $Button19, $Button20, $Button21, $Button22, $Button23, $Button24, $Button25, $Button26, $Button27, $Button28, $Button29, $Button30, $Button31, $Button32, $Button33, $Button34, $Button35, $Button36, $Button37, $Button38, $Button39, $Button40, $Button41, $Button42, $Button43, $Button44, $Button45, $Button46, $Button47, $Button48, $Button49]
var bufferOGcolour
@onready var SFXCorrectPress = $SFXCorrectPress
@onready var SFXIncorrectPress = $SFXIncorrectPress

@onready var correct_clicks = $"Correct Clicks"
@onready var incorrect_clicks = $"Incorrect Clicks"
@onready var keys_unlocked = $"Keys Unlocked"

var buttons_data = {
	"Button":		{"Letter":"H","Row":3,"Column":7},#
	"Button2":		{"Letter":"J","Row":3,"Column":8},#
	"Button3":		{"Letter":"G","Row":3,"Column":6},#
	"Button4":		{"Letter":"K","Row":3,"Column":9},#
	"Button5":		{"Letter":"M","Row":4,"Column":8},#
	"Button6":		{"Letter":"U","Row":2,"Column":8},#
	"Button7":		{"Letter":"N","Row":4,"Column":7},#
	"Button8":		{"Letter":"Y","Row":2,"Column":7},#
	"Button9":		{"Letter":"I","Row":2,"Column":9},#
	"Button10":		{"Letter":"B","Row":4,"Column":6},#
	"Button11":		{"Letter":"Comma","Row":4,"Column":9},#
	"Button12":		{"Letter":"T","Row":2,"Column":6},#
	"Button13":		{"Letter":"F","Row":3,"Column":5},#
	"Button14":		{"Letter":"L","Row":3,"Column":10},#
	"Button15":		{"Letter":"O","Row":2,"Column":10},#
	"Button16":		{"Letter":"V","Row":4,"Column":5},#
	"Button17":		{"Letter":"Period","Row":4,"Column":10},#
	"Button18":		{"Letter":"R","Row":2,"Column":5},#
	"Button19":		{"Letter":"D","Row":3,"Column":4},#
	"Button20":		{"Letter":"C","Row":4,"Column":4},#
	"Button21":		{"Letter":"P","Row":2,"Column":11},#
	"Button22":		{"Letter":"Semicolon","Row":3,"Column":11},#
	"Button23":		{"Letter":"7","Row":1,"Column":8},#
	"Button24":		{"Letter":"6","Row":1,"Column":7},#
	"Button25":		{"Letter":"8","Row":1,"Column":9},#
	"Button26":		{"Letter":"9","Row":1,"Column":10},#
	"Button27":		{"Letter":"Slash","Row":4,"Column":4},#
	"Button28":		{"Letter":"Space","Row":5,"Column":6},#
	"Button29":		{"Letter":"5","Row":1,"Column":6},#
	"Button30":		{"Letter":"BracketLeft","Row":2,"Column":12},#
	"Button31":		{"Letter":"Apostrophe","Row":3,"Column":12},#
	"Button32":		{"Letter":"E","Row":2,"Column":4},#
	"Button33":		{"Letter":"S","Row":3,"Column":3},#
	"Button34":		{"Letter":"0","Row":1,"Column":11},#
	"Button35":		{"Letter":"X","Row":4,"Column":3},
	"Button36":		{"Letter":"4","Row":1,"Column":5},
	"Button37":		{"Letter":"3","Row":1,"Column":4},
	"Button38":		{"Letter":"W","Row":2,"Column":3},
	"Button39":		{"Letter":"A","Row":3,"Column":2},
	"Button40":		{"Letter":"Z","Row":4,"Column":2},
	"Button41":		{"Letter":"Minus","Row":1,"Column":12},
	"Button42":		{"Letter":"Equal","Row":1,"Column":13},
	"Button43":		{"Letter":"BracketLeft","Row":2,"Column":13},
	"Button44":		{"Letter":"NumberSign","Row":3,"Column":13},
	"Button45":		{"Letter":"2","Row":1,"Column":3},
	"Button46":		{"Letter":"Q","Row":2,"Column":2},
	"Button47":		{"Letter":"Backslash","Row":4,"Column":1},
	"Button48":		{"Letter":"1","Row":1,"Column":2},
	"Button49":		{"Letter":"Enter","Row":2,"Column":14}}

func _ready():
	start_timer()
	start_timer2()


## Popup Menu Function
func _input(event):
	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_ESCAPE:
		toggle_popup()
		
		


## Key press detection event
	if event is InputEventKey and event.is_pressed():
		var key_pressed = OS.get_keycode_string(event.keycode)
		check_buttons(key_pressed)
		print("This is the button you pressed:", key_pressed)

func check_buttons(key_pressed):
	for button_name in buttons_data.keys():
		if buttons_data[button_name]["Letter"] == key_pressed:
			var button_node = get_node(button_name)
			if button_node.visible:
				button_node.scale = Vector2(1, 1)
				button_node.modulate = bufferOGcolour
				if button_node in global.clickablebuttons:
					SFXCorrectPress.play()
					global.clickablebuttons.erase(button_node)
					global.correcthits += 1
					correct_clicks.text = str(global.correcthits)
				else:
					SFXIncorrectPress.play()
					global.incorrecthits += 1
					incorrect_clicks.text = str(global.incorrecthits)
			else:
				pass



## Popup Menu function Pt. 2
func toggle_popup():
	if popup_instance:
		popup_instance.queue_free()
		popup_instance = null
	else:
		popup_instance = popup_menu.instantiate()
		add_child(popup_instance)
		popup_instance.global_position = get_viewport_rect().size / 2 - popup_instance.size / 2
		


## timer for adding new buttons every 5 seconds and incrementing the gamestate by 1
func start_timer():
	var timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeout():
	if global.gamestep >= 47:
		pass
	else: 
		button_array[global.gamestep + 2].show()
		global.numberoffbuttonsvisible += 1
		keys_unlocked.text = str(global.numberoffbuttonsvisible)
		global.gamestep += 1




## timer for making a random button go green from the selection of buttons which are visible
func start_timer2():
	var timer = Timer.new()
	timer.wait_time = 2
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout2"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeout2():
	if global.numberoffbuttonsvisible <= 49:
		
		#if/conditions like gamestate are met then highlight more than 1 random button. Then three adjacent horizontal. Then 2 adjacent vertical. 
		var random_node = button_array[randi_range(0, global.numberoffbuttonsvisible -1)]
		#line here to reference one adjacent horizontal to random_node if available
		print("number of buttons visible:", global.numberoffbuttonsvisible)
		random_node.scale = Vector2(1, 1)
		global.clickablebuttons.append(random_node)
		
		bufferOGcolour = random_node.modulate
		random_node.modulate = Color(1,1,0,1) #TWEEN TIMER IN HERE for fade in? Or leave for animation
	else:
		pass
	
