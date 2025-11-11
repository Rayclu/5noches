extends Node
var InitialMoney= 5000 # ECONOMY._get_money()
var assets = {"pan":"","coca":"","alfajor":"","fiambre":"","agua":""}
var dificulty = 1
var level = 1
var items_per_level = { 1:[CrteFd("pan",100,assets["pan"],10),CrteFd("coca",200,assets["coca"],10),CrteFd("alfajor",200,assets["alfajor"],10),CrteFd("fiambre",200,assets["fiambre"],10),CrteFd("agua",200,assets["agua"],10)],2:[],3:[],4:[]} #a definir items con claudio

func changeStats(IndexValue):
	InitialMoney*=IndexValue

func PassDificulty(new):
	dificulty+=new

func CrteFd(name,value,img,stock):
	return comida.new().updateValues(name,value,img,stock)
