extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_all_angles()
	pass # Replace with function body.

func set_active_camera(angle: Node3D):
	hide_all_angles()
	if(angle.has_method("activate_camera")):
		angle.activate_camera()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func hide_all_angles() -> void:
	for angle in get_children(false):
		if(angle.has_method("disable_camera")):
			angle.disable_camera()
	pass
