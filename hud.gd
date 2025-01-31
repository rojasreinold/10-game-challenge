extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	$PauseMenu.hide_all()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
	
func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	$TopScoreNum.show()
	$TopScoreText.show()
	

func update_score(score):
	$ScoreLabel.text = str(score)
	
func get_top_score():
	return $TopScoreNum.text
	
func update_top_score(score):
	$TopScoreNum.text = str(score)
	
func update_dodged(dodged):
	$DodgeLabel.text = str(dodged)


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	$TopScoreNum.hide()
	$TopScoreText.hide()
	start_game.emit()


func _on_message_timer_timeout() -> void:
	$Message.hide()


func _on_setting_button_pressed() -> void:
	$StartButton.hide()
	$TopScoreNum.hide()
	$TopScoreText.hide()
	$DodgeLabel.hide()
	$Message.hide()
	$PauseMenu.show_all()
	get_tree().paused = true


func _on_pause_menu_close_pause_menu() -> void:
	$PauseMenu.hide_all()
	$StartButton.show()
	$TopScoreNum.show()
	$TopScoreText.show()
	$DodgeLabel.show()
	$Message.show()
	get_tree().paused = false
