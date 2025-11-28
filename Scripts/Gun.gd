extends Node2D
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
	
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y *= -1
	else:
		scale.y *= 1

func fire():
	if(_time_since_last_shot >= fire_rate) and !_is_reloading and _ammo_in_mag > 0:
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.damage = damage
		bullet_instance.rotation = rotation
		bullet_instance.global_position = shoot_pos.global_position
		_time_since_last_shot = 0
		_ammo_in_mag -= 1
	elif(_ammo_in_mag == 0):
		reload()

func reload():
	if _is_reloading:
		return
	print("is now reloading...")
	_is_reloading = true
	await get_tree().create_timer(reload_time).timeout
	
	_ammo_in_mag = mag_size
	_is_reloading = false
	print("weapon now reloaded...")
