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
	if Input.is_action_pressed("%s_move_up" %player_name):
		velocity.y -= 1
	if Input.is_action_pressed("%s_move_down" %player_name):
		velocity.y += 1

	velocity = velocity.normalized() * speed
	position += velocity * delta
	
	#TODO: clamp position to the border by creating a new smaller vectors:
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_entered(area: Area2D) -> void:
	print("player1 _on_body_entered") # Replace with function body.
