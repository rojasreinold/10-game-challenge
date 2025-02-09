extends Area2D

@export var speed = 400
var screen_size
var player_name = "p1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("%s_move_left" %player_name):
		velocity.x -= 1
	if Input.is_action_pressed("%s_move_right" %player_name):
		velocity.x += 1

	velocity = velocity.normalized() * speed
	position += velocity * delta
	
	position = position.clamp(Vector2(539+50,0), Vector2(1376-50, 1080))
