class_name Ability
extends Resource

var value: int:
	set(new_value):
		value = new_value
		emit_changed()

func _init(_value: int) -> void:
	value = _value

func modifier() -> int:
	return floori((value - 10) / 2.0)
