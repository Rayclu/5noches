extends Node
#--------------------------------------------------------------
signal GameReady
signal ScreamerAlert
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
var HUD = preload("res://scenes/HUD.tscn")
#--------------------------------------------------------------
var current_night: int = 1
var energy: int = 100
var money: int = 0
var timer: Timer
#--------------------------------------------------------------

#--------------------------------------------------------------
func _ready() -> void:
	Global.set_types()
	Global.show_enms()
	$player.add_child(HUD.instantiate())
	$time.add_child(Timer.new())
	timer = $time.get_child(0)
	timer.one_shot = false
	timer.start(2)
	timer.connect("timeout", Callable(self, "move"))
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
	print("Instanciando minijuego...")
#--------------------------------------------------------------
func move():
	print("Se intentó mover a los enemigos...")
	for enemy in Global.enemies:
		if enemy.getActualPos() == "screamer":
			self.ScreamerAlert.emit()
			print("Perdiste.")
			get_tree().current_scene.queue_free()
		var movemente_res  = can_move_enemies()
		print("Se puede mover el enemigo? ", movemente_res)
		if movemente_res:
			enemy.MoveToNextUbitacion()
			if enemy.actualPosition == "screamer":
				print("Enemigo preparando el screamer") 
#-------------------------------------------------------------
func LightsOut():
	$".".get_child(10).get_child(0).outLights()
#-------------------------------------------------------------
func _process(delta: float) -> void:
	Global.show_enms()
	
