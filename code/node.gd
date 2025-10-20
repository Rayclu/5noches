extends Node

signal add_money(amount)
signal spend_money(amount)

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		print(event)
		var gaga = event.keycode
		if gaga == 43 && gaga != null && event.pressed==false:
			emit_signal("add_money",800) 
		elif gaga == 45 && gaga != null && event.pressed==false:
			emit_signal("spend_money",40)
