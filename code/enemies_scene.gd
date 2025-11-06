extends Node2D

var actualPosition
var type
var enemies
const TYPES_PEOPLE = ["moto", "cobre", "resorte", "testigo", "client"]
const ENEMIES_ROUTES = {
	"moto": ["reja","screamer"], # <-- screamer = partida perdida
	"cobre": ["","","screamer"],
	"resorte": ["", "screamer"],
	"testigo": ["","screamer"] # <-- acá tendrían que ir las camaras en las que pueden aparecer, creo
}
const FRIEND_ROUTE = ["reja"]
var Actual_ubication = ""


func moveEnemy(index = -1) -> Array:
	actualPosition = ENEMIES_ROUTES[type][( randi() % len(ENEMIES_ROUTES[type]) ) if (index == -1) else  index ] 
	return actualPosition
func get_enemy():
	return type

func get_actualPos():
	return Actual_ubication
	
func init_enemy(t:String):
	type = t
#func _ready() -> void:
	#type = 
	#type = TYPES_PEOPLE[randi() % 4]
	#print("enemy type ", type)
	#moveEnemy(self.type, 0)
	
	
