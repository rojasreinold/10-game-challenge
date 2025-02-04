extends Node
@export var ball_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	$Ball.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	#var ball = ball_scene.instantiate()
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	$Ball.linear_velocity = Vector2(-250, 0.0)
	
func game_end():
	pass
