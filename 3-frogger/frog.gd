extends Area2D
signal hit
var in_water: bool = false
var on_log: bool = false
var DEFAULT_POSITION: Vector2 = position

@export var speed: int = 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	


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
	if "water_log" in area.get_groups():
		on_log = true
	elif "enemy" in area.get_groups():
		hit.emit()
	
func _on_area_exited(area: Area2D) -> void:
	if "water_log" in area.get_groups():
		on_log = false
		
func reset_position() -> void:
	position = DEFAULT_POSITION
	in_water = false
	on_log = false
