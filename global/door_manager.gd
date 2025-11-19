extends Node

const scene_main = preload("res://main.tscn")
const scene_room1 = preload("res://rooms/room1.tscn")
const scene_room2 = preload("res://rooms/room2.tscn")
const scene_room3 = preload("res://rooms/room3.tscn")
const scene_room4 = preload("res://rooms/room4.tscn")

var room_scenes = ["main", "room1", "room2", "room3", "room4"]

func randomize_room():
	var random_room = room_scenes[randi() % room_scenes.size()]
	room_scenes.erase(random_room)
	print(room_scenes)
	return random_room

func go_to_level(level_tag):
	var scene_to_load
	
	match level_tag:
		"main":
			scene_to_load = scene_main
		"room2":
			scene_to_load = scene_room2
		"room1":
			scene_to_load = scene_room1
		"room3":
			scene_to_load = scene_room3
		"room4":
			scene_to_load = scene_room4
		
			
	if scene_to_load != null:
		get_tree().change_scene_to_packed(scene_to_load)
