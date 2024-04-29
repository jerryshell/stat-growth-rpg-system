class_name Level
extends Resource

signal level_up

var value: int:
	set(new_value):
		value = new_value
		emit_changed()

var xp: int:
	set(new_value):
		while true:
			if is_max_level():
				xp = 0
				return

			xp = new_value
			emit_changed()

			if xp < next_level_xp():
				return
			increase_level()

func _init(_level: int, _xp: int) -> void:
	value = _level
	xp = _xp

func is_max_level() -> bool:
	return value >= XpDatabase.MAX_LEVEL

func level_xp() -> int:
	return XpDatabase.level_xp_at(value)

func next_level_xp() -> int:
	return XpDatabase.level_xp_at(value + 1)

func increase_level() -> void:
	value += 1
	level_up.emit()

func proficiency_bonus() -> int:
	return (value - 1) / 4 + 2
