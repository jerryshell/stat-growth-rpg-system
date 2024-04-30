class_name Cleric
extends CharacterClass

func name() -> String:
	return "Cleric"

func create_base_stat() -> CharaterStat:
	var level := Level.new(1, 0)

	var strength := Ability.new(14)
	var dexterity := Ability.new(8)
	var constitution := Ability.new(13)
	var intelligence := Ability.new(10)
	var wisdom := Ability.new(15)
	var charisma := Ability.new(12)

	var base_health := 8 + constitution.modifier()
	var health := Health.new(base_health, base_health)

	return CharaterStat.new(level, health, strength, dexterity, constitution, intelligence, wisdom, charisma)

func on_level_up(stat: CharaterStat) -> void:
	stat.wisdom.value += 1
	stat.strength.value += 1

	var increase_health := 5 + stat.constitution.modifier()
	stat.health.max += increase_health
	stat.health.value += increase_health
