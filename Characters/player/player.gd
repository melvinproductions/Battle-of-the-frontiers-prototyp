class_name Player
extends CharacterBody2D

var health : int
var max_health : int = 100
var speed = 600
var health = 10

@onready var health_bar: ProgressBar = $health_bar


func _ready():
	health = max_health
	health_bar.value = health
	health_bar.init_health(health)

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func get_hit(damage):
	print("ouch")
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("fire"):
		take_damage()
	
	get_input()
	move_and_slide()
	
func take_damage():
	health -= 10
	health_bar.health = health
