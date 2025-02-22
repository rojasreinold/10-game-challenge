extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		position = position + Vector2(-32, 0)
	elif Input.is_action_just_pressed("move_right"):
		position = position + Vector2(32, 0)
	elif Input.is_action_just_pressed("move_down"):
		position = position + Vector2(0,32)
		
func timer_move_shape() -> void:
	var children: Array[Node] = get_children()
	position = position + Vector2(0,32)
