extends Node

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed(&'exit'):
		get_tree().quit()
		
	if Input.is_action_just_pressed(&'reset'):
		get_tree().reload_current_scene()
