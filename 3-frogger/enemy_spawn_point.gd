extends Marker2D
class_name EnemySpawnPoint

var road_array = Array()
var water_array = Array()
@export_enum("LEFT:-1", "RIGHT:1") var direction: int = -1
@export_enum("ENEMIES", "LOGS") var spawn_type: int = 0

func _init() -> void:	
	var car = load("res://car_enemy.tscn")
	var log = load("res://water_log.tscn")
	var gator = load("res://gator_enemy.tscn")
	road_array.append(car)
	water_array.append(log)
	water_array.append(gator)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_unit)
	spawn_unit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func spawn_unit() -> void:
	if spawn_type == 0:
		spawn_enemy()
	elif spawn_type == 1: 
		spawn_water_unit()
		
func spawn_enemy() -> void:
	var new_car = road_array[0].instantiate()
	new_car.set_direction(direction)
	$MoveTimer.timeout.connect(new_car.move)
	add_child(new_car)

func spawn_water_unit() -> void:
	var new_water_unit = water_array[0].instantiate()
	new_water_unit.set_direction(direction)
	$MoveTimer.timeout.connect(new_water_unit.move)
	add_child(new_water_unit)
