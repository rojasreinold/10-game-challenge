extends Area2D
signal block_hit
var colors: Dictionary = {
	0: Color.DARK_RED,
	1: Color.ORANGE,
	2: Color.YELLOW,
	3: Color.GREEN_YELLOW,
	4: Color.SKY_BLUE
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	block_hit.emit()
	queue_free()
	pass

func set_color(color_num: int):
	$ColorRect.set_color(colors[color_num])
