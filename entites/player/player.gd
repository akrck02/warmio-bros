extends CharacterBody2D


@onready var sprite : Sprite2D = $Sprite
@onready var animation : AnimationPlayer = $AnimationPlayer

@export var speed : float = 1
@export var gravity : float = 1
@export var jump : float = 1

const JUMP_BASE_SPEED : float = -600.0;
const BASE_SPEED : float = 400.0;

func _ready() -> void:
	animation.play("move")
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = _get_jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		
		if direction > 0: sprite.flip_h = true
		else: sprite.flip_h = false
		
		velocity.x = direction * _get_speed()
	else:
		velocity.x = move_toward(velocity.x, 0, _get_speed())

	move_and_slide()

func boost_jump(value : float) -> void:
	velocity.y = _get_jump() * value
	move_and_slide()

func _get_speed() -> float:
	return BASE_SPEED * speed

func _get_jump() -> float:
	print(JUMP_BASE_SPEED * jump) 
	return JUMP_BASE_SPEED * jump
