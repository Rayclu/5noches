extends Node

var requeriments:Array
var client:Cliente

func ChoseElementsToBuy():
	requeriments = []
	randomize()
	var ActualLevel = LEVELS.level
	var Elements
	var xd = []
	if ActualLevel == 1:
		Elements = randi_range(1,int((ActualLevel*1.5)+0.5))
	else:
		Elements = randi_range(int((ActualLevel/2)+0.5),int((ActualLevel*1.5)+0.5))
		
	for i in range(0,Elements):
		var continiu = 0
		var Name = LEVELS.availableFoodPerLevel[ActualLevel][randi_range(0,len(LEVELS.availableFoodPerLevel[ActualLevel])-1)]
		var CuantityOfElements = randi_range(int(ActualLevel),int(ActualLevel*2))
		var image = LEVELS.assets[Name]
		var Cost = LEVELS.priceOfThings[Name]
		for food in requeriments:
			if food.name == Name:
				food.stock+=CuantityOfElements
				continiu+=1
				break
		if continiu==0:
			var ref = LEVELS.CrteFd(Name,Cost,image,CuantityOfElements)
			requeriments.append(ref)
#	for req in requeriments:
#		print(req.name)

func CreateClient():
	ChoseElementsToBuy()
	client = Cliente.CreateInstance("pepe",requeriments,"gaga")
	


func defineStoleProv():
	pass
