extends Node
var peopleSacene = preload("res://scenes/peopleScene.tscn") 
var scene = load("res://Minigames/Scenes/Buttons_minigames.tscn")
@onready var CAMS = $cameras
var current_night: int = 1
var energy:int
const ENEMIES = {
	"1": 30,
	"2": 50,
	"3": 70,
	"4": 90,
	"Custom": 99
}
var enemies = [] 
var money: int

func move_enemies() -> bool: 
	return 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print("hola")
		get_tree().change_scene_to_packed(scene)
	for enem in ENEMIES: 
		if(move_enemies()):
			
			pass
		else:
			pass
