extends Node

signal change_state

@export var player: Player

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_RIGHT:
			get_mouse_pos()
	if event is InputEventKey and event.is_pressed():
		pass
		
func get_mouse_pos():
	var mouse_pos = player.get_global_mouse_position()
	
	#player.target_postion = mouse_pos
	player.navigation_agent.target_position = mouse_pos
	change_state.emit("WalkState")
