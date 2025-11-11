extends Panel

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label

func _get_drag_data(at_position: Vector2) -> Variant:
	if texture_rect.texture == null || label == null:
		return
	
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	preview.position -= Vector2(25,25)
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate,0.5)
	texture_rect.hide()
	label.hide()
	set_drag_preview(c)
	return [texture_rect,label]

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
	
