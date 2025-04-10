extends RigidBody2D

var SPEED = 200
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50
func set_direction(new_direction):
	linear_velocity.x = SPEED* cos(deg_to_rad(new_direction))
	linear_velocity.y = SPEED * sin(deg_to_rad(new_direction))
	
