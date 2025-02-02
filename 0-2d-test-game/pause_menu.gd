extends Node
signal close_pause_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_quit_button_pressed() -> void:
	print("Quit button pressed")
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_save_button_pressed() -> void:
	print("Save button pressed")
	pass # Replace with function body.

func hide_all() -> void:
	$PauseVBoxContainer.hide()

func show_all() -> void:
	$PauseVBoxContainer.show()
	

func _on_resume_button_pressed() -> void:
	hide_all()
	close_pause_menu.emit() # Replace with function body.
