extends Node
var block_scene: Resource = preload("res://block.tscn")
var screen_size: Vector2
var lives: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ball.ball_missed.connect(on_ball_missed)
	screen_size = get_viewport().size
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func new_game() -> void:
	setup_blocks()
	lives = 3
	$HUD.update_score(0)
	$HUD.update_lives(3)
	
func setup_blocks() -> void:
	#loop creating a row. 14 nodes. block is 100
	var block_horizontal_space = 4
	var block_vertical_space = 4
	
	var horz_block_count = 8
	var vert_block_count = 4
	
	#(1920 % (100+4 ) )/2
	# 
	var horz_screen_buffer = screen_size[0]/2  - ((100) + block_horizontal_space) * horz_block_count/2

	var x = 0
	var y = 0 
	var block_pos_y = 140
	
	while y < 5:
		x = 0
		var block_pos_x = 100/2 + horz_screen_buffer
		while x < 8:
			var block = block_scene.instantiate()
			block.position = Vector2(block_pos_x, block_pos_y)
			block.name = str(block_pos_x) + "Block" + str(block_pos_y) 
			add_child(block)
			print(block.position)
			x += 1
			block_pos_x += 100 +block_horizontal_space
		y += 1
		block_pos_y += 24+ block_vertical_space
		
func on_ball_missed() -> void:
	lives -= 1
	if lives <=0:
		new_game()
	else:
		$HUD.update_lives(lives)
		
