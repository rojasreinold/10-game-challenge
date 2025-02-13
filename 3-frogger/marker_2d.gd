extends Marker2D
var car = load("res://car_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_enemy)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_enemy() -> void:
	print("spawning enemy")
	var new_car = car.instantiate()
	new_car.position = position
	add_child(new_car)
