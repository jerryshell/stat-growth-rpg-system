class_name Health
extends Resource

var value: int:
	set(new_value):
		if new_value > max_value:
			new_value = max_value
		value = new_value
		emit_changed()

var max_value: int:
	set(new_value):
		max_value = new_value
		if value > max_value:
			value = max_value
		emit_changed()

func _init(_max_value: int, _value: int) -> void:
	max_value = _max_value
	value = _value
