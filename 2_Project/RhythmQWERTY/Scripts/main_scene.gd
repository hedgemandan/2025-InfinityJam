extends Node2D

var popup_menu = preload("res://Scenes/PopupMenu.tscn")
var popup_instance = null
var button = preload("res://Scenes/button.tscn")
var button_instance = null
@onready var marker = $Marker2D
@onready var button_array = [$Button3, $Button4, $Button5, $Button6, $Button7, $Button8, $Button9, $Button10, $Button11, $Button12, $Button13, $Button14, $Button15, $Button16, $Button17, $Button18, $Button19, $Button20, $Button21, $Button22, $Button23, $Button24, $Button25, $Button26, $Button27, $Button28, $Button29, $Button30, $Button31, $Button32, $Button33, $Button34, $Button35, $Button36, $Button37, $Button38, $Button39, $Button40, $Button41, $Button42, $Button43, $Button44, $Button45, $Button46, $Button47, $Button48, $Button49]




func _ready():
	start_timer()


func _input(event):
	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_ESCAPE:
		toggle_popup()





## Popup Menu function
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
	timer.wait_time = 2
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeout():
	#button_instance = button.instantiate()
	#add_child(button_instance)
	#button_instance.global_position = marker.global_position
	button_array[global.gamestep].show()
	global.gamestep += 1


	
	
