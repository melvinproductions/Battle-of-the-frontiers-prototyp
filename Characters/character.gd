extends CharacterBody2D
class_name Character

# Optional: base propterties
var health := 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not has_method("get_hit"):
		push_error("Subclasses of Character must implement get_hit()!")

func get_hit(damage):
	push_error("get_hit not implemented in subclass")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
