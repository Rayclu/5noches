extends Node

var enemy_scene = preload("res://scenes/enemiesScene.tscn")
var resorte = enemy_scene.instantiate()
var moto = enemy_scene.instantiate()
var testigo = enemy_scene.instantiate()
var cable = enemy_scene.instantiate()
var enemies = [resorte, moto, testigo, cable]

func set_types() -> void:
	var index = 0 
	var enemies_node = get_node("/root/gameManager/enemies")	
	for enemy in enemies:
		enemy.type = enemy_scene.instantiate().TYPES_PEOPLE[index]
		# Usa la ruta correcta: /root es la raíz del árbol de escenas
		if enemies_node != null:
			print("Nodo enemies encontrado: ", enemies_node)
			enemies_node.add_child(enemy)
			print(enemies_node.get_children())
		else:
			print("Error: nodo enemies no encontrado")
		index+=1
		
func show_enms():
	# Asegúrate de que la escena esté cargada antes de acceder
	var current_scene = get_tree().current_scene
	if current_scene and current_scene.has_node("enemies"):
		for enm in current_scene.get_node("enemies").get_children():
			print("Enemigos: ", enm)
	else:
		print("Error: nodo enemies no existe en la escena actual")