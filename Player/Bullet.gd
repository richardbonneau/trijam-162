extends Area

export var muzzle_velocity = 250

var velocity = Vector3.ZERO

func _physics_process(delta):
	var forward_dir = global_transform.basis.z.normalized()
	global_translate(-forward_dir * muzzle_velocity * delta)


func self_destruct():
	queue_free()

func _on_Timer_timeout():
	self_destruct()

func _on_Bullet_body_entered(body):
	if(body.is_in_group("Enemies")):
		body.got_killed()
		queue_free()
