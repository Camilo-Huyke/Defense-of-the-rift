extends State

func update_physics(_delta: float):
	if player:
		player.direction = (player.navigation_agent.get_next_path_position() - player.global_position).normalized()
		if player.navigation_agent.is_navigation_finished(): #player.global_position.distance_to(player.target_postion) < 2:
			player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
			player.velocity.y = move_toward(player.velocity.y, 0, player.speed)
			transitioned.emit(self, "IdleState")
		else:
			player.velocity.x = player.direction.x * player.speed
			player.velocity.y = player.direction.y * player.speed
			if player.direction.x > 0:
				player.sprite.flip_h = true
			else:
				player.sprite.flip_h = false
		
		player.move_and_slide()
