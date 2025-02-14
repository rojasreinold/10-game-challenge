extends Marker2D
class_name EnemySpawnPoint

var car = load("res://car_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_enemy() -> void:
	var new_car = car.instantiate()
	$MoveTimer.timeout.connect(new_car.move)
	add_child(new_car)
