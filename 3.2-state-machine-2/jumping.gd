extends State

@onready var actor: CharacterBody2D = get_node("../..")


func Enter() -> void:
	actor.velocity.y -= 500
	actor.move_and_slide()


func Physics_update(_delta):
	var input_direction: int = Input.get_axis("move_left", "move_right")
	actor.velocity.y += 1000 * _delta
	actor.velocity.x = input_direction * _delta * 20000

	actor.move_and_slide()
	
	if Input.is_action_just_pressed("jump"):
		transition_to.emit("DoubleJump")
	elif actor.is_on_floor() and input_direction == 0:
		transition_to.emit("Idle")

	elif actor.velocity.y > 0:
		transition_to.emit("Falling")
