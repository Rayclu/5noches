extends Node
# a futura implementacion. solo planteo la idea

signal OpenMenu
signal OpenInventory
signal OpenCameras

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == 69: #e
			emit_signal("OpenInventory")
		if event.keycode == 4194305:#Esc
			emit_signal("OpenMenu")
		if Input.is_action_just_pressed("Shift + C"):
			emit_signal("OpenCameras")
