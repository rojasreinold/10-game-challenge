extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum States {IDLE, RUNNING, JUMPING, FALLING, GLIDING}

var state: States = States.IDLE

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func update_state_label() -> void:
	var state_string: String = ""
	match state:
		0:
			state_string = "idle"
		1: 
			state_string = "running"
		2: 
			state_string = "jumping"
		3: 
			state_string = "falling"
		4:
			state_string = "gliding"
		
	$StateLabel.text = state_string
