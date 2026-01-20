extends Control

@export var parent_sprite: Sprite2D

@onready var timer = $Timer
@onready var health_bar = $Health
@onready var damage_bar = $Damage

var health: int = 0
var prev_health: int = 0

func set_max_health():
	health_bar.max_value = health
	damage_bar.max_value = health
	
func set_health(new_health):
	prev_health = health
	health = min(health_bar.max_value, new_health)
	health_bar.value = health
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func init_health(_health):
	health = _health
	
	health_bar.max_value = health
	damage_bar.max_value = health
	
	health_bar.value = health
	damage_bar.value = health
	
func _on_timer_timeout() -> void:
	damage_bar.value = health
