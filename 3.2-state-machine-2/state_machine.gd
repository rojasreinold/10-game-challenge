class_name StateMachine
extends Node

@export var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine has child which is not a 'State'")
	current_state.Enter()


func _process(delta: float) -> void:
	current_state.Update(delta)
	
func _physics_process(delta: float) -> void:
	current_state.Physics_update(delta)

func on_child_transitioned(new_state_name: StringName) -> void:
	var new_state: State = states.get(new_state_name)
	
	
	if new_state != null:
		if new_state != current_state:
			current_state.Exit()
			
			new_state.Enter()
			
			current_state = new_state
			
