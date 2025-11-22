extends Pickup
# Superclass for all relics.
# Contains basic functionality and framework for all relics
class_name Relic

var relic_data: relic_resource = null

func get_picked_up():
	RelicHandler.addRelic(self)
	queue_free()
