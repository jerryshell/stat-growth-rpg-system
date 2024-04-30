class_name CharacterClass
extends Resource

func name() -> String:
	assert(false, "This function needs to implemented in the child class.")
	return ""

func create_base_stat() -> CharaterStat:
	assert(false, "This function needs to implemented in the child class.")
	return null

func on_level_up(_stat: CharaterStat) -> void:
	assert(false, "This function needs to implemented in the child class.")
