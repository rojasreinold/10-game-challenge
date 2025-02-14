extends Node
var health: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Frog.hit.connect(on_frog_hit)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
		
func on_frog_hit() -> void:
	health -= 1
	$HUD.set_lives(health)
