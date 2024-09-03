extends CharacterBody2D

@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var weak_area : Area2D = $WeakArea
@onready var hurt_area : Area2D = $HurtArea

const SPEED = 170.0
@onready var latest_position : Vector2 = position
var direction = 1

func _ready() -> void:
	animation.play("idle")
	weak_area.body_entered.connect(hurt_self)
	hurt_area.body_entered.connect(hurt_player)

func hurt_self(actor : Node2D):
	if not actor.is_in_group("Player"):
		return 
		
	actor.boost_jump(1)
	queue_free()

func hurt_player(actor : Node2D):
	if not actor.is_in_group("Player"):
		return 
		
	SignalDatabase.player_hurted.emit()


	
