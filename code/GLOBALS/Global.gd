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
	for enemy in enemies:
		enemy.type = enemy_scene.instantiate().TYPES_PEOPLE[index]
		print(get_node("/GameManager/enemies"))
		index+=1
		
func show_enms():
	for enm in get_tree().current_scene.get_node("enemies").get_children():
		print("Enemigos: ", enm)
