extends Node2D

var popup_menu = preload("res://Scenes/PopupMenu.tscn")
var popup_instance = null
var button = preload("res://Scenes/button.tscn")
var button_instance = null
@onready var marker = $Marker2D
@onready var button_array = [$Button3, $Button4]




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
	timer.wait_time = 5
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


	
	
