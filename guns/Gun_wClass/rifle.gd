extends Gun
class_name Rifle

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		fire()
