extends Node

var missile = preload("res://Enemy/Enemy.tscn")
var timer = preload("res://Level/Sablier.tscn")


var game_over = false

var marker
var player
var main
var time_label
var timer_spawners
var missile_spawners
var game_over_ui

func define_main(m):
	main = m

func define_player(p):
	player = p

func define_marker(m):
	marker = m

func define_time_label(l):
	time_label = l

func define_timer_spawners(s):
	timer_spawners = s

func define_missile_spawners(s):
	missile_spawners = s

func define_game_over_ui(ui):
	game_over_ui = ui

func spawn_missile():
	var total_spawners = missile_spawners.get_children().size()
	var selected_spawner = missile_spawners.get_child(rand_range(0,total_spawners))
	var m = missile.instance()
	m.global_transform = selected_spawner.global_transform
	main.current_game.add_child(m)

func spawn_timer():
	var total_spawners = timer_spawners.get_children().size()
	var selected_spawner = timer_spawners.get_child(rand_range(0,total_spawners))
	var t = timer.instance()
	t.global_transform = selected_spawner.global_transform
	main.current_game.add_child(t)

func add_time():
	time_label.total_timer += 5

func game_over():
	print("GAMEOVER")
	game_over = true
	game_over_ui.visible = true
	player.queue_free()

func restart():
	print("restart")
	main.restart()
	game_over = false

