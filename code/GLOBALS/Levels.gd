extends Node
var moneyPerLevel = {1:1000,2:2500,3:4500,4:7000}
var InitialMoney= 5000 # ECONOMY._get_money()
var assets = {"pan":"res://assets/pan.png","coca":"res://assets/coca-removebg-preview.png","alfajor":"res://assets/alfajor.png","fiambre":"res://assets/fiambre.png","soda":"res://assets/soda.png","galletitas":"res://assets/Galletitas.png","caramelos":"res://assets/caramelos.png","empanada":"res://assets/empanada.png","sanguche":"res://assets/sanguche.png","pizza":"res://assets/pizza.png","cafe":"res://assets/cafe.png"}
var dificulty = 1
var level = 2
var ClientRqueriment
var items_per_level = { 1:[CrteFd("pan",100,assets["pan"],11),CrteFd("coca",200,assets["coca"],12),CrteFd("alfajor",200,assets["alfajor"],20),CrteFd("fiambre",200,assets["fiambre"],300),CrteFd("soda",200,assets["soda"],40)]
,2:[CrteFd("pan",100,assets["pan"],11),CrteFd("caramelos",100,assets["caramelos"],11),CrteFd("empanada",100,assets["empanada"],11),CrteFd("galletitas",100,assets["galletitas"],11),
CrteFd("sanguche",100,assets["sanguche"],11),CrteFd("pizza",100,assets["pizza"],11),CrteFd("cafe",100,assets["cafe"],11)],3:[],4:[]} #a definir items con claudio

#func _process(delta: float) -> void:
#	ClientRqueriment = get_node("/root/Control/CanvasLayer/ClientRequeriments/MarginContainer/GridContainer").lista
func changeStats(IndexValue):
	InitialMoney*=IndexValue

func PassDificulty(new):
	dificulty+=new

func CrteFd(nombre,value,img,stock):
	return comida.new().updateValues(nombre,value,img,stock)
