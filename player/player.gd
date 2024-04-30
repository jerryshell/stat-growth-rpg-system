class_name Player
extends CharacterBody2D

@onready var level_up_animated_sprite: AnimatedSprite2D = $LevelUpAnimatedSprite
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	PlayerData.stat.level.level_up.connect(on_level_up)

func on_level_up() -> void:
	level_up_animated_sprite.stop()
	level_up_animated_sprite.play("level_up")
	audio_stream_player.play()
	PlayerData.player_class.on_level_up(PlayerData.stat)
