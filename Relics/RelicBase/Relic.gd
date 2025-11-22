extends Pickup
# Superclass for all relics.
# Contains basic functionality and framework for all relics
class_name Relic
var relic_name: String = "This relic does not yet have a name"
var desc: String = "This relic does not yet have a description"
var pickedUp: bool = false

func effect():
	push_error("effect() must be implemented in subclass!")
	assert(false) 

func get_picked_up():
	print("Picked up relic! with desc" + desc)
	pickedUp = true
	visible = false
	if has_node("CollisionShape2D"):
		$CollisionShape2D.disabled = true
	
	
func _on_mouse_entered() -> void:
	print(desc)
