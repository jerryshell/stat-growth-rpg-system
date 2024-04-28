class_name Player
extends CharacterBody2D

var character_class: CharacterClass = Barbarian.new()
var stat: CharaterStat = character_class.create_base_stat()

@onready var level_up_animated_sprite: AnimatedSprite2D = $LevelUpAnimatedSprite
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	stat.level.level_up.connect(on_level_up)

func on_level_up() -> void:
	level_up_animated_sprite.stop()
	level_up_animated_sprite.play("level_up")
	audio_stream_player.play()
	character_class.on_level_up(stat)
