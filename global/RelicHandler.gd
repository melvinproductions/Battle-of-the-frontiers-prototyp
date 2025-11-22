extends Node

# Innehåller relicdata som består av
# Namn, Description, trigger(s) och effekts
var relics: Array = []

func addRelic(relic: Relic):
	print("Adding relic..")
	if relic.has_method("on_enemy_died"):
		print("Relic connected to signalbus")
		SignalBus.connect("enemy_died", relic.relic_data.on_enemy_died)
