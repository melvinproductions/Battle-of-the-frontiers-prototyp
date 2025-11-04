class_name Player
extends CharacterBody2D

var health : int = 10
var max_health : int = 100
var speed = 600

@onready var health_bar: ProgressBar = $health_bar


func _ready():
	health = max_health
	health_bar.value = health
	health_bar.init_health(health)
	
	#sätter player i en egen grupp, lättare att hitta i andra klasser
	add_to_group("player")

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func die():
	pass

func get_hit(damage: int):
	health -= damage
	health_bar.health = health
	if health <= 0:
		die()
