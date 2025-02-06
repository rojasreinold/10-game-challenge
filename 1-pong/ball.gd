extends Area2D

const DEFAULT_SPEED = 400.0

var _speed := DEFAULT_SPEED
var direction := Vector2.LEFT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_speed += delta * 2
	position += _speed * delta * direction

func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == "Player1":
		direction = Vector2(1, randf_range(-1,1))
	if area.name == "Player2":
		var left_skew = randf_range(-1,1)
		print(left_skew)
		direction = Vector2( -1.0, left_skew  )
	if area.name == "DownWall":
		direction = Vector2(direction[0], -direction[1])
	if area.name == "UpWall":
		direction = Vector2(direction[0], -direction[1])
