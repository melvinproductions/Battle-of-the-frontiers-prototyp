extends CharacterBody2D
# This script is for the enemy class
# It defines standard behaviour all enemies, which they are free to overwrite
class_name Enemy

@export var MAX_HEALTH: int = 10
@export var ENEMY_DAMAGE: int = 10
@export var BASE_GOLD_WORTH: int = 10 
@export var ENEMY_SPEED: int = 200;
@export var ENEMY_MAX_HEALTH : int = 10
const COINS = preload("uid://c3befyj2lgpcx")

var health: int = 0 # placeholder
var enemy_healthbar: ProgressBar = null  # placeholder

signal died(enemy: Enemy)

func drop_loot():
	print("adding coin scene")
	if COINS:
		call_deferred("spawn_coin")


func spawn_coin():
		var coin = COINS.instantiate()
		coin.amount = BASE_GOLD_WORTH
		coin.global_position = global_position
		get_parent().add_child(coin)
	

func die():
	# Sends out signal that something died
	drop_loot()
	emit_signal("died", self)
	queue_free()

func get_hit(damage: int):
	health -= damage
	enemy_healthbar.health = health
	if (health <= 0):
		die()
		
# Damage player when they ender 2D area body
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player: 
		body.get_hit(ENEMY_DAMAGE)
