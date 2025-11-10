extends Pickup
class_name XpPickup
var xp_amount = 0

func get_picked_up(player: Player) -> void:
	player.add_xp(xp_amount)
	print("Player picked up: " + str(xp_amount) + " xp")
	queue_free()
