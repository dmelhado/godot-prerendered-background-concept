extends Node3D

@export var player_node_path: NodePath
var player: Node = null

func _ready():
	player = get_node(player_node_path)

func _on_trigger_area_entered(area: Area3D) -> void:
	pass # Replace with function body.


func _on_trigger_body_entered(body: Node3D) -> void:
	print(body)
	if body == player:
		var angles = get_parent()
		if angles.has_method("set_active_camera"):
			angles.set_active_camera(self)
	pass # Replace with function body.
	
func activate_camera():
	$Camera.current = true
	$background.visible = true
	pass
	
func disable_camera():
	$Camera.current = false
	$background.visible = false
	pass
