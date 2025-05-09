extends RigidBody2D


var SPEED = 200
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50
func set_direction(new_direction):
	linear_velocity.x = SPEED* cos(new_direction)
	linear_velocity.y = SPEED * sin(new_direction)


func _physics_process(delta: float) -> void:
	var window_size = DisplayServer.window_get_size()
	print(window_size, global_position)
	if global_position.x < 0:
		global_position.x = window_size.x
	elif global_position.y > window_size.x:
		global_position.x = 0
	
	if global_position.y < 0:
		global_position.y = window_size.y
	elif global_position.y > window_size.y:
		print("y change")
		global_position.y = 0

#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
