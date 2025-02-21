class_name DoubleJump
extends State

@onready var actor: CharacterBody2D = get_node("../..")
var float_jump_stun: float = 0

func Enter():
	float_jump_stun = 0.2
	actor.velocity.y = 0
	actor.move_and_slide()

func Physics_update(_delta: float):
	if float_jump_stun > 0:
		float_jump_stun -= _delta
		if float_jump_stun <= 0:
			actor.velocity.y -= 500
			_delta = abs(float_jump_stun)
		else:
			return
	var input_direction: int = Input.get_axis("move_left", "move_right")
	actor.velocity.x = input_direction * _delta * 20000

	actor.velocity.y += 1000 * _delta
	actor.move_and_slide()
	if actor.is_on_floor() and input_direction == 0:
		transition_to.emit("Idle")
	elif actor.is_on_floor():
		transition_to.emit("Running")

func Update(_delta):
	pass
