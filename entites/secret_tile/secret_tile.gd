extends StaticBody2D

@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var jump_area : Area2D = $JumpArea
@export var enabled : bool = true

enum SecretType {
	Gloonda,
	Coin
}

@export var secret_type : SecretType = SecretType.Gloonda

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jump_area.body_entered.connect(show_secret)


func show_secret(actor : Node2D) -> void:
	
	if not enabled:
		return
	
	enabled = false
	animation.play("show")
	
	var scene = load(_get_current_secret_scene_path())
	var node = scene.instantiate()
	node.position = Vector2(position.x, position.y - 84)
	get_parent().call_deferred(&'add_child', node)
	
	print("secret for %s" % actor.name)
	pass

func _get_current_secret_scene_path() -> String:
	match secret_type:
		SecretType.Gloonda:
			return 'res://entites/enemies/nodes/gloonda/gloonda.tscn'

	return 'res://entites/coin/coin.tscn'
