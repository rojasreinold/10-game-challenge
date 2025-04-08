extends CharacterBody2D
var DECCELERATION = 0.97
var THRUSTER_ACCELERATION = 600
var ROTATION_SPEED = 90 # degrees
var DIRECTION = 270

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_up"):
		#velocity.y = velocity.y + (delta* THRUSTER_ACCELERATION)
		#print(delta*THRUSTER_ACCELERATION*DIRECTION)
		#velocity = velocity + Vector2((delta*THRUSTER_ACCELERATION*DIRECTION.x), (delta*THRUSTER_ACCELERATION*DIRECTION.y))
		velocity.y = velocity.y + sin(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION
		velocity.x = velocity.x + cos(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION
	else:
		velocity = Vector2( velocity.x*DECCELERATION, velocity.y*DECCELERATION)
		
	if Input.get_axis("ui_left", "ui_right"):
		DIRECTION = DIRECTION + Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta
		self.rotate(deg_to_rad(Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta))
	var motion = velocity * delta

	move_and_collide(motion)
	move_toward(1, 1, delta)
