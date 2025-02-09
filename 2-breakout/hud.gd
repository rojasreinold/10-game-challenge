extends CanvasLayer

const SAVE_PATH = "user://save_breakout.json"

@export var main_node: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SaveButton.pressed.connect(save_game)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)
	
func update_lives(lives: int) -> void:
	$LivesLabel.text = "Lives: " + str(lives)

func update_highscore(score: int) -> void:
	$HighscoreLabel.text = "Highscore: " + str(score)

func save_game() -> void:
	var save_file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			continue
		
		if !node.has_method("save"):
			continue
		
		var node_data = node.call("save")
		print(node_data)
		
		var json_string = JSON.stringify(node_data)
		
		save_file.store_line(json_string)
	
	#save_file.store_line(JSON.stringify(json))
	
	#get_node(^"..LoadJSON").disabled = false
	print("saved")
	
func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		return
		
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json := JSON.new()
	json.parse(file.get_line())
	var save_dict := json.get_data() as Dictionary
	print(save_dict)
	
	var load_nodes = get_tree().get_nodes_in_group("Persist")

	var node := get_node("..")
	node.highscore = str_to_var(str(save_dict.highscore))
	update_highscore(node.highscore)
