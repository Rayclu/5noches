extends Node
#--------------------------------------------------------------
signal GameReady
#--------------------------------------------------------------
const NIGHTS_MOVEMENT = {
	1: 30,
	2: 50,
	3: 70,
	4: 90,
	"Custom": 99
}
#--------------------------------------------------------------
@onready var CAMS = $cameras
@onready var enemies_node = $enemies
@onready var minigames_node = $minigames
#--------------------------------------------------------------
var people_scene = preload("res://scenes/peopleScene.tscn")
var enemy_scene = preload("res://scenes/enemiesScene.tscn")
#--------------------------------------------------------------
var current_night: int = 1
var energy: int = 100
var money: int = 0
#--------------------------------------------------------------
func _ready() -> void:
	Global.set_types()
	$player.add_child()
#--------------------------------------------------------------
func kill_children(node) -> void:
	for child in node.get_children():
		child.queue_free()
#--------------------------------------------------------------
func can_move_enemies() -> bool:
	var movement_chance = NIGHTS_MOVEMENT.get(current_night, 30)
	return randi_range(0, 100) <= movement_chance
#--------------------------------------------------------------
func instantiate_mini_play() -> void:
	if not minigames_node:
		push_error("No se encontró el nodo 'minigames'")
		return
	print("Instanc iando minijuego...")
#-------------------------------------------------------------
func _process(delta: float) -> void:
	Global.show_enms()
	for enemy in Global.enemies:
		if can_move_enemies():
			enemy.move()
			if enemy.getPos() == Global.ofice:
				var children = $"."/enemies.get_children()
				
				pass
		
