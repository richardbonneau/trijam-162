extends Label

var score = 0

func _process(delta):
	score+=1
	set_text(String(score))
