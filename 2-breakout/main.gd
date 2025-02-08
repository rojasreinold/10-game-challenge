extends Node
var block_scene = preload("res://block.tscn")
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().size
	new_game()

	print(screen_size)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func new_game() -> void:
	
	#loop creating a row. 14 nodes. block is 100
	var block_horizontal_space = 4
	for n in range(0, screen_size[0] , 100 + 4):
		var block = block_scene.instantiate()
		block.position = Vector2(n, 0)
		add_child(block)
		print("creating block")
