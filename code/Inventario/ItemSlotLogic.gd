extends Panel

@onready var texture_rect: TextureRect = $TextureRect
@onready var candado: TextureRect = $Candado
@onready var label: Label = $Label

func _get_drag_data(at_position: Vector2) -> Variant:
	if texture_rect.texture == null || label == null:
		return
	var preview = duplicate()
	var trasfer = Control.new()
	trasfer.add_child(preview)
	preview.position -= Vector2(25,25)
	preview.rotation_degrees = -15
	preview.self_modulate = Color.TRANSPARENT
	trasfer.modulate = Color(trasfer.modulate,0.5)
	texture_rect.hide()
	label.hide()
	set_drag_preview(trasfer)
	return [texture_rect,label]

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	if texture_rect.texture || candado.visible!=true:
		return true
	else:
		return false

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
