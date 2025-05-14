extends Area2D

var asteroid_scene: PackedScene = preload("res://medium_asteroid.tscn")
signal ship_hit

var DEFAULT_SPEED = 100
var direction
var velocity = Vector2()
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50

func _process(delta: float) -> void:
	position += velocity * delta
	
func set_direction(new_direction):
	direction = new_direction
	velocity.x = cos(new_direction)
	velocity.y = sin(new_direction)
	velocity = velocity.normalized() * DEFAULT_SPEED


func _physics_process(delta: float) -> void:
	if not $JumpTimer.is_stopped():
		return
	var window_size = DisplayServer.window_get_size()
	if position.x < 0:
		$JumpTimer.start()
		position.x = window_size.x -8
	elif position.x > window_size.x:
		$JumpTimer.start()
		position.x = 8
	
	if position.y < 0:
		$JumpTimer.start()
		position.y = window_size.y -8
	elif position.y > window_size.y :
		$JumpTimer.start()

		position.y = 8

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("ship") or area.is_in_group("bullet"):
		print(area)
		var new_asteroid = asteroid_scene.instantiate()
		new_asteroid.set_direction(direction)
		new_asteroid.set_position(position)
		
		get_parent().add_child(new_asteroid)

		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ship"):
		ship_hit.emit()
