extends Area

func _on_ClickArea_input_event(camera, event, click_position, normal, shape_idx):
	GameManager.player.new_target(click_position)

