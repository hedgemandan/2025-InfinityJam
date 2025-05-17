extends Node2D

var popup_menu = preload("res://Scenes/PopupMenu.tscn")
var popup_instance = null
var button = preload("res://Scenes/button.tscn")
#var unpacked_instance = button.instantiate()
var button_instance = null
@onready var button_array = [$AllButtons/Button, $AllButtons/Button2, $AllButtons/Button3, $AllButtons/Button4, $AllButtons/Button5, $AllButtons/Button6, $AllButtons/Button7, $AllButtons/Button8, $AllButtons/Button9, $AllButtons/Button10, $AllButtons/Button11, $AllButtons/Button12, $AllButtons/Button13, $AllButtons/Button14, $AllButtons/Button15, $AllButtons/Button16, $AllButtons/Button17, $AllButtons/Button18, $AllButtons/Button19, $AllButtons/Button20, $AllButtons/Button21, $AllButtons/Button22, $AllButtons/Button23, $AllButtons/Button24, $AllButtons/Button25, $AllButtons/Button26, $AllButtons/Button27, $AllButtons/Button28, $AllButtons/Button29, $AllButtons/Button30, $AllButtons/Button31, $AllButtons/Button32, $AllButtons/Button33, $AllButtons/Button34, $AllButtons/Button35, $AllButtons/Button36, $AllButtons/Button37, $AllButtons/Button38, $AllButtons/Button39, $AllButtons/Button40, $AllButtons/Button41, $AllButtons/Button42, $AllButtons/Button43, $AllButtons/Button44, $AllButtons/Button45, $AllButtons/Button46, $AllButtons/Button47, $AllButtons/Button48, $AllButtons/Button49]
var bufferOGcolour
@onready var SFXCorrectPress = $SFXCorrectPress
@onready var SFXIncorrectPress = $SFXIncorrectPress
@onready var Music = $Music


@onready var correct_clicks = $"Correct Clicks"
@onready var incorrect_clicks = $"Incorrect Clicks"
@onready var keys_unlocked = $"Keys Unlocked"

@onready var buttons_data = {
	"Button1":		{"Node":$AllButtons/Button,"Letter":"H","Row":3,"Column":7,"Color":Color(0, 1, 1,1)},#
	"Button2":		{"Node":$AllButtons/Button2,"Letter":"J","Row":3,"Column":8,"Color":Color(0, 1, 1,1)},#
	"Button3":		{"Node":$AllButtons/Button3,"Letter":"G","Row":3,"Column":6,"Color":Color(0.251, 0.773, 1,1)},#
	"Button4":		{"Node":$AllButtons/Button4,"Letter":"K","Row":3,"Column":9,"Color":Color(0.251, 0.824, 1,1)},#
	"Button5":		{"Node":$AllButtons/Button5,"Letter":"M","Row":4,"Column":8,"Color":Color(0.4, 0.714, 1,1)},#
	"Button6":		{"Node":$AllButtons/Button6,"Letter":"U","Row":2,"Column":8,"Color":Color(0.4, 0.616, 1,1)},#
	"Button7":		{"Node":$AllButtons/Button7,"Letter":"N","Row":4,"Column":7,"Color":Color(0.4, 0.616, 1,1)},#
	"Button8":		{"Node":$AllButtons/Button8,"Letter":"Y","Row":2,"Column":7,"Color":Color(0.451, 0.596, 1,1)},#
	"Button9":		{"Node":$AllButtons/Button9,"Letter":"I","Row":2,"Column":9,"Color":Color(0.502, 0.549, 1,1)},#
	"Button10":		{"Node":$AllButtons/Button10,"Letter":"B","Row":4,"Column":6,"Color":Color(0.686, 0.314, 1,1)},#
	"Button11":		{"Node":$AllButtons/Button11,"Letter":"Comma","Row":4,"Column":9,"Color":Color(0.616, 0.251, 1,1)},#
	"Button12":		{"Node":$AllButtons/Button12,"Letter":"T","Row":2,"Column":6,"Color":Color(0.725, 0.2, 1,1)},#
	"Button13":		{"Node":$AllButtons/Button13,"Letter":"F","Row":3,"Column":5,"Color":Color(0.741, 0.251, 1,1)},#
	"Button14":		{"Node":$AllButtons/Button14,"Letter":"L","Row":3,"Column":10,"Color":Color(0.557, 0.353, 1,1)},#
	"Button15":		{"Node":$AllButtons/Button15,"Letter":"O","Row":2,"Column":10,"Color":Color(0.694, 0.302, 1,1)},#
	"Button16":		{"Node":$AllButtons/Button16,"Letter":"V","Row":4,"Column":5,"Color":Color(0.973, 0.027, 1,1)},#
	"Button17":		{"Node":$AllButtons/Button17,"Letter":"Period","Row":4,"Column":10,"Color":Color(1, 0, 1,1)},#
	"Button18":		{"Node":$AllButtons/Button18,"Letter":"R","Row":2,"Column":5,"Color":Color(1, 0.102, 0.937,1)},#
	"Button19":		{"Node":$AllButtons/Button19,"Letter":"D","Row":3,"Column":4,"Color":Color(1, 0.102, 0.937,1)},#
	"Button20":		{"Node":$AllButtons/Button20,"Letter":"C","Row":4,"Column":4,"Color":Color(1, 0.173, 0.745,1)},#
	"Button21":		{"Node":$AllButtons/Button21,"Letter":"P","Row":2,"Column":11,"Color":Color(1, 0.051, 1,1)},#
	"Button22":		{"Node":$AllButtons/Button22,"Letter":"Semicolon","Row":3,"Column":11,"Color":Color(1, 0, 1,1)},#
	"Button23":		{"Node":$AllButtons/Button23,"Letter":"7","Row":1,"Column":8,"Color":Color(1, 0.153, 0.8,1)},#
	"Button24":		{"Node":$AllButtons/Button24,"Letter":"6","Row":1,"Column":7,"Color":Color(1, 0.2, 0.757,1)},#
	"Button25":		{"Node":$AllButtons/Button25,"Letter":"8","Row":1,"Column":9,"Color":Color(1, 0.153, 0.8,1)},#
	"Button26":		{"Node":$AllButtons/Button26,"Letter":"9","Row":1,"Column":10,"Color":Color(1, 0.251, 0.698,1)},#
	"Button27":		{"Node":$AllButtons/Button27,"Letter":"Slash","Row":4,"Column":11,"Color":Color(1, 0.2, 0.757,1)},#
	"Button28":		{"Node":$AllButtons/Button28,"Letter":"Space","Row":5,"Column":6,"Color":Color(1, 0.282, 0.58,1)},#
	"Button29":		{"Node":$AllButtons/Button29,"Letter":"5","Row":1,"Column":6,"Color":Color(1, 0.302, 0.553,1)},#
	"Button30":		{"Node":$AllButtons/Button30,"Letter":"BracketLeft","Row":2,"Column":12,"Color":Color(1, 0.302, 0.671,1)},#
	"Button31":		{"Node":$AllButtons/Button31,"Letter":"Apostrophe","Row":3,"Column":12,"Color":Color(1, 0.251, 0.643,1)},#
	"Button32":		{"Node":$AllButtons/Button32,"Letter":"E","Row":2,"Column":4,"Color":Color(1, 0.302, 0.604,1)},#
	"Button33":		{"Node":$AllButtons/Button33,"Letter":"S","Row":3,"Column":3,"Color":Color(1, 0.302, 0.486,1)},#
	"Button34":		{"Node":$AllButtons/Button34,"Letter":"0","Row":1,"Column":11,"Color":Color(1, 0.4, 0.514,1)},#
	"Button35":		{"Node":$AllButtons/Button35,"Letter":"X","Row":4,"Column":3,"Color":Color(1, 0.38, 0.435,1)},#
	"Button36":		{"Node":$AllButtons/Button36,"Letter":"4","Row":1,"Column":5,"Color":Color(1, 0.416, 0.302,1)},#
	"Button37":		{"Node":$AllButtons/Button37,"Letter":"3","Row":1,"Column":4,"Color":Color(1, 0.592, 0.051,1)},#
	"Button38":		{"Node":$AllButtons/Button38,"Letter":"W","Row":2,"Column":3,"Color":Color(1, 0.502, 0.251,1)},#
	"Button39":		{"Node":$AllButtons/Button39,"Letter":"A","Row":3,"Column":2,"Color":Color(1, 0.576, 0.153,1)},#
	"Button40":		{"Node":$AllButtons/Button40,"Letter":"Z","Row":4,"Column":2,"Color":Color(1, 0.596, 0.106,1)},#
	"Button41":		{"Node":$AllButtons/Button41,"Letter":"Minus","Row":1,"Column":12,"Color":Color(1, 0.502, 0.251,1)},#
	"Button42":		{"Node":$AllButtons/Button42,"Letter":"Equal","Row":1,"Column":13,"Color":Color(1, 0.667, 0,1)},#
	"Button43":		{"Node":$AllButtons/Button43,"Letter":"BracketRight","Row":2,"Column":13,"Color":Color(1, 0.467, 0.302,1)},#
	"Button44":		{"Node":$AllButtons/Button44,"Letter":"NumberSign","Row":3,"Column":13,"Color":Color(1, 0.502, 0.251,1)},#
	"Button45":		{"Node":$AllButtons/Button45,"Letter":"2","Row":1,"Column":3,"Color":Color(1, 0.831, 0,1)},#
	"Button46":		{"Node":$AllButtons/Button46,"Letter":"Q","Row":2,"Column":2,"Color":Color(1, 0.769, 0.043,1)},#
	"Button47":		{"Node":$AllButtons/Button47,"Letter":"BackSlash","Row":4,"Column":1,"Color":Color(1, 0.871, 0.024,1)},#
	"Button48":		{"Node":$AllButtons/Button48,"Letter":"1","Row":1,"Column":2,"Color":Color(1, 1, 0,1)},#
	"Button49":		{"Node":$AllButtons/Button49,"Letter":"Enter","Row":2,"Column":14,"Color":Color(1, 0.831, 0,1)}}#


func _ready():
	start_newbuttonspawn_timer()
	start_buttoncharge_timer()
	Music.play()
	#for n in buttons_data.size():
		#$AllButtons/Button.modulate = 
		#print("I have interated this many times:", n)
		#pass
	for button_name in buttons_data.keys():
		var button_node = buttons_data[button_name]["Node"]
		if button_node:
			button_node.modulate = buttons_data[button_name]["Color"]
			print("Applied color to:", button_name)




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
			var button_node = buttons_data[button_name]["Node"]
			if button_node.visible:
				button_node.scale = Vector2(1, 1)
				#if bufferOGcolour:
					#button_node.modulate = bufferOGcolour
				if button_node in global.clickablebuttons:
					SFXCorrectPress.play()
					global.clickablebuttons.erase(button_node)
					global.correcthits += 1
					correct_clicks.text = str(global.correcthits)
					button_node.empty_anim()
				else:
					SFXIncorrectPress.play()
					start_death_timer()
					global.incorrecthits += 1
					incorrect_clicks.text = str(global.incorrecthits)
			else:
				pass

func start_death_timer():
	var timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_timer_timeoutdeath"))
	add_child(timer)
	timer.start()

func _on_timer_timeoutdeath():
	queue_free()
	



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
func start_newbuttonspawn_timer():
	var timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeoutNB"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeoutNB():
	if global.gamestep >= 47:
		pass
	else: 
		#var adjustedgamestep = (global.gamestep + 2)
		var gamestepstring = "Button" + str(global.gamestep + 2) #concatenate
		buttons_data[gamestepstring]["Node"].show()
		#button_array[global.gamestep + 2].show()
		global.numberoffbuttonsvisible += 1
		keys_unlocked.text = str(global.numberoffbuttonsvisible - 1)
		global.gamestep += 1




## timer for making a random button go green from the selection of buttons which are visible
func start_buttoncharge_timer():
	var timer = Timer.new()
	if global.gamestep <= 2:
		timer.wait_time = 2
	elif global.gamestep <= 5:
		timer.wait_time = 2
	elif global.gamestep <= 10:
		timer.wait_time = 2 - (global.gamestep)*0.1
	else:
		timer.wait_time = 1 - (global.gamestep)*0.2
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeoutBC"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeoutBC():
		
		#if/conditions like gamestate are met then highlight more than 1 random button. Then three adjacent horizontal. Then 2 adjacent vertical. 
	## This immediate paragraph below allows for two buttons charging at the same time beyond gamestep 12
	if global.gamestep >= 9: #enable doubles
		var spawnlimit = 2
		for n in spawnlimit:
			var holdingvar1 = "Button" + str(randi_range(1, global.numberoffbuttonsvisible -1)) #concatenate
			var random_button = buttons_data[holdingvar1]["Node"]
			if random_button in global.clickablebuttons:
				pass	#Do not double up charging the same button!
			else:
				global.clickablebuttons.append(random_button)
				random_button.grow_anim()
	## Paired buttons?
	#elif global.gamestep >= 6: #enable doubles
		#var spawnlimitadj = 2
		#for n in spawnlimitadj:
			#var holdingvar2 = "Button" + str(randi_range(1, global.numberoffbuttonsvisible -1)) #concatenate
			#var random_button = buttons_data[holdingvar2]["Node"]
			#if random_button in global.clickablebuttons:
				#_on_timer_timeoutBC()	#Do not double up charging the same button!
			#else:
				#global.clickablebuttons.append(random_button)
				#random_button.grow_anim()
	## This immediate paragraph allows only one button to charging at a time prior to gamestep 10
	else:
		var holdingvar1 = "Button" + str(randi_range(1, global.numberoffbuttonsvisible -1)) #concatenate
		print("number of buttons visible:", global.numberoffbuttonsvisible)
		var random_button = buttons_data[holdingvar1]["Node"]
		if random_button in global.clickablebuttons:
			pass
			#_on_timer_timeoutBC()	#Do not double up charging the same button!
		else:
			global.clickablebuttons.append(random_button)
			print("clickable buttons number currently:", global.clickablebuttons)
			random_button.grow_anim()



#tidy(random_button)
#func tidy(random_button):
	#return
