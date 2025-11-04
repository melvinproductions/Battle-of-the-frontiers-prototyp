extends CharacterBody2D
class_name Melee_dude

@onready var player = get_node("../Player") # relative path works too
@onready var sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.x > player.global_position.x:
		sprite.scale.x = -1
	else:
		sprite.scale.x = 1

func on_hit(damage: int):
	print("ouch")
	scale.y *= -1
	
