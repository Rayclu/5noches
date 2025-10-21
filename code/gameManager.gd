extends Node
var camScene = preload("res://scenes/cameraScene.tscn")
var peopleScene = preload("res://scenes/peopleScene.tscn") 
var player_HUD = preload("res://scenes/HUD.tscn")
@onready var CAMS = $cameras
@onready var ENTITIES = $enemies

var current_night: int = 1
var energy:int
const ENEMIES_difficult = {
	"1": 30,
	"2": 50,
	"3": 70,
	"4": 90,
	"Custom": 99
}
var ENEMIES: Dictionary = {
	
} 
var money: int
var timer
var ImDead: bool
var EnemsDict:Dictionary
func move_enemies() -> bool: 
	return ENEMIES_difficult[current_night] <= (randi_range(0, ENEMIES_difficult[str(current_night)]))


func _process(delta: float) -> void:
	for enem in ENEMIES: 
		if(move_enemies()):
			
			pass
		else:
			pass
		
	
func FFP() -> bool:
	return self.ImDead
func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = 300
	timer.one_shot = true
	timer.autostart = true
	add_child(timer)
	get_node("player").add_child(player_HUD.instantiate())
	var n:int
	while(true):
		if (n==0):
			break
		var exec_code = generate_enemies()
		if exec_code == 0:
			break
		
	

func generate_enemies() -> int:
	var enems = []
	for i in range(0, 4):
		var new_elem = peopleScene.instantiate()
		if not (new_elem in enems):
			enems.push_back(new_elem)
		else: 
			i-=1
			
	while (true):
		var cl = peopleScene.instantiate()
		get_node("npcs").add_child(cl) if cl.get_type() == "client" else null
		if (get_node("npcs").get_child_count() != 0):
			break
	get_node("enemies").add_child(enems)
	print_tree()
	return 0

func player_won_night(curr_n):
	queue_free()
	print("congrats!, you won this night")

func _on_Timer_timeout():
	player_won_night(current_night)
	
func chargeCams():
	var camsNode = get_node("cameras")
	if (camsNode == null):
		var QUEMIERDAESGAGAHIJODEPUTAPONENOMBRESNORMALESPORFAVORTELOPIDO_JDKSJDKSJDKSJDKSJDKSDJK = camScene.instantiate()
		#Acá no termino de entender en que nodo debo de agregar lso hijos
		get_node("").add_child(QUEMIERDAESGAGAHIJODEPUTAPONENOMBRESNORMALESPORFAVORTELOPIDO_JDKSJDKSJDKSJDKSJDKSDJK)
	else:
		camsNode.queue_free()
