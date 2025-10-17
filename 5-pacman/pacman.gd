extends CharacterBody2D
var BASE_SPEED: int = 150
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	var horizontal_movement = Input.get_axis("ui_left", "ui_right")
	var vertical_movement = Input.get_axis("ui_up", "ui_down")
	
	var new_direction = Vector2.ZERO
	if horizontal_movement != 0:
		new_direction.x = horizontal_movement
		velocity = direction * BASE_SPEED
	elif vertical_movement != 0:
		new_direction.y = vertical_movement
		velocity = direction * BASE_SPEED

	else:
		new_direction = direction
		
	direction = new_direction
	velocity = direction * BASE_SPEED

	#print(velocity)
	move_and_slide()
	#move_and_collide(velocity)
