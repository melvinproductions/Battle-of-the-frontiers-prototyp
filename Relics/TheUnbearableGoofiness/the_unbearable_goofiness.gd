extends Relic
var enemies_killed: int = 0

func _on_ready():
	desc = "He is so goooooofyy!! I cannot believe it."

func on_enemy_death(_enemy: Enemy):
	if (!pickedUp):
		return
	enemies_killed += 1
	if (enemies_killed >= 3):
		print("HEALING PLAYER")
		enemies_killed -= 3
		PlayerStats.health += 10
		if (PlayerStats.health > PlayerStats.max_health):
			PlayerStats.health = PlayerStats.max_health
