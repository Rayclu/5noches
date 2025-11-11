extends Panel
func _process(delta: float) -> void:
	if Input.get_current_cursor_shape() == CURSOR_FORBIDDEN:
		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)
var data_bk
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
	if what == Node.NOTIFICATION_DRAG_END:
		if !is_drag_successful():
			if data_bk:
				for data in data_bk:
					data.show()
					data_bk=null
					
#ya termine de hacer todo el diseño pero me faltaria añadir en base a los objetos creados
# por la clase añadirlos en el nivel con su respectivo stock, eto
