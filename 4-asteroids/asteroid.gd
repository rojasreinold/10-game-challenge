extends RigidBody2D


var SPEED = 100
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50
func set_direction(new_direction):
	
	linear_velocity.x = SPEED* cos(new_direction)
	linear_velocity.y = SPEED * sin(new_direction)


func _physics_process(delta: float) -> void:
	if not $JumpTimer.is_stopped():
		return
	var window_size = DisplayServer.window_get_size()
	if global_position.x < 0:
		$JumpTimer.start()
		global_position.x = window_size.x -32
	elif global_position.x > window_size.x:
		$JumpTimer.start()
		global_position.x = 32
	
	if global_position.y < 0:
		$JumpTimer.start()
		global_position.y = window_size.y -32
	elif global_position.y > window_size.y :
		$JumpTimer.start()

		global_position.y = 32
func _on_body_entered(body: Node) -> void:
	print(body.name)

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	print(body.name)
