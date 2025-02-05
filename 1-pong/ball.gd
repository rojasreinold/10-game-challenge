extends Area2D

const DEFAULT_SPEED = 200.0

var _speed := DEFAULT_SPEED
var direction := Vector2.LEFT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_speed += delta * 2
	position += _speed * delta * direction
	pass


func _on_body_entered(body: Node2D) -> void:
	print("_on_body_entered") # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	print("ball _on_body_entered") # Replace with function body.
