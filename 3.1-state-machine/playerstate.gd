# Boilerplate class to get full autocompletion and type checks for the `player` when coding the player's states.
# Without this, we have to run the game to see typos and other errors the compiler could otherwise catch while scripting.
class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"
const GLIDING = "Gliding"

var player: Player


func _ready() -> void:
	await get_node("../..").ready
	var the_owner = get_node("../..")
	player = get_node("../..") as Player
	assert(player != null)
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
