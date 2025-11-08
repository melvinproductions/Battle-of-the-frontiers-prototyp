extends Pickup
class_name Coin
@export var amount = 0 # placeholder

func get_picked_up(player: Player):
	player.add_coins(amount)
	print("Player picked up: " + str(amount) + " coins")
	queue_free()
