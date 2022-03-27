extends Timer

func _on_MissileSpawnTimer_timeout():
	GameManager.spawn_missile()
	start()
