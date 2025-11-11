extends GridContainer

func _ready() -> void:
	UpdateGridWitClass()
	
func UpdateGridWitClass():
	var i = 0
	for Classitem in LEVELS.items_per_level[LEVELS.level]:
		var itemSlot = self.get_child(i).get_children()
		print(itemSlot)
