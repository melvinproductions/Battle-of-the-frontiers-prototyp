extends CharacterBody2D
# This script is for the enemy class
# It defines standard behaviour all enemies, which they are free to overwrite

class_name Enemy

# Standard health - can be overwritten in implementation
@export var MAX_HEALTH: int = 10
@export var ENEMY_DAMAGE: int = 10
@export var BASE_GOLD_WORTH: int = 10 
@export var ENEMY_SPEED: int = 200;
@export var ENEMY_MAX_HEALTH : int = 10
var health: int = 0 # placeholder

var enemy_healthbar: ProgressBar = null  # placeholder

signal died(enemy: Enemy)

func drop_loot():
	pass	

func die():
	# Sends out signal that something died
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
