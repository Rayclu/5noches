extends GridContainer

@onready var RequerimetsList = CLIENT.requeriments

func _process(delta: float) -> void:
	
	UpdatePanels()

func UpdatePanels():
	var i = 0
	RequerimetsList = CLIENT.requeriments
	for child in get_children():
		if len(RequerimetsList) == i:
			return
		var Items = get_child(i).get_children()
		child.get_children()[0].texture = load(RequerimetsList[i].image)
		child.get_children()[1].text = str(RequerimetsList[i].stock)
		var normal = StyleBoxFlat.new()
		normal.bg_color = Color(0.3,0.3,0.3)
		normal.set_corner_radius_all(20)
		child.add_theme_stylebox_override("panel",normal)
		i+=1
