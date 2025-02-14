extends Marker2D
class_name EnemySpawnPoint

var road_array = Array()
var water_array = Array()
@export_enum("LEFT:-1", "RIGHT:1") var direction: int

func _init() -> void:	
	var car = load("res://car_enemy.tscn")
	var gator = load("res://gator_enemy.tscn")
	road_array.append(car)
	water_array.append(gator)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_enemy)
	spawn_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_enemy() -> void:
	var new_car = road_array[0].instantiate()
	new_car.set_direction(direction)
	$MoveTimer.timeout.connect(new_car.move)
	add_child(new_car)
