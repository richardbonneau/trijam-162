extends Spatial

export (NodePath) var target_gate

onready var landing_area = $LandingArea

func _on_TeleportArea_body_entered(body):
	if body.name == "Spaceship":
		var landing_area_coordinates = get_node(target_gate).landing_area.get_global_transform()
		body.set_global_transform(landing_area_coordinates)


