extends Control

var Master = AudioServer.get_bus_index("Master")

@onready var score: RichTextLabel = $Score
@onready var button_continue: Node2D = $Background/Button_continue

func _ready():
	update_volume_button()
	button_continue.empty_anim()
# Change score label
func updateHighScore():
	score.text = "HIGH SCORE: " + str(global.HighScore_numberoffbuttonsvisible) + " KEYS / " + str(global.HighScore_correcthits) + " HITS"

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode >= KEY_0 and event.keycode <= KEY_9:
			print("Number key pressed:", event.keycode - KEY_0)
			
			global.volume = event.keycode - KEY_0
			update_volume_button()
			AudioServer.set_bus_volume_db(Master, linear_to_db(global.volume*0.1))
			
		if event.keycode == KEY_ESCAPE or event.keycode == KEY_SPACE:
			unpause()

func update_volume_button():
	for i in range(10):
		var button = $Background.get_node("Button%d" % i)
		button.shrink_menu_anim()
	var currentVolume = $Background.get_node("Button%d" % global.volume)
	print(currentVolume)
	currentVolume.grow_menu_anim()

func _on_continue_pressed():
	unpause()

func unpause():
	get_tree().paused = false
	queue_free()
