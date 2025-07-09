extends CharacterBody2D
var BASE_SPEED: int = 150
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	var horizontal_movement = Input.get_axis("ui_left", "ui_right")
	var vertical_movement = Input.get_axis("ui_up", "ui_down")
	
	if horizontal_movement != 0:
		direction.x = horizontal_movement
		velocity = direction * BASE_SPEED
	elif vertical_movement != 0:
		direction.y = vertical_movement
		velocity = direction * BASE_SPEED

	else:
		velocity = direction * BASE_SPEED

	#print(velocity)
	move_and_slide()
