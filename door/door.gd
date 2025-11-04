extends Area2D

class_name Door

@export var destionation_scene_tag : String #väljer vilken scene det ska vara
var is_ready_to_go_to_next_level = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		is_ready_to_go_to_next_level = true
		



func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and is_ready_to_go_to_next_level:
		DoorManager.go_to_level(destionation_scene_tag)
		print(destionation_scene_tag)


func _on_body_exited(body: Node2D) -> void:
	is_ready_to_go_to_next_level = false
