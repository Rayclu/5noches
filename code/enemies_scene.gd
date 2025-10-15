extends Node2D

var actualPosition
var type
const TYPES_PEOPLE = ["moto", "cobre", "resorte", "testigo", "client"]
const ENEMIES_ROUTES = {
	"moto": ["esquina","reja","screamer"], # <-- screamer = partida perdida
	"cobre": ["","","screamer"],
	"resorte": ["screamer"],
	"testigo": ["screamer"] # <-- acá tendrían que ir las camaras en las que pueden aparecer, creo
}
const FRIEND_ROUTE = ["reja"]
var Actual_ubication = ""


func moveEnemy(typ:String) -> Array:
	return ENEMIES_ROUTES[typ][randi() % len(ENEMIES_ROUTES[typ])]
func _ready() -> void:
	var num = randi() % 100
	#actualPosition = moveEnemy(self.typ) if num >= 50 else ENEMIES_ROUTES[type][0]
	self.actualPosition = moveEnemy(self.type)[0]
