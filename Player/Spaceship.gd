extends KinematicBody

var Bullet = preload("res://Player/Bullet.tscn")
export var speed = 5
export var gravity = -5

var target = null
var velocity = Vector3.ZERO
var can_shoot = true

func _enter_tree():
	GameManager.define_player(self)

func new_target(t):
	target = t

func _physics_process(delta):
#	Moving
	velocity.y += gravity * delta
	if target:
		look_at(target, Vector3.UP)
		rotation.z = 0
		velocity = -transform.basis.z * speed
		if transform.origin.distance_to(target) < .5:
			target = null
			velocity = Vector3.ZERO
	if Input.is_mouse_button_pressed(2): velocity = move_and_slide(velocity, Vector3.UP)

func _input(event):
	if Input.is_mouse_button_pressed(1) and can_shoot:
		print("shooting")
		$AudioStreamPlayer.play()
		can_shoot = false
		$Timer.start()
		var b = Bullet.instance()
		b.global_transform = $BulletSpawner.global_transform
		GameManager.main.add_child(b)

func _on_Timer_timeout():
	can_shoot = true
