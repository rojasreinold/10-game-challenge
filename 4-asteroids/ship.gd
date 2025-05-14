extends CharacterBody2D
var DECCELERATION = 0.97
var THRUSTER_ACCELERATION = 800
var ROTATION_SPEED = 180 # degrees
var DIRECTION = 270

var bullet_scene: Resource = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:
	var up_down_movement = Input.get_axis( "ui_down", "ui_up")
	# print(up_down_movement)
	if up_down_movement:
		velocity.y = velocity.y + (sin(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION *up_down_movement)
		velocity.x = velocity.x + (cos(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION *up_down_movement)
	else:
		velocity = Vector2( velocity.x*DECCELERATION, velocity.y*DECCELERATION)
		
	if Input.get_axis("ui_left", "ui_right"):
		DIRECTION = DIRECTION + Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta
		self.rotate(deg_to_rad(Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta))
	var motion = velocity * delta

	move_and_collide(motion)
	
	if not $JumpTimer.is_stopped():
		return
	var window_size = DisplayServer.window_get_size()
	if global_position.x < 0:
		$JumpTimer.start()
		global_position.x = window_size.x -32
	elif global_position.x > window_size.x:
		$JumpTimer.start()
		global_position.x = 32
	
	if global_position.y < 0:
		$JumpTimer.start()
		global_position.y = window_size.y -32
	elif global_position.y > window_size.y :
		$JumpTimer.start()
		global_position.y = 32

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and $BulletTimer.is_stopped():
		$BulletTimer.start()
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = self.position + Vector2( cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50 )
		bullet_instance.set_direction(DIRECTION)
		get_parent().add_child(bullet_instance)
