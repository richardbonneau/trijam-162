extends KinematicBody


func got_killed():
	$AudioStreamPlayer.play()
	$Area.queue_free()
	$MissileMesh.queue_free()
	$CollisionShape.queue_free()

func _process(delta):
	if GameManager.game_over != true:
		var player_pos = GameManager.player.get_global_transform()
		look_at(player_pos.origin, Vector3.UP)
		var velocity = (player_pos.origin - get_global_transform().origin).normalized()
		move_and_collide(velocity * rand_range(1, 3) * delta)

func _on_Area_body_entered(body):
	if body.name == "Spaceship":
		GameManager.game_over()
		$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	queue_free()
