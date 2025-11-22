extends Pickup
class_name Coin
@export var amount = 0 # placeholder

func get_picked_up():
	PlayerStats.coins += amount
	SignalBus.emit_signal("coin_picked_up")
	queue_free()
