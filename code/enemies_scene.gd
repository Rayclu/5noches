extends Node2D
signal turnOffLights
var actualPosition
var type
var enemies
const TYPES_PEOPLE = ["moto", "cobre", "resorte", "testigo", "client"]
const ENEMIES_ROUTES = {
	"moto": [
		"avenida",
		"esquina",
		"frente",
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
		"puerta",
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
var previousPos: String = "hola"


func moveEnemy(index = -1) -> Array:
	actualPosition = ENEMIES_ROUTES[type][( randi() % len(ENEMIES_ROUTES[type]) ) if (index == -1) else  index ] 
	return actualPosition
func get_enemy():
	return type
	
func getActualPos():
	return self.actualPosition
	
func init_enemy(t:String):
	type = t

func MoveToNextUbitacion():
	if self.type == "cobre":
		var route = ENEMIES_ROUTES[self.type]
		if(self.actualPosition == null):
			self.actualPosition = route[0]
		self.previousPos = self.actualPosition
		for i in range(len(route)):
			if self.actualPosition == route[i] and self.actualPosition.to_lower() != "screamer":
				self.actualPosition = route[i+1]
				break
			if (self.type == "cobre") and (self.actualPosition == "medidor") :
				turnOffLights.emit()
