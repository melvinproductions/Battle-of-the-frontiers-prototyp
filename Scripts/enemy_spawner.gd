extends Node
class_name EnemySpawner

@export var spawn_pos : Array[Marker2D]
const enemy = preload("res://Characters/Enemies/melee_dude/melee_dude.tscn")

@onready var door : Door = $"../door"

var enemies_to_kill : int
var enemies_killed : int

#signal som skickas t spelaren
signal enemies_killed_changed(e_killed, e_to_kill)

var time_between_waves : Timer

func _ready() -> void:
	#spawnar första ligan fiender
	initial_wave()
	
	#slumpar mängd fiender att behöva döda
	enemies_to_kill = randi_range(2, 3)
	
	#timer saker
	time_between_waves = Timer.new()
	add_child(time_between_waves)
	
	time_between_waves.wait_time = randi_range(5.0, 15.0)
	time_between_waves.one_shot = true
	time_between_waves.autostart = true
	
	time_between_waves.timeout.connect(_on_timer_timeout)
	time_between_waves.start()
	
	#uppdaterar spelarens UI så att den visar hur många fiender som måste dödas
	var player = get_tree().get_first_node_in_group("player")
	player.on_enemies_killed_ui_change(enemies_killed, enemies_to_kill)

func _on_timer_timeout():
	print("SPAWN MORE ENEMIES NOW")
	spawn_enemy()
	time_between_waves.start()

func spawn_enemy():
	var spawn_point = spawn_pos[randi() % spawn_pos.size()]
	var ene = enemy.instantiate()
	ene.global_position = spawn_point.global_position
	add_child(ene)
	
	ene.enemy_died.connect(_on_enemy_death)

func initial_wave():
	var first_wave = randi_range(2, 6)
	for i in first_wave:
		spawn_enemy()

func _on_enemy_death(enemy):
	enemies_killed += 1 
	emit_signal("enemies_killed_changed", enemies_killed, enemies_to_kill)
	
	print(enemies_killed)
	if enemies_killed == enemies_to_kill:
		print("you can now open ne noor")
		door.enemies_all_killed = true
