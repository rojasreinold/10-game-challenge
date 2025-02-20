extends State

@onready var actor: CharacterBody2D = get_node("../..")


func Enter() -> void:
	pass


func Physics_update(_delta):
	var input_direction: int = Input.get_axis("move_left", "move_right")
	actor.velocity.y += 1000 * _delta
	actor.velocity.x = input_direction * _delta * 20000
	 
	actor.move_and_slide()
	
	if Input.is_action_just_pressed("jump"):
		if actor.is_on_floor():
			print("emit jumping")
			transition_to.emit("Jumping")

	if input_direction != 0 and actor.is_on_floor():
		transition_to.emit("Running")
		
	if actor.is_on_floor() and input_direction == 0:
		transition_to.emit("Idle")
