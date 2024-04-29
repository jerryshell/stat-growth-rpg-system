class_name Barbarian
extends CharacterClass

func name() -> String:
	return "Barbarian"

func create_base_stat() -> CharaterStat:
	var base_stat: CharaterStat = CharaterStat.new()

	base_stat.strength.value = 15
	base_stat.dexterity.value = 13
	base_stat.constitution.value = 14
	base_stat.intelligence.value = 10
	base_stat.wisdom.value = 12
	base_stat.charisma.value = 8

	var base_health: int = 12 + base_stat.constitution.modifier()
	base_stat.health.max_value = base_health
	base_stat.health.value = base_health

	return base_stat

func on_level_up(charater_stat: CharaterStat) -> void:
	charater_stat.strength.value += 1
	charater_stat.constitution.value += 1

	var increase_health: int = 7 + charater_stat.constitution.modifier()
	charater_stat.health.max_value += increase_health
	charater_stat.health.value += increase_health
