class_name GUI
extends CanvasLayer

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

func _process(_delta: float) -> void:
	clazz.text = PlayerData.player_class.name()
	level.text = str(PlayerData.stat.level.value)
	proficiency_bonus.text = "%+d" % PlayerData.stat.level.proficiency_bonus()
	xp.text = str(PlayerData.stat.level.xp)
	health.text = "%s / %s" % [PlayerData.stat.health.value, PlayerData.stat.health.max_value]
	strength.text = "%s (%+d)" % [PlayerData.stat.strength.value, PlayerData.stat.strength.modifier()]
	dexterity.text = "%s (%+d)" % [PlayerData.stat.dexterity.value, PlayerData.stat.dexterity.modifier()]
	constitution.text = "%s (%+d)" % [PlayerData.stat.constitution.value, PlayerData.stat.constitution.modifier()]
	intelligence.text = "%s (%+d)" % [PlayerData.stat.intelligence.value, PlayerData.stat.intelligence.modifier()]
	wisdom.text = "%s (%+d)" % [PlayerData.stat.wisdom.value, PlayerData.stat.wisdom.modifier()]
	charisma.text = "%s (%+d)" % [PlayerData.stat.charisma.value, PlayerData.stat.charisma.modifier()]
	# xp_progress_bar
	var level_xp: int = PlayerData.stat.level.level_xp()
	var next_level_xp: int = PlayerData.stat.level.next_level_xp()
	xp_progress_bar.max_value = next_level_xp - level_xp
	xp_progress_bar.value = PlayerData.stat.level.xp - level_xp

func _on_gain_xp_button_pressed() -> void:
	PlayerData.stat.level.xp += 130
