extends Node2D

@onready var marker_2d: Marker2D = $Marker2D
const BULLET = preload("uid://c4k4fboi6i6bl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360) # Låser rotationen mellan 0 och 360 grader
	
	# Gör att vapnet inte är uppochner när man kollar vänster
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.rotation = rotation
