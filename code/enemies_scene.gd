extends Node2D

var actualPosition
var type
const TYPES_PEOPLE = ["moto", "cobre", "resorte", "testigo", "client"]
const ENEMIES_ROUTES = {
	"moto": [
		"avenida",
		"esquina",
		"vereda",
		"calle_escape",
		"screamer"
	],

	"cobre": [
		"poste",
		"zanja",
		"medidor",
		"cableado",
		"screamer"
	],

	"resorte": [
		"parada",
		"estacion",
		"feria",
		"galeria",
		"screamer"
	],

	"testigo": [
		"reja",
		"pasillo",
		"patio",
		"ventana",
		"screamer"
	]
}

const FRIEND_ROUTE = ["reja"]

func moveEnemy(typ:String = self.type) -> Array:
	return ENEMIES_ROUTES[typ][randi() % len(ENEMIES_ROUTES[typ])]
func get_type():
	return self.type
func _ready() -> void:
	self.actualPosition = moveEnemy()[0]
	self.type = TYPES_PEOPLE.slice(0, len(TYPES_PEOPLE)-2).pick_random()
