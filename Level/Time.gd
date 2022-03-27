extends Label

var total_timer = 30

func _ready():
	GameManager.define_time_label(self)

func _process(delta):
	text = String(total_timer)

func _on_Timer_timeout():
	if GameManager.game_over != true:
		total_timer -= 1
		$Timer.start()
		if total_timer < 1:
			GameManager.game_over()
			$AudioStreamPlayer.play()

