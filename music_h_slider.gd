extends HSlider

var audio_bus_name := "Music"

@onready var _bus = AudioServer.get_bus_index(audio_bus_name)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(_bus)
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(self.value))
