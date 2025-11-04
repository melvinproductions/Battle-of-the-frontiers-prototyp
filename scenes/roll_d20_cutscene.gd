extends Node2D
class_name roll_animation_scene

#var room_scenes = ["main", "room1", "room2", "room3"]

@onready var animation = $AnimatedSprite2D
@export var destionation_scene_tag : String #väljer vilken scene det ska vara
	
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		animation.play("roll")


func _on_animated_sprite_2d_animation_finished() -> void:
	var random_room = DoorManager.randomize_room()
	DoorManager.go_to_level(random_room)
	print(random_room)
