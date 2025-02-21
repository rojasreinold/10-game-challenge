extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func timer_move_shape() -> void:
	print("moving")
	var children: Array[Node] = get_children()
	for child in children:
		if "block" in child.get_groups():
			child.velocity.y = 5000
			child.move_and_slide()
