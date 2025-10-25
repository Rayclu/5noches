extends Node
var peopleSacene = preload("res://scenes/peopleScene.tscn") 
var manigames = preload("res://")
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

func _ready() -> void:
	#for i in range(0, 2):
	self.energy = 100
	self.money = 0
	

func can_move_enemies() -> bool: 
	return ENEMIES[str(current_night)] <= (randi_range(0, ENEMIES[str(current_night)]))

func instantiate_mini_play():
	var node = get_node("minigames")
	
	
func _process(delta: float) -> void:
	for enem in ENEMIES: 
		if(can_move_enemies()):
			
			pass
		else:
			pass
