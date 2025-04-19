extends Node2D

@export var asteroid_scene: PackedScene

func _on_asteroid_timer_timeout() -> void:
	var  AsteroidPathFollow: PathFollow2D = $AsteroidPath/AsteroidPathFollow2D
	AsteroidPathFollow.progress_ratio = randf()
	print(AsteroidPathFollow.get_progress())
	var direction = AsteroidPathFollow.rotation + PI/2
	direction += randf_range(-PI/4, PI/4)
	print("direction: ", rad_to_deg(direction))
	var asteroid = asteroid_scene.instantiate()
	asteroid.set_direction(direction)
	asteroid.set_position(AsteroidPathFollow.position)

	add_child(asteroid)
