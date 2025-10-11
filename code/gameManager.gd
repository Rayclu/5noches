extends Node

var camScene = preload("res://scenes/cameraScene.tscn")
@onready var CAMS = $cameras
var current_night = 1
var energy = 100
var difficulty = 1.0

func _ready() -> void:
	#for i in range(0, 2):
		$cameras.add_child(camScene.instantiate())
	
