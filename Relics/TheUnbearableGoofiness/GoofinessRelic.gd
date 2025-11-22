extends relic_resource
class_name GoofinessRelic

var enemies_killed: int = 0
@export var KILLS_PER_HEAL: int = 3
@export var HEAL_AMOUNT:int = 5

func on_enemy_died(_enemy: Enemy):
	print("SKIBIDI OHIO IT WORKS!!")
	enemies_killed += 1
	if enemies_killed >= KILLS_PER_HEAL:
		PlayerStats.health += HEAL_AMOUNT
		if PlayerStats.health > PlayerStats.max_health:
			PlayerStats.health = PlayerStats.max_health
