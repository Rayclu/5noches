extends Panel

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label
@onready var Canvaslayer = get_node("../..")
#var yoQueMierdaSe 

#func _process(delta: float) -> void:
#	yoQueMierdaSe = LEVELS.ClientRqueriment

func _get_drag_data(at_position: Vector2) -> Variant:
	if texture_rect.texture == null || label == null:
		return
	var preview = duplicate()
	var trasfer = Control.new()
	trasfer.add_child(preview)
	preview.position -= Vector2(300,300)
	preview.rotation_degrees = -15
	preview.self_modulate = Color.TRANSPARENT
	trasfer.modulate = Color(trasfer.modulate,0.5)
	texture_rect.hide()
	label.hide()
	set_drag_preview(trasfer)
	return [texture_rect,label]

func _notification(what: int): #funcion que utilizo para poder globalziar la referencia del objeto seleccionado asi me permite obtenerlo.
	if what == Node.NOTIFICATION_DRAG_END:
		if is_drag_successful():
			if texture_rect.texture:
				for objects in LEVELS.InventoryPerLevel[LEVELS.level]:
					if texture_rect.texture.load_path == load(objects.image).load_path:
						Canvaslayer.getObject(objects)
			else:
				Canvaslayer.getObject(null)

func _can_drop_data(_at_position: Vector2, _data: Variant):#funcionq eu utilizo para verificar si las imagenes de lo que pide el usuario es igual al el objeto seleccionado, en caso de que no no le permite volcar el objeto al panel.
#	var equalityChecker = 0
#	for element in yoQueMierdaSe:
#		if _data[0].texture.load_path != load(element["ref"].image).load_path:
#			equalityChecker+=1
#	if equalityChecker == len(yoQueMierdaSe):
#		return false
#	else:
		return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var temp = texture_rect.texture
	var labl = label.text
	texture_rect.show()
	label.show()
	label.text = data[1].text
	data[1].text = labl
	texture_rect.texture = data[0].texture
	data[0].texture = temp
	data[0].show()
	data[1].show()
