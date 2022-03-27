extends KinematicBody


func got_killed():
	queue_free()

func _process(delta):
	var player_pos = GameManager.player.get_global_transform()
	look_at(player_pos.origin, Vector3.UP)
	var velocity = (player_pos.origin - get_global_transform().origin).normalized()
	move_and_collide(velocity * rand_range(1, 3) * delta)

