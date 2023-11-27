extends HSlider


export var audio_bus_name := "SFX"

onready var _bus := AudioServer.get_bus_index(audio_bus_name)

func _ready() -> void:
	print(audio_bus_name)
	value = db2linear(AudioServer.get_bus_volume_db(_bus))

func _on_sfxSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear2db(value))
