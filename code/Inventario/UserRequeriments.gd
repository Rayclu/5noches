extends GridContainer

var lista =[{ "name": "cafe", "ref":LEVELS.CrteFd("pizza",100,"res://assets/cafe.png",10), "CuSelect": 3, "totalPrice": 100, "img": "res://assets/cafe.png" },{ "name": "pizza", "ref":LEVELS.CrteFd("pizza",100,"res://assets/pizza.png",10), "CuSelect": 5, "totalPrice": 100, "img": "res://assets/pizza.png" }]

func _process(delta: float) -> void:
	UpdatePanels()
	
func UpdatePanels():
	var i = 0
	for child in get_children():
		if len(lista) == i:
			return
		var Items = get_child(i).get_children()
		child.get_children()[0].texture = load(lista[i]["ref"].image)
		child.get_children()[1].text = str(lista[i]["CuSelect"])
		var normal = StyleBoxFlat.new()
		normal.bg_color = Color(0.3,0.3,0.3)
		normal.set_corner_radius_all(20)
		child.add_theme_stylebox_override("panel",normal)
		i+=1
