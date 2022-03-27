extends Label

var score = 0

func _process(delta):
	if(GameManager.game_over != true):
		score+=1
		set_text(String(score))
