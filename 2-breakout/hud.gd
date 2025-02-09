extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)
	
func update_lives(lives: int) -> void:
	$LivesLabel.text = "Lives: " + str(lives)
