extends Node
class_name Cliente
var nombre
var requeriments
var asset
#fiar futura implementacion
static func CreateInstance(name,listOfReq,image):
	var cliente = Cliente.new()
	cliente.nombre = name
	cliente.asset = image
	cliente.requeriments = listOfReq
	return cliente


func comprar():
	pass
