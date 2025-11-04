extends CharacterBody2D
class_name Melee_dude

@onready var sprite: Sprite2D = $Sprite2D
@onready var enemy_healthbar: ProgressBar = $enemy_healthbar

@onready var player = get_tree().get_first_node_in_group("player")

var health : int
const ENEMY_MAX_HEALTH : int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = ENEMY_MAX_HEALTH
	enemy_healthbar.init_health(health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		return
	
	if global_position.x < player.global_position.x:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func die():
	queue_free()

func get_hit(damage: int):
	health -= damage
	enemy_healthbar.health = health
	if (health <= 0):
		die()
