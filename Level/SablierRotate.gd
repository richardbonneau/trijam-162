extends Spatial


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_x(deg2rad(3))
	rotate_z(deg2rad(3))

func _on_Area_body_entered(body):
	if body.name == "Spaceship":
		GameManager.add_time()
		GameManager.spawn_timer()
		$AudioStreamPlayer.play()
		$Area.queue_free()
		$Cone.queue_free()
		$Cylinder.queue_free()
		$Cylinder2.queue_free()



func _on_AudioStreamPlayer_finished():
	queue_free()
