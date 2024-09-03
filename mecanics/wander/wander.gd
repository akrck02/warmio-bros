extends Node2D

@export var actor : CharacterBody2D
@export var speed : float = 170.0
@onready var latest_position : Vector2 = actor.position
var direction = 1


func _physics_process(delta: float) -> void:
	
	if not actor:
		return
	
	# Add the gravity.
	if not actor.is_on_floor():
		actor.velocity += actor.get_gravity() * delta
	
	if latest_position == actor.position:
		direction = -direction

	actor.velocity.x = direction * speed
	latest_position = actor.position
	actor.move_and_slide()
