extends Node

var game = preload("res://Level/Game.tscn")

var current_game

func _ready():
	GameManager.define_main(self)
	restart()


func restart():
	if current_game:
		current_game.queue_free()
	current_game = game.instance()
	add_child(current_game)
