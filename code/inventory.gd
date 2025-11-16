extends Panel

var data_bk

func _process(delta: float) -> void: #i guess que cambia el estilo del cursor 
	if Input.get_current_cursor_shape() == CURSOR_FORBIDDEN:
		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)

func _notification(what: int): #funcion que se encargar de handlear el mal drop de los elementos
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
	if what == Node.NOTIFICATION_DRAG_END:
		if not is_drag_successful():
			if data_bk:
				for data in data_bk:
					data.show()
					data_bk=null
