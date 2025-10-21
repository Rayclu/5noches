extends Node
var InitialMoney=5000#+ economy.money
var dificulty = 1

func changeStats(IndexValue):
	InitialMoney*=IndexValue
	
func PassDificulty(new):
	dificulty+=new
#me queda hacer que cuando se gaste
#o añada plata salga unas texturas verdes/rojas. asi le da mas dinamismo jaja
