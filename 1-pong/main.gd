extends Node
#@export var ball_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	$Ball.player_scored.connect(on_player_scored)
	# $Ball.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	#var ball = ball_scene.instantiate()
	pass
	
	
func on_player_scored(player_name: String) -> void:
	print("name: " + player_name)
	if player_name == "p1":
		$HUD/Player1Score.text = str(int($HUD/Player1Score.text) + 1)
	if player_name == "p2":
		$HUD/Player2Score.text = str(int($HUD/Player2Score.text) + 1)
	$Ball.reset_ball()
		
func game_end():
	pass
