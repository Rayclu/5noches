extends Node
var moneyPerLevel = {1:1000,2:2500,3:4500,4:7000}
var InitialMoney= 5000
var dificulty = 1
var level = 1
var priceOfThings = {"pan":100,"coca":250,"alfajor":200,"fiambre":300,"soda":150,"galletitas":200,"caramelos":50,"empanada":300,"sanguche":400,"pizza":500,"cafe":200}
var availableNamesFood =["galletitas","caramelos","empanada","sanguche","pizza","cafe"]
var assets = {"pan":"res://assets/pan.png","coca":"res://assets/coca-removebg-preview.png","alfajor":"res://assets/alfajor.png","fiambre":"res://assets/fiambre.png","soda":"res://assets/soda.png","galletitas":"res://assets/Galletitas.png","caramelos":"res://assets/caramelos.png","empanada":"res://assets/empanada.png","sanguche":"res://assets/sanguche.png","pizza":"res://assets/pizza.png","cafe":"res://assets/cafe.png"}
#arrays rellenos por codigo 😘
var availableFoodPerLevel = {}
var InventoryPerLevel = {}

func _ready() -> void: #utilizo ready para llenar los diccionarios
	ConfigArray()
	ConfigInvLevel()
	PassLevel()

func ConfigArray():
	availableFoodPerLevel.set(1,["pan","coca","alfajor","fiambre","soda"])
	for i in range(1,4):
		var listPush:Array = availableFoodPerLevel.get(i).duplicate()
		listPush.append_array([availableNamesFood[0],availableNamesFood[1]])
		
		availableNamesFood.pop_front()
		availableNamesFood.pop_front()
		
		availableFoodPerLevel.set(i+1,listPush)

func ConfigInvLevel():#choclazo puto que me crea la lsita de inventarios por cada nivel. dios me amapre :god_bless_me
	for i in range(1,5):
		var frsElem = []
		for item in availableFoodPerLevel.get(i):
			var nombre = item
			var value = priceOfThings[nombre]
			var img = assets[nombre]
			var stock = i * 5
			var ref = CrteFd(nombre,value,img,stock)
			frsElem.append(ref)
		InventoryPerLevel.set(i,frsElem)

func PassLevel():
	if level==4:
		return
		
	var stockPrev = InventoryPerLevel[level].map(func(obj): return obj.stock)
	var listElmentsMatch = InventoryPerLevel[level+1 if level+1 <= 4 else 4].filter(func(obj):
		return availableFoodPerLevel[level].any(func(name): return obj.name == name))

	var i = 0 
	for element in listElmentsMatch:
		element.stock += stockPrev[i]
	level += 1
func changeStats(IndexValue):
	InitialMoney*=IndexValue

func PassDificulty(new):
	dificulty+=new

func CrteFd(nombre,money,img,stock):
	return comida.new().updateValues(nombre,money,img,stock)
