extends Control

@onready var cameras = get_parent().get_node("CameraFeed")
@onready var bttn = get_node("MainButton")

var pressed = true
const Images = {
	"Cam1" : preload("res://assets/Captura de pantalla 2025-09-10 151249.png"),
	"Cam2" : preload("res://assets/Captura de pantalla 2025-09-18 101614.png"),
	"Cam3" : preload("res://assets/Untitled.png")
}

func _ready() -> void:
	bttn.pressed.connect(cameras_load)
	for buttn in self.get_children():
		buttn.pressed.connect(button_just_presed.bind(buttn.name))
				
func button_just_presed(img):
	if img in Images and cameras.texture!=Images[img]:
		cameras.texture = Images[img]
		cameras.expand = true
		cameras.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		cameras.custom_minimum_size = Vector2(700, 400)

func cameras_load():
	
	pressed=!pressed
	
	if !pressed:
		self.position -= Vector2(0,100)
		button_just_presed("Cam1")
	else:
		self.position += Vector2(0,100)
		cameras.texture = null
		
	
