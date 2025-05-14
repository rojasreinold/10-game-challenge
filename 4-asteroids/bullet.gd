extends Area2D

var DEFAULT_SPEED = 300
var velocity = Vector2()
# cos(deg_to_rad(DIRECTION))*50, sin(deg_to_rad(DIRECTION))*50

func _process(delta: float) -> void:
		
	position += velocity * delta
	
func set_direction(new_direction):
	velocity.x = cos(deg_to_rad(new_direction))
	velocity.y = sin(deg_to_rad(new_direction))
	velocity = velocity.normalized() * DEFAULT_SPEED


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		queue_free()
