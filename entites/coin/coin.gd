extends Node2D

@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var area_2d : Area2D = $CollectArea

func _ready() -> void:
	animation.play("idle")
	area_2d.body_entered.connect(gather)

func gather(node : Node2D) -> void: 
	
	if node.is_in_group("Player"):
		print("Coin gathered")
		queue_free()
