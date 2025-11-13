extends Panel

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label
@onready var Canvaslayer = get_node("../..")

signal PanelAndObject
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

func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_END:
		if is_drag_successful():
			if texture_rect.texture:
				for objects in LEVELS.items_per_level[LEVELS.level]:
					if texture_rect.texture.load_path == load(objects.image).load_path:
						Canvaslayer.getObject(objects)
			else:
				Canvaslayer.getObject(null)

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
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
