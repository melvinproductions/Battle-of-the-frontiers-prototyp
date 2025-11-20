class_name Player
extends CharacterBody2D


@onready var player_health_bar: ProgressBar = $bars/health_bar
@onready var dash_progress_bar: ProgressBar = $bars/dash_progress_bar

@onready var dash_duration_timer: Timer = $timers/Dash_duration_timer
@onready var dash_cooldown_timer: Timer = $timers/Dash_cooldown_timer

@onready var invincibility_timer: Timer = $timers/Invincibility_timer
var is_invincible : bool = false

var is_dashing : bool = false
var dash_speed : int = 1100
var can_dash : bool = true

@onready var enemy_checker: Label = $EnemyChecker

func _ready():	
	player_health_bar.value = PlayerStats.health
	player_health_bar.init_health(PlayerStats.max_health, PlayerStats.health)
	dash_progress_bar.max_value = dash_cooldown_timer.wait_time
	PlayerStats.leveled_up.connect(_on_leveled_up)
	
	#sätter player i en egen grupp, lättare att hitta i andra klasser
	add_to_group("player")
	

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	
	if !is_dashing:
		velocity = input_dir * PlayerStats.speed
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dash(input_dir)
	
	if Input.is_action_just_pressed("melee"):
		melee_attack()

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	dash_progress_bar.value = dash_cooldown_timer.time_left
	
	if dash_progress_bar.value == 0:
		dash_progress_bar.visible = false
	else:
		dash_progress_bar.visible = true

func dash(input_dir):
	is_dashing = true
	is_invincible = true
	
	can_dash = false
	dash_cooldown_timer.start()
	
	dash_duration_timer.start()
	var dash_dir = input_dir
	velocity = dash_dir * dash_speed


func melee_attack():
	print("melee attack")
	update_enemy_checker()

func die():
	pass

func get_hit(damage: int):
	if !is_invincible:
		invincibility_timer.start()
		is_invincible = true
		
		PlayerStats.health -= damage
		player_health_bar.health = PlayerStats.health
		if PlayerStats.health <= 0:
			die()

func _on_dash_duration_timer_timeout() -> void:
	is_dashing = false
	is_invincible = false


func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true


func _on_invincibility_timer_timeout() -> void:
	is_invincible = false

func _on_leveled_up():
	player_health_bar.value = PlayerStats.health
	player_health_bar.init_health(PlayerStats.max_health, PlayerStats.health)

func add_coins(amount: int) -> void:
	PlayerStats.coins += amount
	# Extra pickup animations/UI/whatever

# Detects when player picks up coins
func _on_pickup_detector_area_entered(area: Area2D) -> void:
	if area.is_in_group("pickups"):
		area.get_picked_up(self)

func update_enemy_checker():
	enemy_checker.text = ("0000")
