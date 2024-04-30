class_name Bard
extends CharacterClass

func name() -> String:
	return "Bard"

func create_base_stat() -> CharaterStat:
	var level := Level.new(1, 0)

	var strength := Ability.new(8)
	var dexterity := Ability.new(14)
	var constitution := Ability.new(10)
	var intelligence := Ability.new(12)
	var wisdom := Ability.new(13)
	var charisma := Ability.new(15)

	var base_health := 8 + constitution.modifier()
	var health := Health.new(base_health, base_health)

	return CharaterStat.new(level, health, strength, dexterity, constitution, intelligence, wisdom, charisma)

func on_level_up(stat: CharaterStat) -> void:
	stat.charisma.value += 1
	stat.dexterity.value += 1

	var increase_health := 5 + stat.constitution.modifier()
	stat.health.max += increase_health
	stat.health.value += increase_health
