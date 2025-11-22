extends Area2D
class_name Pickup
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("pickups")

func get_picked_up():
	# Stops execution due to subclass not having a defined get_picked_up().  
	push_error("get_picked_up() must be implemented in subclass!")
	assert(false) 
