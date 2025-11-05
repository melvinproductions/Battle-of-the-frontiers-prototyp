extends Area2D
@export var amount = 0 # placeholder

func _ready():
	add_to_group("coins")

func picked_up():
	queue_free()
