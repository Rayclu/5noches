extends Cliente
class_name Cleptomano
var cantObjStoled:int
var probStole:int
var robar:bool

static func CreateInstances(name,listOfReq,image,CuantityStold,probablysotol,stol):
	var cleptomano = Cleptomano.new()
	cleptomano.nombre = name
	cleptomano.asset = image
	cleptomano.requeriments = listOfReq
	cleptomano.cantObjStoled = CuantityStold
	cleptomano.probStole = probablysotol
	cleptomano.robar = stol
	return cleptomano

func stole():
	pass
