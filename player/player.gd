extends CharacterBody2D
class_name Player

var speed = 600

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
