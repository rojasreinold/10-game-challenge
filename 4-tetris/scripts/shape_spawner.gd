extends Marker2D


var L_shape_scene: PackedScene = preload("res://scenes/l_shape.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var L_shape: Node = L_shape_scene.instantiate()
	get_node("../ShapeMoveTimer").timeout.connect(L_shape.timer_move_shape)
	add_child(L_shape)
