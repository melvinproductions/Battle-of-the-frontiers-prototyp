extends Area2D
class_name Door

const rooms_array = ["main", "room2", "room1", "room3", "room4"]
var is_ready_to_go_to_next_level = false

const roll_scene = preload("uid://bsgoxk4b8h68")


func _on_body_entered(body):
	if body is Player:
		is_ready_to_go_to_next_level = true
		

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and is_ready_to_go_to_next_level:
		get_tree().change_scene_to_packed(roll_scene)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		is_ready_to_go_to_next_level = false
