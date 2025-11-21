extends Node
#--------------------------------------------------------------
signal GameReady
signal ScreamerAlert
signal ScreamerResponse(response)
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
var timerScreamer: Timer
#--------------------------------------------------------------
func _ready() -> void:
	Global.set_types()
	Global.show_enms()
	$player.add_child(HUD.instantiate())
	$time.add_child(Timer.new())
	timer = $time.get_child(0)
	timerScreamer = Timer.new()
	timer.one_shot = false
	timer.start(0.5)
	timer.connect("timeout", Callable(self, "move"))
	timerScreamer.one_shot = true
	ScreamerAlert.connect(Callable(self, "on_ScreamerAlert"))
	timerScreamer.timeout.connect(Callable(self, "TimerEnd"))
	ScreamerResponse.connect(Callable(self, "ScreamerExecution"))
#--------------------------------------------------------------
func hola():
		print("-----------------------\n Hola mundo! \n -----------------------")
func TimerEnd():
	var nodeHost = get_node("/root/HUD")
	var bttn = Button.new()
	prints("bttn.has_signal(pressed) ->", bttn.has_signal("pressed")) 
	bttn.pressed.connect(Callable(self, "hola"))
	print(bttn.pressed)
	nodeHost.add_child(bttn)
	if (bttn.button_pressed == true):
		pass
	ScreamerResponse.emit(false)
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
func move():
	ScreamerAlert.emit()
	return
	print("Se intentó mover a los enemigos...")
	for enemy in Global.enemies:
		if enemy.getActualPos() == "screamer":
			ScreamerAlert.emit()
			print("Perdiste.----")
			get_tree().current_scene.queue_free()
		var movemente_res  = can_move_enemies()
		print("Se puede mover el enemigo? ", movemente_res)
		if movemente_res:
			enemy.MoveToNextUbitacion()
			if enemy.actualPosition == "screamer":
				print("Enemigo preparando el screamer") 
#-------------------------------------------------------------

func on_ScreamerAlert():
	print("Hola, soy ScreameAlert")
	timerScreamer.timeout.emit()
	
#-------------------------------------------------------------
func ScreamerExecution(res):
	print("Hola, soy ScreamerExecution")
	match res:
		true:
			print("Debería de morir------------------------------------")
		false: 
			print("No debería de morir")
		_:
			print("Err. The screamer doesn't answered")
	return
	#-------------------------------------------------------------
func LightsOut():
	get_node("/root/HUD").outLights()
	$".".get_child(10).get_child(0).outLights()
#-------------------------------------------------------------
func _process(delta: float) -> void:
	Global.show_enms()
	#rints(ScreamerResponse.has_connections(),ScreamerResponse.is_connected(Callable(self,"ScreamerExecution")))
	
	
