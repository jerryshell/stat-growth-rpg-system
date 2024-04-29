class_name Cleric
extends CharacterClass

func name() -> String:
	return "Cleric"

func create_base_stat() -> CharaterStat:
	var base_stat: CharaterStat = CharaterStat.new()

	base_stat.strength.value = 14
	base_stat.dexterity.value = 8
	base_stat.constitution.value = 13
	base_stat.intelligence.value = 10
	base_stat.wisdom.value = 15
	base_stat.charisma.value = 12

	var base_hp: int = 8 + base_stat.constitution.modifier()
	base_stat.hp.max = base_hp
	base_stat.hp.value = base_hp

	return base_stat

func on_level_up(charater_stat: CharaterStat) -> void:
	charater_stat.wisdom.value += 1
	charater_stat.strength.value += 1

	var increase_hp: int = 5 + charater_stat.constitution.modifier()
	charater_stat.hp.max += increase_hp
	charater_stat.hp.value += increase_hp
