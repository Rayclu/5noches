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
		i+=1

func UpdateValues():
	var ObjectSelected = get_node("../../..").RefObj
	var panelInv = get_parent().get_parent().get_children()[0]
	if panelInv.texture_rect.texture != null :
		if panelInv.texture_rect.visible != false:
			if ObjectSelected:
				panelInv.label.text = str(ObjectSelected.stock) #canvaslayer
