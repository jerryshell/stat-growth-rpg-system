class_name Barbarian
extends CharacterClass

func name() -> String:
	return "Barbarian"

func create_base_stat() -> CharaterStat:
	var level := Level.new(1, 0)

	var strength := Ability.new(15)
	var dexterity := Ability.new(13)
	var constitution := Ability.new(14)
	var intelligence := Ability.new(10)
	var wisdom := Ability.new(12)
	var charisma := Ability.new(8)

	var base_health := 12 + constitution.modifier()
	var health := Health.new(base_health, base_health)

	return CharaterStat.new(level, health, strength, dexterity, constitution, intelligence, wisdom, charisma)

func on_level_up(stat: CharaterStat) -> void:
	stat.strength.value += 1
	stat.constitution.value += 1

	var increase_health := 7 + stat.constitution.modifier()
	stat.health.max_value += increase_health
	stat.health.value += increase_health
