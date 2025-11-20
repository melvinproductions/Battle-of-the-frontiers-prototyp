extends CharacterBody2D
# This script is for the enemy class
# It defines standard behaviour all enemies, which they are free to overwrite
class_name Enemy

var modifier_placeholder: float = 1.5
@export var MAX_HEALTH: int = 10
@export var ENEMY_DAMAGE: int = 10
@export var ENEMY_SPEED: int = 200;
@export var ENEMY_MAX_HEALTH : int = 10
@export var BASE_GOLD_WORTH: int = 10 
@export var BASE_XP_WORTH: int = 10
const COINS = preload("uid://c3befyj2lgpcx")

var health: int = 0 # placeholder
var enemy_healthbar: ProgressBar = null  # placeholder

signal enemy_died(enemy: Enemy)

func drop_loot():
	if COINS:
		call_deferred("spawn_coin")
	PlayerStats.add_xp(BASE_XP_WORTH)

func spawn_coin():
	var coin = COINS.instantiate()
	# Avrundar upp till närmsta heltal
	coin.amount = int(ceil(BASE_GOLD_WORTH * modifier_placeholder))
	coin.global_position = global_position
	get_parent().add_child(coin)


func die():
	# Sends out signal that something died
	drop_loot()
	emit_signal("enemy_died", self)
	queue_free()

func get_hit(damage: int):
	health -= damage
	enemy_healthbar.health = health
	if (health <= 0):
		die()
		
# Damage player when they ender 2D area body
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player: 
		body.get_hit(int(ceil(ENEMY_DAMAGE * modifier_placeholder)))
