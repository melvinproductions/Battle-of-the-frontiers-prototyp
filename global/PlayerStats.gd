extends Node

signal leveled_up(new_level)

@export var max_health: int = 100
var health: int = max_health
var xp: int = 0
var level: int = 1
var coins: int = 0
@export var speed: int = 600
var xp_for_level = 10 
var relics: Array = []

func add_xp(amount: int):
	xp += amount
	print("XP: %s/%s - Level: %s" % [xp, xp_for_level, level])
	if xp >= xp_for_level:
		level_up()

func level_up():
	level += 1
	xp -= xp_for_level
	xp_for_level += 10
	print("Level up!")
	var health_increase =  int(ceil(level * 5))
	max_health += health_increase
	health += health_increase
	speed += 10
	emit_signal("leveled_up")
