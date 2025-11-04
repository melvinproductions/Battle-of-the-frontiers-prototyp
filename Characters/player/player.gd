class_name Player
extends CharacterBody2D

var speed = 600
var health = 10

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func get_hit(damage):
	print("ouch")
	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
