extends CharacterBody2D

@export var speed: int = 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_just_pressed("move_up"):
		velocity.y += speed
	elif Input.is_action_just_pressed("move_down"):
		velocity.y -= speed
	elif Input.is_action_just_pressed("move_right"):
		velocity.x -= speed		
	elif Input.is_action_just_pressed("move_left"):
		velocity.x += speed
				
	position -= velocity
	
