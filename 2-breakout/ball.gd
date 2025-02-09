extends Area2D

signal ball_missed

const DEFAULT_SPEED = 400
const DEFAULT_POSITION = Vector2(960,540)

var direction := Vector2.DOWN
var _speed := DEFAULT_SPEED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_speed += delta * 2
	position += _speed * delta * direction
	
func _on_area_entered(area: Area2D) -> void:
	print(area)
	if area.name == "Player1":
		direction = Vector2(randf_range(-1,1), -1)

	if area.name.contains("Block"):
		direction = Vector2(randf_range(-1,1), 1)
		_speed += 20
	
	if area.name == "LeftWall" or area.name == "RightWall":
		direction = Vector2(-direction[0], direction[1])
		
	if area.name == "Ceiling":
		direction = Vector2(randf_range(-1,1), 1)
	if area.name == "Floor":
		ball_missed.emit()
		reset_ball()
		
func reset_ball() -> void:
	direction = Vector2.DOWN
	position = DEFAULT_POSITION
