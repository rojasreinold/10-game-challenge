class_name Idle
extends State

@onready var actor: CharacterBody2D = get_node("../..")

func Physics_update(_delta):
	var input_direction: int = Input.get_axis("move_left", "move_right")

	actor.velocity.y += 1000 * _delta
	actor.move_and_slide()
	if Input.is_action_just_pressed("jump"):
		if actor.is_on_floor():
			transition_to.emit("Jumping")
		else:
			transition_to.emit("DoubleJumpState")
	if input_direction != 0:
		transition_to.emit("Running")
			
func Update(_delta):
	pass
