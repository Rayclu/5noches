extends Node
var enemy_scene = preload("res://scenes/enemiesScene.tscn")

var resorte = enemy_scene.instantiate()
var moto = enemy_scene.instantiate()
var testigo = enemy_scene.instantiate()
var cable = enemy_scene.instantiate()

var enemies = [resorte, moto, testigo, cable]

func set_types() -> void:
	var index = 0 
	for enemy in enemies:
		print("Enemigo: ", enemy.get_enemy())
		enemy.type = enemy_scene.instantiate().TYPES_PEOPLE[index]
		index+=1
func show_enms():
	for enm in enemies:
		print(enm)
