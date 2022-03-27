extends Area

func _on_ClickArea_input_event(camera, event, click_position, normal, shape_idx):
	if GameManager.game_over != true:
		GameManager.player.new_target(click_position)

