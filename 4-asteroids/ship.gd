extends CharacterBody2D
var DECCELERATION = 0.97
var THRUSTER_ACCELERATION = 600
var ROTATION_SPEED = 120 # degrees
var DIRECTION = 270

var bullet_scene: Resource = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y + sin(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION
		velocity.x = velocity.x + cos(deg_to_rad(DIRECTION))*delta*THRUSTER_ACCELERATION
	else:
		velocity = Vector2( velocity.x*DECCELERATION, velocity.y*DECCELERATION)
		
	if Input.get_axis("ui_left", "ui_right"):
		DIRECTION = DIRECTION + Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta
		self.rotate(deg_to_rad(Input.get_axis("ui_left", "ui_right") *ROTATION_SPEED*delta))
	var motion = velocity * delta

	move_and_collide(motion)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and $BulletTimer.is_stopped():
		$BulletTimer.start()
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = self.position + Vector2( cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50 )
		bullet_instance.set_direction(DIRECTION)
		get_parent().add_child(bullet_instance)
