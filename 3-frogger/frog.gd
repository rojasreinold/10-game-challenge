extends Area2D
signal hit
var in_water = false
var on_log = false

@export var speed: int = 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_just_pressed("move_up"):
		velocity.y += speed
	elif Input.is_action_just_pressed("move_down"):
		velocity.y -= speed
	elif Input.is_action_just_pressed("move_right"):
		velocity.x -= speed
	elif Input.is_action_just_pressed("move_left"):
		velocity.x += speed
				
	position -= velocity
	
	if in_water and not on_log:
		hit.emit()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "WaterArea":
		in_water = true
	elif "enemy" in area.get_groups():
		hit.emit()
	
