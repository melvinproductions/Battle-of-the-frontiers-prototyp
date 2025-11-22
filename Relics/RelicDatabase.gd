extends Node
class_name RelicDatabase
const COMMON_WEIGHT: int = 60

# relics that can be spawned
# Higher weight => spawns more often
static var all_relics_with_weight: Array[Dictionary] = [
	{"scene": preload("uid://bvqfme6ku8qhk"), "weight": COMMON_WEIGHT}
]

static func get_total_weight() -> int:
	var total = 0
	for r in all_relics_with_weight:
		total += r.weight
	return total
