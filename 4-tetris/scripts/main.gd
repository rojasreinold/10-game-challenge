extends Node

var L_shape_scene: PackedScene = preload("res://scenes/l_shape.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var L_shape: Node = L_shape_scene.instantiate()
	$ShapeMoveTimer.timeout.connect(L_shape.timer_move_shape)
	add_child(L_shape)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
