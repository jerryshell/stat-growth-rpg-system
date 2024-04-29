class_name GUI
extends CanvasLayer

var player: Player

@onready var clazz: Label = $Stats/Value/Class
@onready var level: Label = $Stats/Value/Level
@onready var proficiency_bonus: Label = $Stats/Value/ProficiencyBonus
@onready var xp: Label = $Stats/Value/XP
@onready var health: Label = $Stats/Value/Health
@onready var strength: Label = $Stats/Value/Strength
@onready var dexterity: Label = $Stats/Value/Dexterity
@onready var constitution: Label = $Stats/Value/Constitution
@onready var intelligence: Label = $Stats/Value/Intelligence
@onready var wisdom: Label = $Stats/Value/Wisdom
@onready var charisma: Label = $Stats/Value/Charisma
@onready var xp_progress_bar: ProgressBar = $XPProgressBar

func update() -> void:
	if player == null:
		return
	clazz.text = player.character_class.name()
	on_player_level_changed()
	on_player_health_changed()
	on_player_strength_changed()
	on_player_dexterity_changed()
	on_player_constitution_changed()
	on_player_intelligence_changed()
	on_player_wisdom_changed()
	on_player_charisma_changed()

func on_player_level_changed() -> void:
	level.text = str(player.stat.level.value)
	xp.text = str(player.stat.level.xp)
	proficiency_bonus.text = "%+d" % player.stat.level.proficiency_bonus()
	# xp_progress_bar
	var level_xp: int = player.stat.level.level_xp()
	var next_level_xp: int = player.stat.level.next_level_xp()
	xp_progress_bar.max_value = next_level_xp - level_xp
	xp_progress_bar.value = player.stat.level.xp - level_xp

func on_player_health_changed() -> void:
	health.text = "%s / %s" % [player.stat.health.value, player.stat.health.max_value]

func on_player_strength_changed() -> void:
	strength.text = "%s (%+d)" % [player.stat.strength.value, player.stat.strength.modifier()]

func on_player_dexterity_changed() -> void:
	dexterity.text = "%s (%+d)" % [player.stat.dexterity.value, player.stat.dexterity.modifier()]

func on_player_constitution_changed() -> void:
	constitution.text = "%s (%+d)" % [player.stat.constitution.value, player.stat.constitution.modifier()]

func on_player_intelligence_changed() -> void:
	intelligence.text = "%s (%+d)" % [player.stat.intelligence.value, player.stat.intelligence.modifier()]

func on_player_wisdom_changed() -> void:
	wisdom.text = "%s (%+d)" % [player.stat.wisdom.value, player.stat.wisdom.modifier()]

func on_player_charisma_changed() -> void:
	charisma.text = "%s (%+d)" % [player.stat.charisma.value, player.stat.charisma.modifier()]

func _on_gain_xp_button_pressed() -> void:
	player.stat.level.xp += 130
