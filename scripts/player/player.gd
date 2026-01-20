extends CharacterBody2D
class_name Player

#Components
@onready var camera: Camera2D = $Camera2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var health_manager: Node = $HealthManager
@onready var health_bar:Control = $HealthBar
@export var sprite: Sprite2D

#Properties
var direction: Vector2 = Vector2()
var target_postion: Vector2 = Vector2()
var current_health: int

#Stats
@export var speed: float 
@export var max_health: int

func _ready() -> void:
	health_manager.init_health.connect(health_bar.set_health)
	
	while true:
		if health_manager.is_node_ready() and health_manager.is_node_ready():
			health_manager._init_health()
			break
		
