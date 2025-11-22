extends Node
class_name Gun

@export var damage : int
@export var gun_name : String
@export var fire_rate : float
@export var reload_time : float
@export var mag_size : int
@export var bullet : PackedScene

@export var shoot_pos : Marker2D

@export var sprite : Sprite2D

#variabler som håller koll på sak
var _time_since_last_shot : float
var _ammo_in_mag : int
var _is_reloading : bool = false

func _ready() -> void:
	#sätter ammot till max antal ammo vapnet kan ha
	_ammo_in_mag = mag_size

func _process(delta: float) -> void:
	#räknar antal sekunder sedan senaste skottet sköts, för att hålla koll på fire-rate
	_time_since_last_shot += delta

func fire():
	#if(_time_since_last_shot >= fire_rate):
	var bullet_instance = bullet.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = shoot_pos.global_position
	print("fire!!!!")
