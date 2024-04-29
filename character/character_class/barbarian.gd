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

	var base_hp: int = 12 + base_stat.constitution.modifier()
	base_stat.hp.max_value = base_hp
	base_stat.hp.value = base_hp

	return base_stat

func on_level_up(charater_stat: CharaterStat) -> void:
	charater_stat.strength.value += 1
	charater_stat.constitution.value += 1

	var increase_hp: int = 7 + charater_stat.constitution.modifier()
	charater_stat.hp.max_value += increase_hp
	charater_stat.hp.value += increase_hp
