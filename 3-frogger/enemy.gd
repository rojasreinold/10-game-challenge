extends RigidBody2D

#class_name enemy

var movement: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VisibleOnScreenNotifier2D.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move() -> void:
	position = Vector2(position.x- 16, position.y)
	pass
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
