extends RigidBody2D


var SPEED = 200
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50
func set_direction(new_direction):
	linear_velocity.x = SPEED* cos(new_direction)
	linear_velocity.y = SPEED * sin(new_direction)


func _physics_process(delta: float) -> void:
	if not $jumpTimer.is_stopped():
		return
	var window_size = DisplayServer.window_get_size()
	#print(window_size, global_position)
	if global_position.x < 0:
		$jumpTimer.start()
		global_position.x = window_size.x -32
	elif global_position.x > window_size.x:
		$jumpTimer.start()
		global_position.x = 32
	
	if global_position.y < 0:
		$jumpTimer.start()
		global_position.y = window_size.y -32
	elif global_position.y > window_size.y :
		$jumpTimer.start()
		print("y change")
		global_position.y = 32

#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
