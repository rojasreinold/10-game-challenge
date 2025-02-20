class_name DoubleJump
extends State

@onready var actor: CharacterBody2D = get_node("../..")

func Enter():
	actor.velocity.y = -500
	actor.move_and_slide()

func Physics_update(_delta):
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
