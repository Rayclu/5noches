extends Node

signal OpenMenu
signal OpenCameras
var image 
var InventoryActive = false
var InventoryFinished
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_action_just_pressed("e") && !InventoryActive: #e
			InventoryActive=true
			image = get_viewport().get_texture().get_image()
			get_tree().change_scene_to_file("res://scenes/Inventory.tscn")
			
			
		if event.keycode == 4194305:#Esc
			print(emit_signal("OpenMenu"))
		if Input.is_action_just_pressed("Shift + C"):
			print(emit_signal("OpenCameras"))
