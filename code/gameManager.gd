extends Node
const NIGHTS_MOVEMENT = {
	1: 30,
	2: 50,
	3: 70,
	4: 90,
	"Custom": 99
}

@onready var CAMS = $cameras
@onready var enemies_node = $enemies
@onready var minigames_node = $minigames

var people_scene = preload("res://scenes/peopleScene.tscn")
var enemy_scene = preload("res://scenes/enemiesScene.tscn")

var current_night: int = 1
var energy: int = 100
var money: int = 0

var enemies: Array = []

#func _ready() -> void:
#	_spawn_enemies(4)
#	_count_enemy_types()

func _spawn_enemies(amount: int) -> void:
	for i in range(amount):
		var enemy_instance = enemy_scene.instantiate()
		enemies_node.add_child(enemy_instance)
		enemies.append(enemy_instance)

func kill_children(node) -> void:
	for child in node.get_children():
		child.queue_free()
		
func _count_enemy_types() -> void:
	while true:
		var types = {
			"moto": 0,
			"resorte": 0,
			"testigo": 0,
			"cables": 0
		}
		for enemy in enemies:
			var enemy_type = enemy.get_enemy()
			if enemy_type in types:
				types[enemy_type] += 1

		var count = 0
		for type in types:
			if types[type] > 0:
				count += 1

		if count == 4:
			print("Conteo de enemigos:", types)
			break

		print("No hay 4 tipos distintos, regenerando enemigos...")
		kill_children($enemies)
		enemies.clear()
		_spawn_enemies(4)
		print("Enemigos regenerados")
		for enem in $enemies.get_children():
			print(enem.get_enemy())

func can_move_enemies() -> bool:
	var movement_chance = NIGHTS_MOVEMENT.get(current_night, 30)
	return randi_range(0, 100) <= movement_chance

func instantiate_mini_play() -> void:
	if not minigames_node:
		push_error("No se encontró el nodo 'minigames'")
		return
	print("Instanciando minijuego...")

func _process(delta: float) -> void:
	for enemy in enemies:
		if can_move_enemies():
			enemy.move() if enemy.has_method("move") else null
