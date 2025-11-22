extends Node
const RELICDATABASE = preload("uid://ejxs837ysbfx")

# Se det som ett torn med alla relics, höjden på tornet är deras
# totala weight.
# För att välja en slumpmässig relic väljer vi en slumpmässighöjd, och river
# tornet tills vår bestämda höjd är botten, den relic som då är i botten blir
# den relic vi returnerar
static func spawn_random_relic(position: Vector2, parent: Node):
	var total_weight: int = RELICDATABASE.get_total_weight()
	if total_weight == 0:
		return null
	
	var rand: int = randi() % total_weight
	for r in RELICDATABASE.all_relics_with_weight:
		rand -= r.weight
		if rand < 0:
			var relic_instance = r.scene.instantiate()
			relic_instance.global_position = position
			parent.add_child(relic_instance)
