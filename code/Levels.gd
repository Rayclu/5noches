extends Node
var InitialMoney= 5000 # ECONOMY._get_money()
var dificulty = 1
var level = 1
var items_per_level = { 1:[comida.new().updateValues(100,"res://assets/Captura de pantalla 2025-09-10 151249.png",10),"pan","queso","alfajores"],2:[],3:[],4:[]} #a definir items con claudio
func changeStats():#IndexValue
	items_per_level[1][0].printe()
	#InitialMoney*=IndexValue
	
func PassDificulty(new):
	dificulty+=new
