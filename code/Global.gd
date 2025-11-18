extends Node
@onready var gameManager = $"."
var enemy_scene = preload("res://scenes/enemiesScene.tscn")
var resorte = enemy_scene.instantiate()
var moto = enemy_scene.instantiate()
var testigo = enemy_scene.instantiate()
var cable = enemy_scene.instantiate()
var enemies = [resorte, moto, testigo, cable]


func set_types() -> void:
	var index = 0 
	# Obtener la escena actual y comprobar si tiene el nodo "enemies"
	var current_scene = get_tree().current_scene
	var enemies_node = null
	if current_scene and current_scene.has_node("enemies"):
		enemies_node = current_scene.get_node("enemies")
	for enemy in enemies:
		enemy.type = enemy_scene.instantiate().TYPES_PEOPLE[index]
		if enemies_node:
			print(enemies_node)
			show_enms()
			
		else:
			print("set_types: nodo 'enemies' no existe en la escena actual")
		index+=1
		
func show_enms():
	var current_scene = get_tree().current_scene
	var enemies_node = null
	var enms_children = null
	if current_scene and current_scene.has_node("enemies"):
		enemies_node = current_scene.get_node("enemies")
		enms_children = enemies_node.get_children()
		for enem in enms_children:
			print("Enemigo: ",enem.type)
