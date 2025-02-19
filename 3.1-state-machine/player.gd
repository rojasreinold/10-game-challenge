extends CharacterBody2D


var SPEED: int = 300.0
const JUMP_VELOCITY = -400.0

var speed := 500.0
var jump_impulse := 1800.0
var base_gravity := 4000.0

var glide_max_speed := 1000.0
var glide_acceleration := 1000.0
var glide_gravity := 400.0
var glide_jump_impulse := 800.0

var current_gravity := base_gravity

enum States {IDLE, RUNNING, JUMPING, FALLING, GLIDING}
const GROUND_STATES := [States.IDLE, States.RUNNING]

var state: States = States.IDLE: set = set_state

func _physics_process(delta: float) -> void:

	var input_direction_x: int = Input.get_axis("move_left", "move_right")
	if state in GROUND_STATES and Input.is_action_just_pressed("jump"):
		state = States.JUMPING
	elif ((state in GROUND_STATES and not is_on_floor()) or
		(state == States.JUMPING and velocity.y > 0)
		):
		state = States.FALLING
		
	elif is_on_floor():
		if input_direction_x != 0.0:
			state = States.RUNNING
		else:
			state = States.IDLE
	if state in [States.RUNNING, States.JUMPING, States.FALLING]:
		velocity.x = input_direction_x * speed
	
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("move_left", "move_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity.y += current_gravity * delta
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
	
	
func set_state(new_state: int) -> void:
	print("setting state")
	var previous_state: int = state
	state = new_state
	
	if state == States.IDLE:
		velocity.x = 0.0
	elif state == States.JUMPING:
		velocity.y = -jump_impulse
		
	update_state_label()
