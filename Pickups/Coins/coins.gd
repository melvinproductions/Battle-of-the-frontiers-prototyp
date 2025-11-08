extends Pickup
class_name Coin
@export var amount = 0 # placeholder

func _ready():
	add_to_group("coins")

func picked_up(player: Player):
	player.add_coins(amount)
	queue_free()
