extends Node
# a futura implementacion. solo planteo la idea

signal OpenMenu
signal OpenInventory
signal OpenCameras
var image 
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == 69: #e
			image = get_viewport().get_texture().get_image()
			get_tree().change_scene_to_file("res://scenes/Inventory.tscn")
			emit_signal("OpenInventory")
		if event.keycode == 4194305:#Esc
			print(emit_signal("OpenMenu"))
		if Input.is_action_just_pressed("Shift + C"):
			print(emit_signal("OpenCameras"))
