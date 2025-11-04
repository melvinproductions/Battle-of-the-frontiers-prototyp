extends Node

const scene_main = preload("res://main.tscn")
const scene_room1 = preload("res://rooms/room1.tscn")
const scene_room2 = preload("res://rooms/room2.tscn")

var spawn_door_tag

func go_to_level(level_tag):
	var scene_to_load
	
	match level_tag:
		"main":
			scene_to_load = scene_main
		"room2":
			scene_to_load = scene_room2
		"room1":
			scene_to_load = scene_room1
		
			
	if scene_to_load != null:
		get_tree().change_scene_to_packed(scene_to_load)
