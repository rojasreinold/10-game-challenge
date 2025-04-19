extends Node2D



func _on_asteroid_timer_timeout() -> void:
	var AsteroidPathFollow = $AsteroidPath/AsteroidPathFollow2D
	AsteroidPathFollow.progress_ratio = randf()
	print(AsteroidPathFollow.get_progress())
