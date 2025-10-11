extends Node2D

var actualPosition
var type
var PossibleTypeOfEnemy = {
	"moto": [],
	"cobre": [],
	"resorte": [],
	"testigo": [] # <-- acá tendrían que ir las camaras en las que pueden aparecer, creo
}

func moveEnemy(typ:String):
	return PossibleTypeOfEnemy[typ][randi() % len(PossibleTypeOfEnemy[typ])]
func _ready() -> void:
	
	var num = randi() % 100
	
	#type = 
	actualPosition = moveEnemy(self.typ) if num >= 50 else PossibleTypeOfEnemy[type][0]
	pass
