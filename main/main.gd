extends Node2D

@onready var player: Player = $Player
@onready var gui: GUI = $GUI

func _ready() -> void:
	gui.player = player
	player.stat.level.changed.connect(gui.on_player_level_changed)
	player.stat.hp.changed.connect(gui.on_player_hp_changed)
	player.stat.strength.changed.connect(gui.on_player_strength_changed)
	player.stat.dexterity.changed.connect(gui.on_player_dexterity_changed)
	player.stat.constitution.changed.connect(gui.on_player_constitution_changed)
	player.stat.intelligence.changed.connect(gui.on_player_intelligence_changed)
	player.stat.wisdom.changed.connect(gui.on_player_wisdom_changed)
	player.stat.charisma.changed.connect(gui.on_player_charisma_changed)
	gui.update()
