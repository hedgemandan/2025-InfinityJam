extends Control

@onready var SFXIncorrectPress = $SFXIncorrectPress
@onready var restart: AudioStreamPlayer2D = $Restart
@onready var score: RichTextLabel = $TextureRect/Score
#@onready var playerName = ""
@onready var score_keys = 0
@onready var score_hits = 0
@onready var http = $HTTPRequest
@onready var timeout_timer = $Timer
const MaxNameLength = 16

signal restart_game

func _ready():
	http.request_completed.connect(_on_http_request_request_completed)
	timeout_timer.timeout.connect(_on_request_timeout)
	
func end_game_screen():
	SFXIncorrectPress.play()
	score.text = "HIGH SCORE: " + str(global.HighScore_numberoffbuttonsvisible) + " KEYS / " + str(global.HighScore_correcthits) + " HITS"
	score_keys = global.HighScore_numberoffbuttonsvisible
	score_hits = global.HighScore_correcthits
	$TextureRect/PlayerName.text = global.playerName


func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_ENTER:
			if global.playerName.strip_edges() != "DEFAULT" or global.playerName.strip_edges() != "":
				save_high_score(global.playerName) #NOT CURRENTLY USED
				if global.cansendhighscore:
					var high_score = {"playerName": global.playerName, "scoreKeys": score_keys, "scoreHits": score_hits}
					var json_string = JSON.stringify(high_score)
					print("High score variable is:", high_score)
					var headers = ["Content-Type: application/json"]
					http.request("https://www.clinkgame.com/api/newEntry", headers, HTTPClient.METHOD_POST, json_string)
					timeout_timer.start()
				else:
					trigger_game_restart()
			else:
				SFXIncorrectPress.play()
		else:
# Capture alphanumeric keys for name entryis_valid_filename
			if event.unicode != 0 and event.unicode != null:
				
				var char_input = char(event.unicode)
				if char_input.is_valid_filename():
					
					if global.playerName.length() < MaxNameLength: # Cap name length
						global.playerName += char(event.unicode)  # Append typed character
						$TextureRect/PlayerName.text = global.playerName
					elif global.playerName.length() == MaxNameLength:
						SFXIncorrectPress.play()
			elif event.keycode == KEY_BACKSPACE and global.playerName.length() > 0:
				global.playerName = global.playerName.substr(0, global.playerName.length() - 1)  # Remove last character
				$TextureRect/PlayerName.text = global.playerName
			print("Player name is:", global.playerName)
	global.gameendscreen = false

func save_high_score(name): #NOT CURRENTLY USED
	pass

func _on_http_request_request_completed(result, response_code, headers, body):
	timeout_timer.stop()
	print("Response received:", response_code, body.get_string_from_utf8())
	trigger_game_restart()

func _on_request_timeout():
	print("Request timed out! Proceeding without response from high score server.")
	trigger_game_restart()

func trigger_game_restart():
	get_tree().paused = false
	restart.play()
	global.gamestate == 1
	global.cansendhighscore = false
	restart_game.emit()
	queue_free()
