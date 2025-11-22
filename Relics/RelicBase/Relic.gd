extends Pickup

# Superclass for all relics.
# Contains basic functionality and framework for all relics
class_name Relic

var desc: String = "This relic does not yet have a description"
var pickedUp: bool = false

func get_picked_up():
	PlayerStats.relics.append(self)
	pickedUp = true

func _on_mouse_entered() -> void:
	print(desc)
