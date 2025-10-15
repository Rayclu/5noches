extends Node2D
@onready var CAMERAS = get_node("CanvasLayer/cam_texture")
@onready var BUTTONS = get_node("CanvasLayer/buttons")

const IMAGES = {
	"Cam1" : preload("res://assets/Screenshot from 2025-10-14 15-17-53.png"),
	"Cam2" : preload("res://assets/Untitled.jpeg"),
	"Cam3" : preload("res://assets/images.jpeg")
}

func _ready() -> void:
	for buttn in BUTTONS.get_children():
		buttn.pressed.connect(button_just_presed.bind(buttn.name))

func button_just_presed(img):
	if img in IMAGES and CAMERAS.texture!=IMAGES[img]:
		CAMERAS.texture = IMAGES[img]
		
