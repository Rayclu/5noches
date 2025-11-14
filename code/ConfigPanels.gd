extends GridContainer


func _ready() -> void:
	AddGridWitClass()

func _process(delta: float) -> void:
	UpdateValues()

func AddGridWitClass():
	var i = 0
	for Classitem in LEVELS.items_per_level[LEVELS.level]:
		var itemSlot = get_child(i).get_children()
		itemSlot[0].texture = load(Classitem.image)
		itemSlot[1].text = str(Classitem.stock)
		itemSlot[2].hide()
		var normal = StyleBoxFlat.new()
		normal.bg_color = Color(0.3,0.3,0.3)
		normal.set_corner_radius_all(15)
		get_child(i).add_theme_stylebox_override("panel",normal)
		i+=1

	for child in get_children():
		if child.get_child(0).texture==null:
			var normal = StyleBoxFlat.new()
			normal.bg_color = Color(0.05,0.05,0.05) # gris oscuro
			child.add_theme_stylebox_override("panel",normal)

func UpdateValues():
	var ObjectSelected = get_node("../../..").RefObj
	var panelInv = get_parent().get_parent().get_children()[0]
	if panelInv.texture_rect.texture != null :
		if panelInv.texture_rect.visible != false:
			if ObjectSelected:
				panelInv.label.text = str(ObjectSelected.stock) #canvaslayer
