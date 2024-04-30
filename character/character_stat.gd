class_name CharaterStat
extends Resource

var level: Level = Level.new(1, 0)

var health: Health = Health.new(10, 10)

var strength: Ability = Ability.new(5)
var dexterity: Ability = Ability.new(5)
var constitution: Ability = Ability.new(5)
var intelligence: Ability = Ability.new(5)
var wisdom: Ability = Ability.new(5)
var charisma: Ability = Ability.new(5)

func _init(_level: Level, _health: Health, _strength: Ability, _dexterity: Ability, _constitution: Ability, _intelligence: Ability, _wisdom: Ability, _charisma: Ability) -> void:
    level = _level
    health = _health
    strength = _strength
    dexterity = _dexterity
    constitution = _constitution
    intelligence = _intelligence
    wisdom = _wisdom
    charisma = _charisma
