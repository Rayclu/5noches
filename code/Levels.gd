extends Node
var InitialMoney= 5000 # ECONOMY._get_money()
var assets = {"pan":"","coca":"","alfajor":"","fiambre":"","agua":""}
var dificulty = 1
var level = 1
var items_per_level = { 1:[CrteFd("pan",100,assets["pan"],11),CrteFd("coca",200,assets["coca"],12),CrteFd("alfajor",200,assets["alfajor"],20),CrteFd("fiambre",200,assets["fiambre"],300),CrteFd("agua",200,assets["agua"],40)],2:[],3:[],4:[]} #a definir items con claudio

func changeStats(IndexValue):
	InitialMoney*=IndexValue

func PassDificulty(new):
	dificulty+=new

func CrteFd(name,value,img,stock):
	print(items_per_level)
	return comida.new().updateValues(name,value,img,stock)
