extends GridContainer
 
func _process(delta: float) -> void:
	UpdatePanels()
	
func UpdatePanels():
	var listaElementsChosed = get_node("../../..").LIST_OF_ELEMENTS_SELECTEDS
	if len(listaElementsChosed) == 0:
		return
	else: 
		var i = 0
		for child in get_children():
			if len(listaElementsChosed) == i:
				return
			var Items = get_child(i).get_children()
			print(listaElementsChosed,"holaaa#")
			child.get_children()[0].texture = load(listaElementsChosed[i]["img"])
			child.get_children()[1].text = str(listaElementsChosed[i]["CuSelect"])
			var normal = StyleBoxFlat.new()
			normal.bg_color = Color(0.3,0.3,0.3)
			normal.set_corner_radius_all(20)
			child.add_theme_stylebox_override("panel",normal)
			i+=1
