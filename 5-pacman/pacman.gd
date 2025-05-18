extends CharacterBody2D
var BASE_SPEED: int = 3

func _process(delta: float) -> void:

	velocity = Vector2.ZERO
	var horizontal_movement = Input.get_axis("ui_left", "ui_right")
	var vertical_movement = Input.get_axis("ui_up", "ui_down")
	if horizontal_movement != 0:
		velocity.x += horizontal_movement
	elif vertical_movement != 0:
		velocity.y += vertical_movement

	velocity = velocity * BASE_SPEED
	
	move_and_collide(velocity)
