extends CharacterBody2D
class_name Melee_dude

@onready var sprite: Sprite2D = $Sprite2D
@onready var enemy_healthbar: ProgressBar = $enemy_healthbar

@onready var player = get_tree().get_first_node_in_group("player")
@onready var nav_agent: NavigationAgent2D = $"AI handler/NavigationAgent2D"

var speed : int = 325
var health : int
const ENEMY_DAMAGE: int = 1
const ENEMY_SPEED: int = 200;
const ENEMY_MAX_HEALTH : int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = ENEMY_MAX_HEALTH
	enemy_healthbar.init_health(health)

func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var target_global = nav_agent.get_next_path_position()
	var dir = (target_global - global_position)  # use global positions
	if dir.length() > 0.001:
		velocity = dir.normalized() * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func die():
	queue_free()

func get_hit(damage: int):
	health -= damage
	enemy_healthbar.health = health
	if (health <= 0):
		die()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player: 
		body.get_hit(ENEMY_DAMAGE)

func make_path():
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	make_path()
