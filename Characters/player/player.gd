class_name Player
extends CharacterBody2D

var health : int = 10
var max_health : int = 100
var speed = 600

@onready var player_health_bar: ProgressBar = $bars/health_bar
@onready var dash_progress_bar: ProgressBar = $bars/dash_progress_bar

@onready var dash_duration_timer: Timer = $timers/Dash_duration_timer
@onready var dash_cooldown_timer: Timer = $timers/Dash_cooldown_timer

@onready var invincibility_timer: Timer = $timers/Invincibility_timer
var is_invincible : bool = false

var is_dashing : bool = false
var dash_speed : int = 1100
var can_dash : bool = true

func _ready():
	health = max_health
	
	player_health_bar.value = health
	player_health_bar.init_health(health)
	dash_progress_bar.max_value = dash_cooldown_timer.wait_time
	
	#sätter player i en egen grupp, lättare att hitta i andra klasser
	add_to_group("player")

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	
	if !is_dashing:
		velocity = input_dir * speed
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dash(input_dir)
	
	if Input.is_action_just_pressed("melee"):
		melee_attack()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func _process(delta):
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
	print("melee attack!")

func die():
	pass

func get_hit(damage: int):
	if !is_invincible:
		invincibility_timer.start()
		is_invincible = true
		print("player can now not take damage")
		
		health -= damage
		player_health_bar.health = health
		if health <= 0:
			die()

func _on_dash_duration_timer_timeout() -> void:
	is_dashing = false
	is_invincible = false


func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true


func _on_invincibility_timer_timeout() -> void:
	is_invincible = false
	print("player CAN now take damage")
