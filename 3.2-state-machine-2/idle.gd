class_name Idle
extends State

@export var actor: CharacterBody2D

func Physics_update(_delta):
	actor.velocity.y += 1000 * _delta
	actor.move_and_slide()
	if Input.is_action_just_pressed("jump"):
		if actor.is_on_floor():
			transitioned.emit("JumpingState")
		else:
			transitioned.emit("DoubleJumpState")
			
func Update(_delta):
	pass
