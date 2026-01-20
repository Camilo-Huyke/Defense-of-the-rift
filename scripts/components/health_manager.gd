extends Node

signal init_health

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _init_health():
	init_health.emit(player.max_health)
