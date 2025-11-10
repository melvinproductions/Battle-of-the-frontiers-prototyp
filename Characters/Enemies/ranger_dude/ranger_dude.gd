extends Enemy
class_name Ranger_dude

@onready var sprite: Sprite2D = $Sprite2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var nav_agent: NavigationAgent2D = $AI/NavigationAgent2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_healthbar = $enemy_healthbar
	health = 5
	enemy_healthbar.init_health(health)

func _physics_process(_delta: float) -> void:
	nav_agent.target_position = player.global_position
		
	var next_path_position = nav_agent.get_next_path_position()
		
	var direction = global_position.direction_to(next_path_position)
	velocity = direction * ENEMY_SPEED
	
	#raycast saker (JAG KOMMENTERADE BORT PGA FYLLD KONSOL //HAMPUS)
	# print(ray_cast_2d.is_colliding())
	
	move_and_slide()

func make_path():
	nav_agent.target_position = player.global_position


func _on_time_until_make_new_path_timeout() -> void:
	make_path()
